variable "vpc_id" {
  description = "The VPC ID to launch the instance in."
  type        = string
}

variable "environment" {
  description = "The environment where the EC2 instance will be launched."
  type        = string
}

variable "customer" {
  description = "The customer name."
  type        = string
}

variable "project" {
  description = "The project name."
  type        = string
}

variable "ami_id" {
  description = "The AMI ID to use for the EC2 instance."
  type        = string
}

variable "instance_type" {
  description = "The type of EC2 instance to launch."
  type        = string
}

variable "security_group_ids" {
  description = "A list of security group IDs to associate with the EC2 instance."
  type        = list(string)
  default     = [""]
}

variable "key_name" {
  description = "The name of the SSH key pair to use for the EC2 instance."
  type        = string
}

variable "subnet_id" {
  description = "The subnet ID to launch the EC2 instance in."
  type        = string
}
