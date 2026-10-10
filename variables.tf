variable "resource_group_name" {
  description = "Name of the existing resource group to deploy every resource in this module call into. This module does not create the resource group itself."
  type        = string
}

variable "location" {
  description = "Azure region for every resource created by this module call."
  type        = string
}

variable "tags" {
  description = "Default tags applied to every resource created by this module call (e.g. the output of terraform-azure-tags). Overridden per-resource by that resource's own `tags` attribute, if set."
  type        = map(string)
  default     = {}
}

variable "enable_telemetry" {
  description = "Default AVM telemetry opt-in/out applied to every resource created by this module call. See https://aka.ms/avm/telemetry. Overridden per-resource by that resource's own `enable_telemetry` attribute, if set."
  type        = bool
  default     = true
}

variable "aks_clusters" {
  description = "Map of AKS (managed Kubernetes) clusters to create, keyed by an arbitrary caller-chosen map key. Mirrors the inputs of Azure/avm-res-containerservice-managedcluster/azurerm v0.8.4 (https://registry.terraform.io/modules/Azure/avm-res-containerservice-managedcluster/azurerm/0.8.4) 1:1 -- see upstream docs for the schema of any field typed `any`. `name`, `tags` and `enable_telemetry` (where present upstream) are handled specially by this wrapper; every other field is passed straight through unmodified."
  type = map(object({
    name                                      = string
    tags                                      = optional(map(string))
    enable_telemetry                          = optional(bool)
    bootstrap_profile                         = optional(any, null)
    fqdn_subdomain                            = optional(string, null)
    role_assignments                          = optional(any, null)
    storage_profile                           = optional(any, null)
    alert_email                               = optional(string, null)
    onboard_alerts                            = optional(bool, null)
    addon_profile_key_vault_secrets_provider  = optional(any, null)
    kind                                      = optional(string, null)
    metrics_profile                           = optional(any, null)
    node_provisioning_profile                 = optional(any, null)
    private_link_resources                    = optional(any, null)
    agent_pools                               = optional(any, null)
    aad_profile                               = optional(any, null)
    agentpool_timeouts                        = optional(any, null)
    disk_encryption_set_id                    = optional(string, null)
    linux_profile                             = optional(any, null)
    service_mesh_profile                      = optional(any, null)
    ignore_body_changes                       = optional(any, null)
    windows_profile                           = optional(any, null)
    network_profile                           = optional(any, null)
    auto_scaler_profile                       = optional(any, null)
    diagnostic_settings                       = optional(any, null)
    prometheus_workspace_id                   = optional(string, null)
    addon_profile_azure_policy                = optional(any, null)
    kubernetes_version                        = optional(string, null)
    public_network_access                     = optional(string, null)
    windows_profile_password_version          = optional(string, null)
    api_server_access_profile                 = optional(any, null)
    default_agent_pool                        = optional(any, null)
    private_endpoints                         = optional(any, null)
    sku                                       = optional(any, null)
    onboard_monitoring                        = optional(bool, null)
    disable_local_accounts                    = optional(bool, null)
    ingress_profile                           = optional(any, null)
    private_endpoints_manage_dns_zone_group   = optional(bool, null)
    service_principal_profile                 = optional(any, null)
    http_proxy_config                         = optional(any, null)
    managed_identities                        = optional(any, null)
    resource_types                            = optional(any, null)
    addon_profile_ingress_application_gateway = optional(any, null)
    addon_profile_oms_agent                   = optional(any, null)
    identity_profile                          = optional(any, null)
    pod_identity_profile                      = optional(any, null)
    maintenanceconfiguration                  = optional(any, null)
    enable_rbac                               = optional(bool, null)
    retry                                     = optional(any, null)
    timeouts                                  = optional(any, null)
    upgrade_settings                          = optional(any, null)
    create_agentpools_before_destroy          = optional(bool, null)
    extended_location                         = optional(any, null)
    node_resource_group                       = optional(string, null)
    security_profile                          = optional(any, null)
    addon_profiles_extra                      = optional(any, null)
    auto_upgrade_profile                      = optional(any, null)
    dns_prefix                                = optional(string, null)
    hosted_system_profile                     = optional(any, null)
    oidc_issuer_profile                       = optional(any, null)
    azure_monitor_profile                     = optional(any, null)
    ai_toolchain_operator_profile             = optional(any, null)
    kube_proxy_config                         = optional(any, null)
    windows_profile_password                  = optional(string, null)
    addon_profile_confidential_computing      = optional(any, null)
    cluster_timeouts                          = optional(any, null)
    lock                                      = optional(any, null)
    node_resource_group_profile               = optional(any, null)
    support_plan                              = optional(string, null)
    workload_auto_scaler_profile              = optional(any, null)
    namespace                                 = optional(any, null)
  }))
  default = {}
}
