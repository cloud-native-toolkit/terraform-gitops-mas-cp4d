variable "gitops_default_host" {
  type = string
  description = "the value of gitops_default_host"
  default = ""
}
variable "gitops_default_org" {
  type = string
  description = "the value of gitops_default_org"
  default = ""
}
variable "gitops_default_username" {
  type = string
  description = "the value of gitops_default_username"
  default = ""
}
variable "gitops_default_token" {
  type = string
  description = "the value of gitops_default_token"
  default = ""
}
variable "gitops_default_ca_cert" {
  type = string
  description = "the value of gitops_default_ca_cert"
  default = ""
}
variable "gitops_host" {
  type = string
  description = "The host name of the gitops repository (GitHub, Github Enterprise, Gitlab, Bitbucket, Azure DevOps, and Gitea servers are supported)."
  default = ""
}
variable "gitops_org" {
  type = string
  description = "The organization on the git server where the repsitory will be located. If not provided the org will default to the username."
  default = ""
}
variable "gitops_project" {
  type = string
  description = "The Azure DevOps project in the git server. This value is only applied for Azure DevOps servers."
  default = ""
}
variable "gitops_repo" {
  type = string
  description = "The name of the repository in the org on the git server."
  default = ""
}
variable "gitops_username" {
  type = string
  description = "The username used to access the git server."
  default = ""
}
variable "gitops_token" {
  type = string
  description = "The token used to access the git server."
  default = ""
}
variable "gitops_branch" {
  type = string
  description = "The name of the branch in the gitops repository where the config will be stored."
  default = "main"
}
variable "gitops_server_name" {
  type = string
  description = "The name of the server the configuration with which the configuration will be associated."
  default = "default"
}
variable "gitops_ca_cert" {
  type = string
  description = "The ca certificate used to sign the self-signed certificate used by the git server, if applicable."
  default = ""
}
variable "gitops_ca_cert_file" {
  type = string
  description = "The file containing the ca certificate used to sign the self-signed certificate used by the git server, if applicable."
  default = ""
}
variable "gitops_repo_host" {
  type = string
  description = "The host for the git repository. The git host used can be a GitHub, GitHub Enterprise, Gitlab, Bitbucket, Gitea or Azure DevOps server. If the host is null assumes in-cluster Gitea instance will be used."
  default = ""
}
variable "gitops_repo_type" {
  type = string
  description = "[Deprecated] The type of the hosted git repository."
  default = ""
}
variable "gitops_repo_org" {
  type = string
  description = "The org/group where the git repository exists/will be provisioned. If the value is left blank then the username org will be used."
  default = ""
}
variable "gitops_repo_project" {
  type = string
  description = "The project that will be used for the git repo. (Primarily used for Azure DevOps repos)"
  default = ""
}
variable "gitops_repo_username" {
  type = string
  description = "The username of the user with access to the repository"
  default = ""
}
variable "gitops_repo_token" {
  type = string
  description = "The personal access token used to access the repository"
  default = ""
}
variable "gitops_repo_gitea_host" {
  type = string
  description = "The host for the default gitea repository."
  default = ""
}
variable "gitops_repo_gitea_org" {
  type = string
  description = "The org/group for the default gitea repository. If not provided, the value will default to the username org"
  default = ""
}
variable "gitops_repo_gitea_username" {
  type = string
  description = "The username of the default gitea repository"
  default = ""
}
variable "gitops_repo_gitea_token" {
  type = string
  description = "The personal access token used to access the repository"
  default = ""
}
variable "gitops_repo_repo" {
  type = string
  description = "The short name of the repository (i.e. the part after the org/group name)"
}
variable "gitops_repo_branch" {
  type = string
  description = "The name of the branch that will be used. If the repo already exists (provision=false) then it is assumed this branch already exists as well"
  default = "main"
}
variable "gitops_repo_public" {
  type = bool
  description = "Flag indicating that the repo should be public or private"
  default = false
}
variable "gitops_repo_gitops_namespace" {
  type = string
  description = "The namespace where ArgoCD is running in the cluster"
  default = "openshift-gitops"
}
variable "gitops_repo_server_name" {
  type = string
  description = "The name of the cluster that will be configured via gitops. This is used to separate the config by cluster"
  default = "default"
}
variable "gitops_repo_sealed_secrets_cert" {
  type = string
  description = "The certificate/public key used to encrypt the sealed secrets"
  default = ""
}
variable "gitops_repo_strict" {
  type = bool
  description = "Flag indicating that an error should be thrown if the repo already exists"
  default = false
}
variable "debug" {
  type = bool
  description = "Flag indicating that debug loggging should be enabled"
  default = false
}
variable "util-clis_bin_dir" {
  type = string
  description = "The directory where the clis should be downloaded. If not provided will default to ./bin"
  default = ""
}
variable "util-clis_clis" {
  type = string
  description = "The list of clis that should be made available in the bin directory. Supported values are yq, jq, igc, helm, argocd, rosa, gh, glab, and kubeseal. (If not provided the list will default to yq, jq, and igc)"
  default = "[\"yq\",\"jq\",\"igc\"]"
}
variable "gitops-mas-core_entitlement_key" {
  type = string
  description = "The entitlement key used to access the Maximo Application Suite images in the container registry. Visit https://myibm.ibm.com/products-services/containerlibrary to get the key"
}
variable "gitops-mas-core_mas_channel" {
  type = string
  description = "The name of the channel where the container images should be pulled (e.g. 8.8.x)"
  default = "8.8.x"
}
variable "gitops-mas-core_mas_instance_id" {
  type = string
  description = "The identifier for the MAS instance"
  default = "inst1"
}
variable "gitops-mas-core_mas_workspace_id" {
  type = string
  description = "The identifier for the workspace that will be created within the MAS instance"
  default = "masdev"
}
variable "gitops-mas-core_mas_workspace_name" {
  type = string
  description = "The name of the workspace that will be created within the MAS instance"
  default = "MAS Development"
}
variable "gitops-mas-core_uds_contact_email" {
  type = string
  description = "The email address of the contact person for UDS"
}
variable "gitops-mas-core_uds_contact_first_name" {
  type = string
  description = "The first name of the contact person for UDS"
}
variable "gitops-mas-core_uds_contact_last_name" {
  type = string
  description = "The last name of the contact person for UDS"
}
variable "util-storage-class-manager_rwx_storage_class" {
  type = string
  description = "The storage class to use for Read-Write-Many volumes"
}
variable "util-storage-class-manager_rwo_storage_class" {
  type = string
  description = "The storage class to use for Read-Write-One volumes"
}
variable "util-storage-class-manager_file_storage_class" {
  type = string
  description = "The storage class to use for File storage volumes"
}
variable "util-storage-class-manager_block_storage_class" {
  type = string
  description = "The storage class to use for Block storage volumes"
}
