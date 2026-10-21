output "cluster_name" {
  value = aws_eks_cluster.this.name
}

output "kubeconfig_command" {
  description = "Run this to point kubectl at the new cluster"
  value       = "aws eks update-kubeconfig --region ${var.region} --name ${aws_eks_cluster.this.name}"
}
