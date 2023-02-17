locals {
  name          = "mas-cp4d"
  yaml_dir      = "${path.cwd}/.tmp/${local.name}/chart/${local.name}"

  values_content = {
    ibm_entitlement_secret =  var.ibm_entitlement_secret
    mas_instance_id = var.mas_instance_id
    cpd_primary_storage_class = var.cpd_primary_storage_class
    cpd_metadata_storage_class = var.cpd_metadata_storage_class

    cpd_product_version = var.cpd_product_version
    cpd_instance_namespace = var.cpd_instance_namespace

    install_cp4d_platform = var.install_cp4d_platform
    install_watson_studio = var.install_watson_studio
    install_watson_machine_learning = var.install_watson_machine_learning
    install_analytics_engine = var.install_analytics_engine
    install_watson_openscale = var.install_watson_openscale
    install_watson_discovery = var.install_watson_discovery
  }

  layer = "services"
  type  = "instances"
  application_branch = "main"
  namespace = "masauto-operator-system"
  layer_config = var.gitops_config[local.layer]
}

resource null_resource create_yaml {
  provisioner "local-exec" {
    command = "${path.module}/scripts/create-yaml.sh '${local.name}' '${local.yaml_dir}'"

    environment = {
      VALUES_CONTENT = yamlencode(local.values_content)
    }
  }
}

resource gitops_module module {
  depends_on = [null_resource.create_yaml]

  name = local.name
  namespace = local.namespace
  content_dir = local.yaml_dir
  server_name = var.server_name
  layer = local.layer
  type = local.type
  branch = local.application_branch
  config = yamlencode(var.gitops_config)
  credentials = yamlencode(var.git_credentials)
}
