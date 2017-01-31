import unittest
from selenium import webdriver

class WebServerVerify(unittest.TestCase):
    def setUp(self):
        self.driver = webdriver.PhantomJS()
        f = open('public-ip.txt', 'r')
        public_ip = f.read()
        self.host = "http://%s" % public_ip

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
        self.assertIn('Automation for the People', heading.text)

    def tearDown(self):
        self.driver.quit()

if __name__ == "__main__":
    unittest.main(verbosity=2)
