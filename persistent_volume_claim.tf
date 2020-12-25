resource "kubernetes_persistent_volume_claim" "instance" { 
  depends_on = [null_resource.module_depends_on]
  for_each = local.persistent_volume_claim.applications

  wait_until_bound = lookup(each.value, "waitUntilBound", null)
  # Type: bool   Optional  
  # Whether to wait for the claim to reach `Bound` state (to find volume in which to claim the space)

  dynamic "metadata" { # Nesting Mode: list  Min Items : 1  Max Items : 1  
    for_each = contains(keys(each.value), "metadata") ? {item = each.value["metadata"]} : {}

    content {
      annotations = lookup(metadata.value, "annotations", null)
      # Type: ['map', 'string']   Optional  
      # An unstructured key value map stored with the persistent volume claim that may be used to store arbitrary metadata. More info: http://kubernetes.io/docs/user-guide/annotations

      generate_name = lookup(metadata.value, "generateName", null)
      # Type: string   Optional  
      # Prefix, used by the server, to generate a unique name ONLY IF the `name` field has not been provided. This value will also be combined with a unique suffix. Read more: https://github.com/kubernetes/community/blob/master/contributors/devel/sig-architecture/api-conventions.md#idempotency

      labels = lookup(metadata.value, "labels", null)
      # Type: ['map', 'string']   Optional  
      # Map of string keys and values that can be used to organize and categorize (scope and select) the persistent volume claim. May match selectors of replication controllers and services. More info: http://kubernetes.io/docs/user-guide/labels

      name = lookup(metadata.value, "name", null)
      # Type: string   Optional Computed 
      # Name of the persistent volume claim, must be unique. Cannot be updated. More info: http://kubernetes.io/docs/user-guide/identifiers#names

      namespace = var.namespace != "" ? var.namespace : lookup(metadata.value, "namespace", null)
      # Type: string   Optional  
      # Namespace defines the space within which name of the persistent volume claim must be unique.

    }
  }

  dynamic "spec" { # Nesting Mode: list  Min Items : 1  Max Items : 1  
    for_each = contains(keys(each.value), "spec") ? {item = each.value["spec"]} : {}

    content {
      access_modes = lookup(spec.value, "accessModes", null)
      # Type: ['set', 'string'] Required    
      # A set of the desired access modes the volume should have. More info: http://kubernetes.io/docs/user-guide/persistent-volumes#access-modes-1

      storage_class_name = lookup(spec.value, "storageClassName", null)
      # Type: string   Optional Computed 
      # Name of the storage class requested by the claim

      volume_name = lookup(spec.value, "volumeName", null)
      # Type: string   Optional Computed 
      # The binding reference to the PersistentVolume backing this claim.

      dynamic "resources" { # Nesting Mode: list  Min Items : 1  Max Items : 1  
        for_each = contains(keys(spec.value), "resources") ? {item = spec.value["resources"]} : {}

        content {
          limits = lookup(resources.value, "limits", null)
          # Type: ['map', 'string']   Optional  
          # Map describing the maximum amount of compute resources allowed. More info: http://kubernetes.io/docs/user-guide/compute-resources/

          requests = lookup(resources.value, "requests", null)
          # Type: ['map', 'string']   Optional  
          # Map describing the minimum amount of compute resources required. If this is omitted for a container, it defaults to `limits` if that is explicitly specified, otherwise to an implementation-defined value. More info: http://kubernetes.io/docs/user-guide/compute-resources/

        }
      }

      dynamic "selector" { # Nesting Mode: list  Max Items : 1  
        for_each = contains(keys(spec.value), "selector") ? {item = spec.value["selector"]} : {}

        content {
          match_labels = lookup(selector.value, "matchLabels", null)
          # Type: ['map', 'string']   Optional  
          # A map of {key,value} pairs. A single {key,value} in the matchLabels map is equivalent to an element of `match_expressions`, whose key field is "key", the operator is "In", and the values array contains only "value". The requirements are ANDed.

          dynamic "match_expressions" { # Nesting Mode: list  
            for_each = lookup(selector.value, "matchExpressions", {})

            content {
              key = lookup(match_expressions.value, "key", null)
              # Type: string   Optional  
              # The label key that the selector applies to.

              operator = lookup(match_expressions.value, "operator", null)
              # Type: string   Optional  
              # A key's relationship to a set of values. Valid operators ard `In`, `NotIn`, `Exists` and `DoesNotExist`.

              values = lookup(match_expressions.value, "values", null)
              # Type: ['set', 'string']   Optional  
              # An array of string values. If the operator is `In` or `NotIn`, the values array must be non-empty. If the operator is `Exists` or `DoesNotExist`, the values array must be empty. This array is replaced during a strategic merge patch.

            }
          }

        }
      }

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