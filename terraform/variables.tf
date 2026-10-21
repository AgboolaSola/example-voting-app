variable "region" {
  description = "AWS region for the cluster"
  type        = string
  default     = "eu-north-1"
}

variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
  default     = "voting-app"
}

variable "node_instance_type" {
  description = "Worker node size. Must be Free plan eligible (e.g. m7i-flex.large, t3.small)"
  type        = string
  default     = "m7i-flex.large"
}

variable "node_count" {
  description = "Number of worker nodes"
  type        = number
  default     = 2
}
