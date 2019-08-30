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

    def testTitle(self):
        self.driver.get(self.host)
        self.assertIn('Web Server', self.driver.title)

    def testText(self):
        self.driver.get(self.host)
        self.assertIn('Web Server', self.driver.title)
        text=self.driver.find_element_by_tag_name('h1')

    def tearDown(self):
        self.driver.quit()

if __name__ == "__main__":
    unittest.main(verbosity=2)
