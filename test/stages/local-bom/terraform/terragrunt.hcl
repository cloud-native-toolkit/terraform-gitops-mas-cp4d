
include "root" {
  path = find_in_parent_folders()
}



dependency "gitops" {
  config_path = "${get_parent_terragrunt_dir()}/200-openshift-gitops/terraform"
  skip_outputs = false

  mock_outputs_allowed_terraform_commands = ["validate", "init", "plan", "destroy", "output"]
  mock_outputs = {
    gitops_repo_config_host = ""
    gitops_repo_config_org = ""
    gitops_repo_config_name = ""
    gitops_repo_config_project = ""
    gitops_repo_config_username = ""
    gitops_repo_config_token = ""
  }
}

dependency "storage" {
  config_path = "${get_parent_terragrunt_dir()}/210-ibm-odf-storage/terraform"
  skip_outputs = false

  mock_outputs_allowed_terraform_commands = ["validate", "init", "plan", "destroy", "output"]
  mock_outputs = {
    gitops-ibm-odf_rwx_storage_class = ""
    gitops-ibm-odf_rwo_storage_class = ""
    gitops-ibm-odf_file_storage_class = ""
    gitops-ibm-odf_block_storage_class = ""
  }
}


inputs = {
    gitops_repo_host = dependency.gitops.outputs.gitops_repo_config_host
    gitops_repo_org = dependency.gitops.outputs.gitops_repo_config_org
    gitops_repo_repo = dependency.gitops.outputs.gitops_repo_config_name
    gitops_repo_project = dependency.gitops.outputs.gitops_repo_config_project
    gitops_repo_username = dependency.gitops.outputs.gitops_repo_config_username
    gitops_repo_token = dependency.gitops.outputs.gitops_repo_config_token
    util-storage-class-manager_rwx_storage_class = dependency.storage.outputs.gitops-ibm-odf_rwx_storage_class
    util-storage-class-manager_rwo_storage_class = dependency.storage.outputs.gitops-ibm-odf_rwo_storage_class
    util-storage-class-manager_file_storage_class = dependency.storage.outputs.gitops-ibm-odf_file_storage_class
    util-storage-class-manager_block_storage_class = dependency.storage.outputs.gitops-ibm-odf_block_storage_class
}
