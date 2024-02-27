resource "aws_s3_bucket" "data_bucket" {
  bucket = "my-bucket"



}

resource "aws_s3_bucket_cors_configuration" "cors" {
    bucket = aws_s3_bucket.data_bucket.bucket
    cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["PUT", "POST", "GET", "DELETE", "HEAD"]
    allowed_origins = ["*"]
    expose_headers  = []

  }

}

resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.data_bucket.bucket
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Sid" : "Stmt1625306057759",
        "Principal" : "*",
        "Action" : "s3:*",
        "Effect" : "Allow",
        "Resource" : "arn:aws:s3:::my-bucket"
      }
    ]
  })
}

resource "aws_rds_cluster" "postgresql_cluster" {
  cluster_identifier      = "my-postgresql-cluster"
  engine                  = "aurora-postgresql"
  master_username         = "mydbuser"
  master_password         = "mydbpassword"
  engine_version     = "13.4"

}

resource "aws_rds_cluster_instance" "cluster_instances" {
  count              = 1 # Number of instances in the cluster
  identifier         = "aurora-cluster-instance-${count.index}"
  cluster_identifier = aws_rds_cluster.postgresql_cluster.id
  instance_class     = "db.t3.small" # Choose the instance class according to your needs
  engine             = "aurora-postgresql"
  engine_version     = "13.4" # Must match the cluster's engine version
}
