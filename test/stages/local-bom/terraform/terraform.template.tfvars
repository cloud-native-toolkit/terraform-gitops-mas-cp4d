## gitops_repo_host: The host for the git repository. The git host used can be a GitHub, GitHub Enterprise, Gitlab, Bitbucket, Gitea or Azure DevOps server. If the host is null assumes in-cluster Gitea instance will be used.
#gitops_repo_host=""

## gitops_repo_org: The org/group where the git repository exists/will be provisioned. If the value is left blank then the username org will be used.
#gitops_repo_org=""

## gitops_repo_project: The project that will be used for the git repo. (Primarily used for Azure DevOps repos)
#gitops_repo_project=""

## gitops_repo_username: The username of the user with access to the repository
#gitops_repo_username=""

## gitops_repo_token: The personal access token used to access the repository
#gitops_repo_token=""

## gitops_repo_repo: The short name of the repository (i.e. the part after the org/group name)
#gitops_repo_repo=""

## gitops-mas-core_entitlement_key: The entitlement key used to access the Maximo Application Suite images in the container registry. Visit https://myibm.ibm.com/products-services/containerlibrary to get the key
#gitops-mas-core_entitlement_key=""

## gitops-mas-core_uds_contact_email: The email address of the contact person for UDS
#gitops-mas-core_uds_contact_email=""

## gitops-mas-core_uds_contact_first_name: The first name of the contact person for UDS
#gitops-mas-core_uds_contact_first_name=""

## gitops-mas-core_uds_contact_last_name: The last name of the contact person for UDS
#gitops-mas-core_uds_contact_last_name=""

## util-storage-class-manager_rwx_storage_class: The storage class to use for Read-Write-Many volumes
#util-storage-class-manager_rwx_storage_class=""

## util-storage-class-manager_rwo_storage_class: The storage class to use for Read-Write-One volumes
#util-storage-class-manager_rwo_storage_class=""

## util-storage-class-manager_file_storage_class: The storage class to use for File storage volumes
#util-storage-class-manager_file_storage_class=""

## util-storage-class-manager_block_storage_class: The storage class to use for Block storage volumes
#util-storage-class-manager_block_storage_class=""

