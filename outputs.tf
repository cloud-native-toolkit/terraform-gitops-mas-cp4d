
output "name" {
  description = "The name of the module"
  value       = local.name
  depends_on  = [gitops_module.module]
}

output "branch" {
  description = "The branch where the module config has been placed"
  value       = local.application_branch
  depends_on  = [gitops_module.module]
}

output "namespace" {
  description = "The namespace where the module will be deployed"
  value       = local.namespace
  depends_on  = [gitops_module.module]
}

output "server_name" {
  description = "The server where the module will be deployed"
  value       = var.server_name
  depends_on  = [gitops_module.module]
}

output "layer" {
  description = "The layer where the module is deployed"
  value       = local.layer
  depends_on  = [gitops_module.module]
}

output "type" {
  description = "The type of module where the module is deployed"
  value       = local.type
  depends_on  = [gitops_module.module]
}

output "install_cp4d_platform" {
  description = "Flag indicating that the cp4d platform should be installed"
  depends_on  = [gitops_module.module]
  value = var.install_cp4d_platform
}

output "install_watson_studio" {
  description = "Flag indicating that watson studio should be installed"
  depends_on  = [gitops_module.module]
  value = var.install_watson_studio
}

output "install_watson_machine_learning" {
  description = "Flag indicating that watson machine learning should be installed"
  depends_on  = [gitops_module.module]
  value = var.install_watson_machine_learning
}

output "install_analytics_engine" {
  description = "Flag indicating that watson analytics engine should be installed"
  depends_on  = [gitops_module.module]
  value = var.install_analytics_engine
}

output "install_watson_openscale" {
  description = "Flag indicating that watson ai should be installed"
  depends_on  = [gitops_module.module]
  value = var.install_watson_openscale
}

output "install_watson_discovery" {
  description = "Flag indicating that watson discover should be installed"
  depends_on  = [gitops_module.module]
  value = var.install_watson_discovery
}
