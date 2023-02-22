module "gitops_repo" {
  source = "github.com/cloud-native-toolkit/terraform-tools-gitops?ref=v1.23.3"

  branch = var.gitops_repo_branch
  debug = var.debug
  gitea_host = var.gitops_repo_gitea_host
  gitea_org = var.gitops_repo_gitea_org
  gitea_token = var.gitops_repo_gitea_token
  gitea_username = var.gitops_repo_gitea_username
  gitops_namespace = var.gitops_repo_gitops_namespace
  host = var.gitops_repo_host
  org = var.gitops_repo_org
  project = var.gitops_repo_project
  public = var.gitops_repo_public
  repo = var.gitops_repo_repo
  sealed_secrets_cert = var.gitops_repo_sealed_secrets_cert
  server_name = var.gitops_repo_server_name
  strict = var.gitops_repo_strict
  token = var.gitops_repo_token
  type = var.gitops_repo_type
  username = var.gitops_repo_username
}
module "gitops-mas-core" {
  source = "github.com/cloud-native-toolkit/terraform-gitops-mas-core?ref=v1.0.0"

  catalog_name = module.gitops-toolkit-catalog.name
  entitlement_key = var.gitops-mas-core_entitlement_key
  git_credentials = module.gitops_repo.git_credentials
  gitops_config = module.gitops_repo.gitops_config
  kubeseal_cert = module.gitops_repo.sealed_secrets_cert
  mas_channel = var.gitops-mas-core_mas_channel
  mas_instance_id = var.gitops-mas-core_mas_instance_id
  mas_workspace_id = var.gitops-mas-core_mas_workspace_id
  mas_workspace_name = var.gitops-mas-core_mas_workspace_name
  mongodb_storage_class = module.util-storage-class-manager.block_storage_class
  server_name = module.gitops_repo.server_name
  uds_contact_email = var.gitops-mas-core_uds_contact_email
  uds_contact_first_name = var.gitops-mas-core_uds_contact_first_name
  uds_contact_last_name = var.gitops-mas-core_uds_contact_last_name
  uds_storage_class = module.util-storage-class-manager.block_storage_class
}
module "gitops-mas-cp4d" {
  source = "../../../.."

  core_namespace = module.gitops-mas-core.namespace
  cpd_metadata_storage_class = module.util-storage-class-manager.rwo_storage_class
  cpd_primary_storage_class = module.util-storage-class-manager.rwx_storage_class
  git_credentials = module.gitops_repo.git_credentials
  gitops_config = module.gitops_repo.gitops_config
  ibm_entitlement_secret = module.gitops-mas-core.entitlement_secret_name
  kubeseal_cert = module.gitops_repo.sealed_secrets_cert
  mas_instance_id = module.gitops-mas-core.mas_instance_id
  server_name = module.gitops_repo.server_name
}
module "gitops-toolkit-catalog" {
  source = "github.com/cloud-native-toolkit/terraform-gitops-toolkit-catalog?ref=v1.0.0"

  git_credentials = module.gitops_repo.git_credentials
  gitops_config = module.gitops_repo.gitops_config
  server_name = module.gitops_repo.server_name
}
module "util-clis" {
  source = "cloud-native-toolkit/clis/util"
  version = "1.18.2"

  bin_dir = var.util-clis_bin_dir
  clis = var.util-clis_clis == null ? null : jsondecode(var.util-clis_clis)
}
module "util-storage-class-manager" {
  source = "github.com/cloud-native-toolkit/terraform-util-storage-class-manager?ref=v1.0.3"

  block_storage_class = var.util-storage-class-manager_block_storage_class
  file_storage_class = var.util-storage-class-manager_file_storage_class
  rwo_storage_class = var.util-storage-class-manager_rwo_storage_class
  rwx_storage_class = var.util-storage-class-manager_rwx_storage_class
}
