# local-bom

Provisions OpenShift GitOps (ArgoCD) into an existing cluster and bootstraps it to a gitops repository

## Running the automation

This terraform template is part of collection of layers that should be executed together. Before this layer
can be applied, several steps must first be taken:

1. Run `apply.sh` in the parent directory to generate the input variable configuration for the run. If you'd like to apply one layer at a time, select `n` when prompted to continue.
2. Run `apply.sh` for each of the layer dependencies listed below.
3. Run `apply.sh` for this layer.

## Contents

### Layer dependencies


The following layers are dependencies of this terraform template and must be applied before this one.
- [gitops](../200-openshift-gitops)
- [storage](../210-ibm-odf-storage)

### Modules

| Name | Description | Version |
|------|-------------|---------|
| [gitops-mas-cp4d](https:///Users/seansund/ws/cntk/terraform-gitops/mas-cp4d) | Module to populate a gitops repo with the resources to provision mas-cp4d |  |
| [gitops-repo](https://github.com/cloud-native-toolkit/terraform-tools-gitops) | Module to provision and set up a GitOps repository | v1.23.3 |
| [util-clis](https://github.com/cloud-native-toolkit/terraform-util-clis) | Module to install clis into local bin directory | v1.18.2 |
| [gitops-mas-core](https://github.com/cloud-native-toolkit/terraform-gitops-mas-core) | Module to populate a gitops repo with the resources to provision Maximo Application Suite Core | v1.0.0 |
| [gitops-toolkit-catalog](https://github.com/cloud-native-toolkit/terraform-gitops-toolkit-catalog) | Module to populate a gitops repo with the resources to provision the Toolkit operator catalog in a cluster. | v1.0.0 |
| [util-storage-class-manager](https://github.com/cloud-native-toolkit/terraform-util-storage-class-manager) | Module to collect and organize storage classes within a template | v1.0.3 |

### Variables

| Name | Description | Sensitive | Default value |
|------|-------------|-----------|---------------|
| gitops_repo_host | The host for the git repository. The git host used can be a GitHub, GitHub Enterprise, Gitlab, Bitbucket, Gitea or Azure DevOps server. If the host is null assumes in-cluster Gitea instance will be used. |  |  |
| gitops_repo_org | The org/group where the git repository exists/will be provisioned. If the value is left blank then the username org will be used. |  |  |
| gitops_repo_project | The project that will be used for the git repo. (Primarily used for Azure DevOps repos) |  |  |
| gitops_repo_username | The username of the user with access to the repository |  |  |
| gitops_repo_token | The personal access token used to access the repository | true |  |
| gitops_repo_repo | The short name of the repository (i.e. the part after the org/group name) |  |  |
| gitops-mas-core_entitlement_key | The entitlement key used to access the Maximo Application Suite images in the container registry. Visit https://myibm.ibm.com/products-services/containerlibrary to get the key | true |  |
| gitops-mas-core_uds_contact_email | The email address of the contact person for UDS |  |  |
| gitops-mas-core_uds_contact_first_name | The first name of the contact person for UDS |  |  |
| gitops-mas-core_uds_contact_last_name | The last name of the contact person for UDS |  |  |
| util-storage-class-manager_rwx_storage_class | The storage class to use for Read-Write-Many volumes |  |  |
| util-storage-class-manager_rwo_storage_class | The storage class to use for Read-Write-One volumes |  |  |
| util-storage-class-manager_file_storage_class | The storage class to use for File storage volumes |  |  |
| util-storage-class-manager_block_storage_class | The storage class to use for Block storage volumes |  |  |

## Troubleshooting

