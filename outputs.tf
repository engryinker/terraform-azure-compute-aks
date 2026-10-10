output "aks_clusters" {
  description = "Map (same keys as var.aks_clusters) of every output from each AKS (managed Kubernetes) clusters created -- see upstream module docs for the full shape."
  value       = module.aks_cluster
}
