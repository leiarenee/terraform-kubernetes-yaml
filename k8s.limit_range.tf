resource "kubernetes_limit_range" "instance" { 
  depends_on = [null_resource.module_depends_on]
  for_each = local.limit_range.applications

  dynamic "metadata" { # Nesting Mode: list  Min Items : 1  Max Items : 1  
    for_each = contains(keys(each.value), "metadata") ? {item = each.value["metadata"]} : {}

    content {
      annotations = lookup(metadata.value, "annotations", null)
      # Type: ['map', 'string']   Optional  
      # An unstructured key value map stored with the limit range that may be used to store arbitrary metadata. More info: http://kubernetes.io/docs/user-guide/annotations

      generate_name = lookup(metadata.value, "generateName", null)
      # Type: string   Optional  
      # Prefix, used by the server, to generate a unique name ONLY IF the `name` field has not been provided. This value will also be combined with a unique suffix. Read more: https://github.com/kubernetes/community/blob/master/contributors/devel/sig-architecture/api-conventions.md#idempotency

      labels = lookup(metadata.value, "labels", null)
      # Type: ['map', 'string']   Optional  
      # Map of string keys and values that can be used to organize and categorize (scope and select) the limit range. May match selectors of replication controllers and services. More info: http://kubernetes.io/docs/user-guide/labels

      name = lookup(metadata.value, "name", null)
      # Type: string   Optional Computed 
      # Name of the limit range, must be unique. Cannot be updated. More info: http://kubernetes.io/docs/user-guide/identifiers#names

      namespace = var.namespace != "" ? var.namespace : lookup(metadata.value, "namespace", null)
      # Type: string   Optional  
      # Namespace defines the space within which name of the limit range must be unique.

    }
  }

  dynamic "spec" { # Nesting Mode: list  Max Items : 1  
    for_each = contains(keys(each.value), "spec") ? {item = each.value["spec"]} : {}

    content {
      dynamic "limit" { # Nesting Mode: list  
        for_each = lookup(spec.value, "limits", {})

        content {
          default = lookup(limit.value, "default", null)
          # Type: ['map', 'string']   Optional  
          # Default resource requirement limit value by resource name if resource limit is omitted.

          default_request = lookup(limit.value, "defaultRequest", null)
          # Type: ['map', 'string']   Optional Computed 
          # The default resource requirement request value by resource name if resource request is omitted.

          max = lookup(limit.value, "max", null)
          # Type: ['map', 'string']   Optional  
          # Max usage constraints on this kind by resource name.

          max_limit_request_ratio = lookup(limit.value, "maxLimitRequestRatio", null)
          # Type: ['map', 'string']   Optional  
          # The named resource must have a request and limit that are both non-zero where limit divided by request is less than or equal to the enumerated value; this represents the max burst for the named resource.

          min = lookup(limit.value, "min", null)
          # Type: ['map', 'string']   Optional  
          # Min usage constraints on this kind by resource name.

          type = lookup(limit.value, "type", null)
          # Type: string   Optional  
          # Type of resource that this limit applies to.

        }
      }

    }
  }


}