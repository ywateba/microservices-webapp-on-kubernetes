# resource "aws_vpc" "my_vpc" {
#   cidr_block = "10.0.0.0/16"
#   enable_dns_support = true
#   enable_dns_hostnames = true
#   tags = {
#     Name = "my_vpc"
#   }
# }


# resource "aws_subnet" "my_subnet1" {
#   vpc_id            = aws_vpc.my_vpc.id
#   cidr_block        = "10.0.1.0/24"
#   availability_zone = "us-east-1a"
#   tags = {
#     Name = "my_subnet1"
#   }
# }

# resource "aws_subnet" "my_subnet2" {
#   vpc_id            = aws_vpc.my_vpc.id
#   cidr_block        = "10.0.2.0/24"
#   availability_zone = "us-east-1b"
#   tags = {
#     Name = "my_subnet2"
#   }
# }


# resource "aws_db_subnet_group" "my_db_subnet_group" {
#   name       = "my_db_subnet_group"
#   subnet_ids = [aws_subnet.my_subnet1.id, aws_subnet.my_subnet2.id]

#   tags = {
#     Name = "My DB Subnet Group"
#   }
# }

# resource "aws_rds_cluster" "postgresql_cluster" {
#   cluster_identifier      = "my-postgresql-cluster"
#   engine                  = "aurora-postgresql"
#   engine_version          = "11.7"
#   master_username         = "mydbuser"
#   master_password         = "mydbpassword"
#   skip_final_snapshot     = true
#   db_subnet_group_name    = aws_db_subnet_group.my_db_subnet_group.name
#   vpc_security_group_ids  = [aws_security_group.my_sg.id]


# }
