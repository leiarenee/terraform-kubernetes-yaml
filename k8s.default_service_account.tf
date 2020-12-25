resource "kubernetes_default_service_account" "instance" { 
  depends_on = [null_resource.module_depends_on]
  for_each = local.default_service_account.applications

  automount_service_account_token = lookup(each.value, "automountServiceAccountToken", null)
  # Type: bool   Optional  
  # True to enable automatic mounting of the service account token

  dynamic "image_pull_secret" { # Nesting Mode: set  
    for_each = contains(keys(each.value), "imagePullSecret") ? {item = each.value["imagePullSecret"]} : {}

    content {
      name = lookup(image_pull_secret.value, "name", null)
      # Type: string   Optional  
      # Name of the referent. More info: http://kubernetes.io/docs/user-guide/identifiers#names

    }
  }

  dynamic "metadata" { # Nesting Mode: list  Min Items : 1  Max Items : 1  
    for_each = contains(keys(each.value), "metadata") ? {item = each.value["metadata"]} : {}

    content {
      annotations = lookup(metadata.value, "annotations", null)
      # Type: ['map', 'string']   Optional  
      # An unstructured key value map stored with the service account that may be used to store arbitrary metadata. More info: http://kubernetes.io/docs/user-guide/annotations

      labels = lookup(metadata.value, "labels", null)
      # Type: ['map', 'string']   Optional  
      # Map of string keys and values that can be used to organize and categorize (scope and select) the service account. May match selectors of replication controllers and services. More info: http://kubernetes.io/docs/user-guide/labels

      name = lookup(metadata.value, "name", null)
      # Type: string   Optional  
      # Name of the service account, must be unique. Cannot be updated. More info: http://kubernetes.io/docs/user-guide/identifiers#names

      namespace = var.namespace != "" ? var.namespace : lookup(metadata.value, "namespace", null)
      # Type: string   Optional  
      # Namespace defines the space within which name of the service account must be unique.

    }
  }

  dynamic "secret" { # Nesting Mode: set  
    for_each = contains(keys(each.value), "secret") ? {item = each.value["secret"]} : {}

    content {
      name = lookup(secret.value, "name", null)
      # Type: string   Optional  
      # Name of the referent. More info: http://kubernetes.io/docs/user-guide/identifiers#names

    }
  }

  dynamic "timeouts" { # Nesting Mode: single  
    for_each = contains(keys(each.value), "timeouts") ? {item = each.value["timeouts"]} : {}

    content {
      create = lookup(timeouts.value, "create", null)
      # Type: string   Optional  

    }
  }


}