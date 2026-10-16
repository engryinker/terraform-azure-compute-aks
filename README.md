# terraform-azure-compute-aks

Org-standard Terraform wrapper for: **AKS (managed Kubernetes) clusters**.

Deploys into an existing resource group (passed in via `resource_group_name` / `location`) -- this module does not create the resource group itself. Compose with [terraform-azure-naming](https://github.com/engryinker/terraform-azure-naming) for names and [terraform-azure-tags](https://github.com/engryinker/terraform-azure-tags) for the `tags` input.

## Usage

```hcl
module "compute-aks" {
  source = "git::https://github.com/engryinker/terraform-azure-compute-aks.git?ref=v1.0.0"

  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
  tags                = module.tags.tags

  aks_clusters = {
    example = {
      # see Inputs below -- every field upstream supports, see linked AVM module docs for the full schema
    }
  }
}
```

See [`examples/basic`](examples/basic) for a minimal runnable (zero-instance) example.

## Inputs

Beyond the standard `resource_group_name`, `location`, `tags`, `enable_telemetry` module-level variables, each map variable below mirrors its upstream AVM module's inputs 1:1 (fields typed `any` carry complex nested upstream schemas -- see the linked module docs):

### `aks_clusters` (AKS (managed Kubernetes) clusters)

Wraps [Azure/avm-res-containerservice-managedcluster/azurerm](https://registry.terraform.io/modules/Azure/avm-res-containerservice-managedcluster/azurerm/0.8.4) v0.8.4.

| Field | Type | Required | Notes |
| --- | --- | --- | --- |
| `name` | `string` | yes | Resource name. |
| `bootstrap_profile` | `any` | no |  |
| `fqdn_subdomain` | `string` | no |  |
| `role_assignments` | `any` | no |  |
| `storage_profile` | `any` | no |  |
| `alert_email` | `string` | no |  |
| `onboard_alerts` | `bool` | no |  |
| `addon_profile_key_vault_secrets_provider` | `any` | no |  |
| `kind` | `string` | no |  |
| `metrics_profile` | `any` | no |  |
| `node_provisioning_profile` | `any` | no |  |
| `private_link_resources` | `any` | no |  |
| `agent_pools` | `any` | no |  |
| `aad_profile` | `any` | no |  |
| `agentpool_timeouts` | `any` | no |  |
| `disk_encryption_set_id` | `string` | no |  |
| `linux_profile` | `any` | no |  |
| `service_mesh_profile` | `any` | no |  |
| `ignore_body_changes` | `any` | no |  |
| `windows_profile` | `any` | no |  |
| `network_profile` | `any` | no |  |
| `auto_scaler_profile` | `any` | no |  |
| `diagnostic_settings` | `any` | no |  |
| `prometheus_workspace_id` | `string` | no |  |
| `addon_profile_azure_policy` | `any` | no |  |
| `kubernetes_version` | `string` | no |  |
| `public_network_access` | `string` | no |  |
| `windows_profile_password_version` | `string` | no |  |
| `api_server_access_profile` | `any` | no |  |
| `default_agent_pool` | `any` | no |  |
| `private_endpoints` | `any` | no |  |
| `sku` | `any` | no |  |
| `onboard_monitoring` | `bool` | no |  |
| `disable_local_accounts` | `bool` | no |  |
| `ingress_profile` | `any` | no |  |
| `private_endpoints_manage_dns_zone_group` | `bool` | no |  |
| `service_principal_profile` | `any` | no |  |
| `http_proxy_config` | `any` | no |  |
| `managed_identities` | `any` | no |  |
| `resource_types` | `any` | no |  |
| `addon_profile_ingress_application_gateway` | `any` | no |  |
| `addon_profile_oms_agent` | `any` | no |  |
| `identity_profile` | `any` | no |  |
| `pod_identity_profile` | `any` | no |  |
| `maintenanceconfiguration` | `any` | no |  |
| `enable_rbac` | `bool` | no |  |
| `retry` | `any` | no |  |
| `timeouts` | `any` | no |  |
| `upgrade_settings` | `any` | no |  |
| `create_agentpools_before_destroy` | `bool` | no |  |
| `extended_location` | `any` | no |  |
| `node_resource_group` | `string` | no |  |
| `security_profile` | `any` | no |  |
| `addon_profiles_extra` | `any` | no |  |
| `auto_upgrade_profile` | `any` | no |  |
| `dns_prefix` | `string` | no |  |
| `hosted_system_profile` | `any` | no |  |
| `oidc_issuer_profile` | `any` | no |  |
| `azure_monitor_profile` | `any` | no |  |
| `ai_toolchain_operator_profile` | `any` | no |  |
| `kube_proxy_config` | `any` | no |  |
| `windows_profile_password` | `string` | no |  |
| `addon_profile_confidential_computing` | `any` | no |  |
| `cluster_timeouts` | `any` | no |  |
| `lock` | `any` | no |  |
| `node_resource_group_profile` | `any` | no |  |
| `support_plan` | `string` | no |  |
| `workload_auto_scaler_profile` | `any` | no |  |
| `namespace` | `any` | no |  |
| `tags` | `map(string)` | no | Overrides the module-level `tags` for this entry only. |
| `enable_telemetry` | `bool` | no | Overrides the module-level `enable_telemetry` for this entry only. |

## Outputs

- `aks_clusters` -- map (same keys as the input) of every output from each created AKS (managed Kubernetes) clusters.
