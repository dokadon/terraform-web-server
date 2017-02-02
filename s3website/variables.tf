# required for AWS
variable "region" {
    default = "us-west-1"
}

# specific to our site
variable "root_domain" {
    default = "any-domain-name.com"
}

variable "website_bucket_subdomain" {
    default = "www"
}

