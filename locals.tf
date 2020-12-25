locals {
  api_service = {
    applications = {
      for key, value in var.appConfig :
        key => lookup(lookup(value, "k8s", {}), "api_service", null)
        if contains(keys(lookup(value, "k8s", {})), "api_service") && var.module_enabled && !lookup(lookup(value, "k8s", {}), "disabled", false) && !lookup(lookup(lookup(value, "k8s", {}), "api_service", {}), "disabled", false)
    }
  }

  certificate_signing_request = {
    applications = {
      for key, value in var.appConfig :
        key => lookup(lookup(value, "k8s", {}), "certificate_signing_request", null)
        if contains(keys(lookup(value, "k8s", {})), "certificate_signing_request") && var.module_enabled && !lookup(lookup(value, "k8s", {}), "disabled", false) && !lookup(lookup(lookup(value, "k8s", {}), "certificate_signing_request", {}), "disabled", false)
    }
  }

  cluster_role = {
    applications = {
      for key, value in var.appConfig :
        key => lookup(lookup(value, "k8s", {}), "cluster_role", null)
        if contains(keys(lookup(value, "k8s", {})), "cluster_role") && var.module_enabled && !lookup(lookup(value, "k8s", {}), "disabled", false) && !lookup(lookup(lookup(value, "k8s", {}), "cluster_role", {}), "disabled", false)
    }
  }

  cluster_role_binding = {
    applications = {
      for key, value in var.appConfig :
        key => lookup(lookup(value, "k8s", {}), "cluster_role_binding", null)
        if contains(keys(lookup(value, "k8s", {})), "cluster_role_binding") && var.module_enabled && !lookup(lookup(value, "k8s", {}), "disabled", false) && !lookup(lookup(lookup(value, "k8s", {}), "cluster_role_binding", {}), "disabled", false)
    }
  }

  config_map = {
    applications = {
      for key, value in var.appConfig :
        key => lookup(lookup(value, "k8s", {}), "config_map", null)
        if contains(keys(lookup(value, "k8s", {})), "config_map") && var.module_enabled && !lookup(lookup(value, "k8s", {}), "disabled", false) && !lookup(lookup(lookup(value, "k8s", {}), "config_map", {}), "disabled", false)
    }
  }

  cron_job = {
    applications = {
      for key, value in var.appConfig :
        key => lookup(lookup(value, "k8s", {}), "cron_job", null)
        if contains(keys(lookup(value, "k8s", {})), "cron_job") && var.module_enabled && !lookup(lookup(value, "k8s", {}), "disabled", false) && !lookup(lookup(lookup(value, "k8s", {}), "cron_job", {}), "disabled", false)
    }
  }

  csi_driver = {
    applications = {
      for key, value in var.appConfig :
        key => lookup(lookup(value, "k8s", {}), "csi_driver", null)
        if contains(keys(lookup(value, "k8s", {})), "csi_driver") && var.module_enabled && !lookup(lookup(value, "k8s", {}), "disabled", false) && !lookup(lookup(lookup(value, "k8s", {}), "csi_driver", {}), "disabled", false)
    }
  }

  daemonset = {
    applications = {
      for key, value in var.appConfig :
        key => lookup(lookup(value, "k8s", {}), "daemonset", null)
        if contains(keys(lookup(value, "k8s", {})), "daemonset") && var.module_enabled && !lookup(lookup(value, "k8s", {}), "disabled", false) && !lookup(lookup(lookup(value, "k8s", {}), "daemonset", {}), "disabled", false)
    }
  }

  default_service_account = {
    applications = {
      for key, value in var.appConfig :
        key => lookup(lookup(value, "k8s", {}), "default_service_account", null)
        if contains(keys(lookup(value, "k8s", {})), "default_service_account") && var.module_enabled && !lookup(lookup(value, "k8s", {}), "disabled", false) && !lookup(lookup(lookup(value, "k8s", {}), "default_service_account", {}), "disabled", false)
    }
  }

  deployment = {
    applications = {
      for key, value in var.appConfig :
        key => lookup(lookup(value, "k8s", {}), "deployment", null)
        if contains(keys(lookup(value, "k8s", {})), "deployment") && var.module_enabled && !lookup(lookup(value, "k8s", {}), "disabled", false) && !lookup(lookup(lookup(value, "k8s", {}), "deployment", {}), "disabled", false)
    }
  }

  endpoints = {
    applications = {
      for key, value in var.appConfig :
        key => lookup(lookup(value, "k8s", {}), "endpoints", null)
        if contains(keys(lookup(value, "k8s", {})), "endpoints") && var.module_enabled && !lookup(lookup(value, "k8s", {}), "disabled", false) && !lookup(lookup(lookup(value, "k8s", {}), "endpoints", {}), "disabled", false)
    }
  }

  horizontal_pod_autoscaler = {
    applications = {
      for key, value in var.appConfig :
        key => lookup(lookup(value, "k8s", {}), "horizontal_pod_autoscaler", null)
        if contains(keys(lookup(value, "k8s", {})), "horizontal_pod_autoscaler") && var.module_enabled && !lookup(lookup(value, "k8s", {}), "disabled", false) && !lookup(lookup(lookup(value, "k8s", {}), "horizontal_pod_autoscaler", {}), "disabled", false)
    }
  }

  ingress = {
    applications = {
      for key, value in var.appConfig :
        key => lookup(lookup(value, "k8s", {}), "ingress", null)
        if contains(keys(lookup(value, "k8s", {})), "ingress") && var.module_enabled && !lookup(lookup(value, "k8s", {}), "disabled", false) && !lookup(lookup(lookup(value, "k8s", {}), "ingress", {}), "disabled", false)
    }
  }

  job = {
    applications = {
      for key, value in var.appConfig :
        key => lookup(lookup(value, "k8s", {}), "job", null)
        if contains(keys(lookup(value, "k8s", {})), "job") && var.module_enabled && !lookup(lookup(value, "k8s", {}), "disabled", false) && !lookup(lookup(lookup(value, "k8s", {}), "job", {}), "disabled", false)
    }
  }

  limit_range = {
    applications = {
      for key, value in var.appConfig :
        key => lookup(lookup(value, "k8s", {}), "limit_range", null)
        if contains(keys(lookup(value, "k8s", {})), "limit_range") && var.module_enabled && !lookup(lookup(value, "k8s", {}), "disabled", false) && !lookup(lookup(lookup(value, "k8s", {}), "limit_range", {}), "disabled", false)
    }
  }

  mutating_webhook_configuration = {
    applications = {
      for key, value in var.appConfig :
        key => lookup(lookup(value, "k8s", {}), "mutating_webhook_configuration", null)
        if contains(keys(lookup(value, "k8s", {})), "mutating_webhook_configuration") && var.module_enabled && !lookup(lookup(value, "k8s", {}), "disabled", false) && !lookup(lookup(lookup(value, "k8s", {}), "mutating_webhook_configuration", {}), "disabled", false)
    }
  }

  namespace = {
    applications = {
      for key, value in var.appConfig :
        key => lookup(lookup(value, "k8s", {}), "namespace", null)
        if contains(keys(lookup(value, "k8s", {})), "namespace") && var.module_enabled && !lookup(lookup(value, "k8s", {}), "disabled", false) && !lookup(lookup(lookup(value, "k8s", {}), "namespace", {}), "disabled", false)
    }
  }

  network_policy = {
    applications = {
      for key, value in var.appConfig :
        key => lookup(lookup(value, "k8s", {}), "network_policy", null)
        if contains(keys(lookup(value, "k8s", {})), "network_policy") && var.module_enabled && !lookup(lookup(value, "k8s", {}), "disabled", false) && !lookup(lookup(lookup(value, "k8s", {}), "network_policy", {}), "disabled", false)
    }
  }

  persistent_volume = {
    applications = {
      for key, value in var.appConfig :
        key => lookup(lookup(value, "k8s", {}), "persistent_volume", null)
        if contains(keys(lookup(value, "k8s", {})), "persistent_volume") && var.module_enabled && !lookup(lookup(value, "k8s", {}), "disabled", false) && !lookup(lookup(lookup(value, "k8s", {}), "persistent_volume", {}), "disabled", false)
    }
  }

  persistent_volume_claim = {
    applications = {
      for key, value in var.appConfig :
        key => lookup(lookup(value, "k8s", {}), "persistent_volume_claim", null)
        if contains(keys(lookup(value, "k8s", {})), "persistent_volume_claim") && var.module_enabled && !lookup(lookup(value, "k8s", {}), "disabled", false) && !lookup(lookup(lookup(value, "k8s", {}), "persistent_volume_claim", {}), "disabled", false)
    }
  }

  pod = {
    applications = {
      for key, value in var.appConfig :
        key => lookup(lookup(value, "k8s", {}), "pod", null)
        if contains(keys(lookup(value, "k8s", {})), "pod") && var.module_enabled && !lookup(lookup(value, "k8s", {}), "disabled", false) && !lookup(lookup(lookup(value, "k8s", {}), "pod", {}), "disabled", false)
    }
  }

  pod_disruption_budget = {
    applications = {
      for key, value in var.appConfig :
        key => lookup(lookup(value, "k8s", {}), "pod_disruption_budget", null)
        if contains(keys(lookup(value, "k8s", {})), "pod_disruption_budget") && var.module_enabled && !lookup(lookup(value, "k8s", {}), "disabled", false) && !lookup(lookup(lookup(value, "k8s", {}), "pod_disruption_budget", {}), "disabled", false)
    }
  }

  pod_security_policy = {
    applications = {
      for key, value in var.appConfig :
        key => lookup(lookup(value, "k8s", {}), "pod_security_policy", null)
        if contains(keys(lookup(value, "k8s", {})), "pod_security_policy") && var.module_enabled && !lookup(lookup(value, "k8s", {}), "disabled", false) && !lookup(lookup(lookup(value, "k8s", {}), "pod_security_policy", {}), "disabled", false)
    }
  }

  priority_class = {
    applications = {
      for key, value in var.appConfig :
        key => lookup(lookup(value, "k8s", {}), "priority_class", null)
        if contains(keys(lookup(value, "k8s", {})), "priority_class") && var.module_enabled && !lookup(lookup(value, "k8s", {}), "disabled", false) && !lookup(lookup(lookup(value, "k8s", {}), "priority_class", {}), "disabled", false)
    }
  }

  replication_controller = {
    applications = {
      for key, value in var.appConfig :
        key => lookup(lookup(value, "k8s", {}), "replication_controller", null)
        if contains(keys(lookup(value, "k8s", {})), "replication_controller") && var.module_enabled && !lookup(lookup(value, "k8s", {}), "disabled", false) && !lookup(lookup(lookup(value, "k8s", {}), "replication_controller", {}), "disabled", false)
    }
  }

  resource_quota = {
    applications = {
      for key, value in var.appConfig :
        key => lookup(lookup(value, "k8s", {}), "resource_quota", null)
        if contains(keys(lookup(value, "k8s", {})), "resource_quota") && var.module_enabled && !lookup(lookup(value, "k8s", {}), "disabled", false) && !lookup(lookup(lookup(value, "k8s", {}), "resource_quota", {}), "disabled", false)
    }
  }

  role = {
    applications = {
      for key, value in var.appConfig :
        key => lookup(lookup(value, "k8s", {}), "role", null)
        if contains(keys(lookup(value, "k8s", {})), "role") && var.module_enabled && !lookup(lookup(value, "k8s", {}), "disabled", false) && !lookup(lookup(lookup(value, "k8s", {}), "role", {}), "disabled", false)
    }
  }

  role_binding = {
    applications = {
      for key, value in var.appConfig :
        key => lookup(lookup(value, "k8s", {}), "role_binding", null)
        if contains(keys(lookup(value, "k8s", {})), "role_binding") && var.module_enabled && !lookup(lookup(value, "k8s", {}), "disabled", false) && !lookup(lookup(lookup(value, "k8s", {}), "role_binding", {}), "disabled", false)
    }
  }

  secret = {
    applications = {
      for key, value in var.appConfig :
        key => lookup(lookup(value, "k8s", {}), "secret", null)
        if contains(keys(lookup(value, "k8s", {})), "secret") && var.module_enabled && !lookup(lookup(value, "k8s", {}), "disabled", false) && !lookup(lookup(lookup(value, "k8s", {}), "secret", {}), "disabled", false)
    }
  }

  service = {
    applications = {
      for key, value in var.appConfig :
        key => lookup(lookup(value, "k8s", {}), "service", null)
        if contains(keys(lookup(value, "k8s", {})), "service") && var.module_enabled && !lookup(lookup(value, "k8s", {}), "disabled", false) && !lookup(lookup(lookup(value, "k8s", {}), "service", {}), "disabled", false)
    }
  }

  service_account = {
    applications = {
      for key, value in var.appConfig :
        key => lookup(lookup(value, "k8s", {}), "service_account", null)
        if contains(keys(lookup(value, "k8s", {})), "service_account") && var.module_enabled && !lookup(lookup(value, "k8s", {}), "disabled", false) && !lookup(lookup(lookup(value, "k8s", {}), "service_account", {}), "disabled", false)
    }
  }

  stateful_set = {
    applications = {
      for key, value in var.appConfig :
        key => lookup(lookup(value, "k8s", {}), "stateful_set", null)
        if contains(keys(lookup(value, "k8s", {})), "stateful_set") && var.module_enabled && !lookup(lookup(value, "k8s", {}), "disabled", false) && !lookup(lookup(lookup(value, "k8s", {}), "stateful_set", {}), "disabled", false)
    }
  }

  storage_class = {
    applications = {
      for key, value in var.appConfig :
        key => lookup(lookup(value, "k8s", {}), "storage_class", null)
        if contains(keys(lookup(value, "k8s", {})), "storage_class") && var.module_enabled && !lookup(lookup(value, "k8s", {}), "disabled", false) && !lookup(lookup(lookup(value, "k8s", {}), "storage_class", {}), "disabled", false)
    }
  }

  validating_webhook_configuration = {
    applications = {
      for key, value in var.appConfig :
        key => lookup(lookup(value, "k8s", {}), "validating_webhook_configuration", null)
        if contains(keys(lookup(value, "k8s", {})), "validating_webhook_configuration") && var.module_enabled && !lookup(lookup(value, "k8s", {}), "disabled", false) && !lookup(lookup(lookup(value, "k8s", {}), "validating_webhook_configuration", {}), "disabled", false)
    }
  }

}