import unittest
from selenium import webdriver
from selenium.webdriver.firefox.options import Options

class WebServerVerify(unittest.TestCase):
    def setUp(self):
        options = Options()
        options.headless= True
        self.driver = webdriver.Firefox(options=options)
        f = open('public-ip.txt', 'r')
        public_ip = f.read()
        self.host = "http://%s" % public_ip
        self.jenkins_host = "%s:8080" % self.host        

    def testTitle(self):
        # Get web page
        self.driver.get(self.host)

        # Verify page title
        self.assertIn('Web Server', self.driver.title)

    def testText(self):
        # Get web page
        self.driver.get(self.host)

        # Verify page heading
        heading=self.driver.find_element_by_tag_name('h1')
        self.assertIn('Test Web Server', heading.text)
        
    def testJenkins(self):
        # Get web page
        self.driver.get(self.jenkins_host)

        # Verify page title
        self.assertIn('Sign in [Jenkins]', self.driver.title)       
        
    def tearDown(self):
        self.driver.quit()

if __name__ == "__main__":
    unittest.main(verbosity=2)
