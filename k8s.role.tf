resource "kubernetes_role" "instance" { 
  depends_on = [null_resource.module_depends_on]
  for_each = local.role.applications

  dynamic "metadata" { # Nesting Mode: list  Min Items : 1  Max Items : 1  
    for_each = contains(keys(each.value), "metadata") ? {item = each.value["metadata"]} : {}

    content {
      annotations = lookup(metadata.value, "annotations", null)
      # Type: ['map', 'string']   Optional  
      # An unstructured key value map stored with the role that may be used to store arbitrary metadata. More info: http://kubernetes.io/docs/user-guide/annotations

      generate_name = lookup(metadata.value, "generateName", null)
      # Type: string   Optional  
      # Prefix, used by the server, to generate a unique name ONLY IF the `name` field has not been provided. This value will also be combined with a unique suffix. Read more: https://github.com/kubernetes/community/blob/master/contributors/devel/sig-architecture/api-conventions.md#idempotency

      labels = lookup(metadata.value, "labels", null)
      # Type: ['map', 'string']   Optional  
      # Map of string keys and values that can be used to organize and categorize (scope and select) the role. May match selectors of replication controllers and services. More info: http://kubernetes.io/docs/user-guide/labels

      name = lookup(metadata.value, "name", null)
      # Type: string   Optional Computed 
      # Name of the role, must be unique. Cannot be updated. More info: http://kubernetes.io/docs/user-guide/identifiers#names

      namespace = var.namespace != "" ? var.namespace : lookup(metadata.value, "namespace", null)
      # Type: string   Optional  
      # Namespace defines the space within which name of the role must be unique.

    }
  }

  dynamic "rule" { # Nesting Mode: list  Min Items : 1  
    for_each = lookup(each.value, "rules", {})

    content {
      api_groups = lookup(rule.value, "apiGroups", null)
      # Type: ['set', 'string'] Required    
      # Name of the APIGroup that contains the resources

      resource_names = lookup(rule.value, "resourceNames", null)
      # Type: ['set', 'string']   Optional  
      # White list of names that the rule applies to

      resources = lookup(rule.value, "resources", null)
      # Type: ['set', 'string'] Required    
      # List of resources that the rule applies to

      verbs = lookup(rule.value, "verbs", null)
      # Type: ['set', 'string'] Required    
      # List of Verbs that apply to ALL the ResourceKinds and AttributeRestrictions contained in this rule

    }
  }


}