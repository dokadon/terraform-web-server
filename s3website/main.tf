provider "aws" {
    region     = "${var.region}"
}

resource "aws_s3_bucket" "website" {
    bucket = "${var.website_bucket_subdomain}.${var.root_domain}"
    acl = "public-read"
    website {
        index_document = "index.html"
#        error_document = "404.html"
    }
}

resource "aws_s3_bucket_object" "object" {
    depends_on = ["aws_s3_bucket.website"]
    bucket = "${var.website_bucket_subdomain}.${var.root_domain}"
    key = "index.html"
    source = "./index.html"
    content_type = "text/html"
    etag = "${md5(file("./index.html"))}"
}

data "aws_iam_policy_document" "document" {
    depends_on = ["aws_s3_bucket.website"]
    statement {
        sid        = "AddPerm"
        effect     = "Allow"
        actions    = ["s3:GetObject",]
        resources  = ["arn:aws:s3:::${var.website_bucket_subdomain}.${var.root_domain}/*",]
        principals {
            type = "AWS"
            identifiers = ["*"]
        }
    }
}

resource "aws_s3_bucket_policy" "policy" {
    bucket = "${var.website_bucket_subdomain}.${var.root_domain}"
    policy = "${data.aws_iam_policy_document.document.json}"
}
