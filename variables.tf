
variable "gitops_config" {
  type        = object({
    boostrap = object({
      argocd-config = object({
        project = string
        repo = string
        url = string
        path = string
      })
    })
    infrastructure = object({
      argocd-config = object({
        project = string
        repo = string
        url = string
        path = string
      })
      payload = object({
        repo = string
        url = string
        path = string
      })
    })
    services = object({
      argocd-config = object({
        project = string
        repo = string
        url = string
        path = string
      })
      payload = object({
        repo = string
        url = string
        path = string
      })
    })
    applications = object({
      argocd-config = object({
        project = string
        repo = string
        url = string
        path = string
      })
      payload = object({
        repo = string
        url = string
        path = string
      })
    })
  })
  description = "Config information regarding the gitops repo structure"
}

variable "git_credentials" {
  type = list(object({
    repo = string
    url = string
    username = string
    token = string
  }))
  description = "The credentials for the gitops repo(s)"
  sensitive   = true
}

variable "kubeseal_cert" {
  type        = string
  description = "The certificate/public key used to encrypt the sealed secrets"
  default     = ""
}

variable "server_name" {
  type        = string
  description = "The name of the server"
  default     = "default"
}

variable "core_namespace" {
  type        = string
  description = "The namespace where MAS Core has been installed"
}

variable "ibm_entitlement_secret" {
  type        = string
  description = "The name of the secret where the entitlement key has been stored"
}

variable "mas_instance_id" {
  type        = string
  description = "The id of the MAS instance created when core was installed"
}

variable "cpd_primary_storage_class" {
  type        = string
  description = "The storage class used for primary volumes. Must be RWX storage."
}

variable "cpd_metadata_storage_class" {
  type        = string
  description = "The storage class used for metadata volumes. Can be RWO."
}

variable "cpd_product_version" {
  type        = string
  description = "The version of cp4d that should be installed."
  default     = "4.5.0"
}

variable "cpd_instance_namespace" {
  type        = string
  description = "The namespace where cp4d will be installed."
  default     = "ibm-cpd"
}

variable "install_cp4d_platform" {
  type        = bool
  description = "Flag indicating that the cp4d platform should be installed"
  default     = false
}

variable "install_watson_studio" {
  type        = bool
  description = "Flag indicating that watson studio should be installed"
  default     = false
}

variable "install_watson_machine_learning" {
  type        = bool
  description = "Flag indicating that watson machine learning should be installed"
  default     = false
}

variable "install_analytics_engine" {
  type        = bool
  description = "Flag indicating that watson analytics engine should be installed"
  default     = false
}

variable "install_watson_openscale" {
  type        = bool
  description = "Flag indicating that watson ai should be installed"
  default     = false
}

variable "install_watson_discovery" {
  type        = bool
  description = "Flag indicating that watson discover should be installed"
  default     = false
}
