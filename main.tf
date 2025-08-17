resource "aws_s3_bucket" "example" {
  bucket = "my-vulnerable-bucket"
  
  # Public read access (security issue)
  acl = "public-read"
}

resource "aws_security_group" "web" {
  name = "web-sg"
  
  # Open to world (security issue)
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  # All traffic outbound
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Hardcoded credentials
provider "aws" {
  access_key = "AKIAIOSFODNN7EXAMPLE"
  secret_key = "wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY"
  region     = "us-east-1"
}
