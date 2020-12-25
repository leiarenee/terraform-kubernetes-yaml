resource "kubernetes_cluster_role" "instance" { 
  depends_on = [null_resource.module_depends_on]
  for_each = local.cluster_role.applications

  dynamic "aggregation_rule" { # Nesting Mode: list  Max Items : 1  
    for_each = contains(keys(each.value), "aggregationRule") ? {item = each.value["aggregationRule"]} : {}

    content {
      dynamic "cluster_role_selectors" { # Nesting Mode: list  
        for_each = lookup(aggregation_rule.value, "clusterRoleSelectors", {})

        content {
          match_labels = lookup(cluster_role_selectors.value, "matchLabels", null)
          # Type: ['map', 'string']   Optional  
          # A map of {key,value} pairs. A single {key,value} in the matchLabels map is equivalent to an element of `match_expressions`, whose key field is "key", the operator is "In", and the values array contains only "value". The requirements are ANDed.

          dynamic "match_expressions" { # Nesting Mode: list  
            for_each = lookup(cluster_role_selectors.value, "matchExpressions", {})

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

  dynamic "metadata" { # Nesting Mode: list  Min Items : 1  Max Items : 1  
    for_each = contains(keys(each.value), "metadata") ? {item = each.value["metadata"]} : {}

    content {
      annotations = lookup(metadata.value, "annotations", null)
      # Type: ['map', 'string']   Optional  
      # An unstructured key value map stored with the clusterRole that may be used to store arbitrary metadata. More info: http://kubernetes.io/docs/user-guide/annotations

      labels = lookup(metadata.value, "labels", null)
      # Type: ['map', 'string']   Optional  
      # Map of string keys and values that can be used to organize and categorize (scope and select) the clusterRole. May match selectors of replication controllers and services. More info: http://kubernetes.io/docs/user-guide/labels

      name = lookup(metadata.value, "name", null)
      # Type: string   Optional Computed 
      # Name of the clusterRole, must be unique. Cannot be updated. More info: http://kubernetes.io/docs/user-guide/identifiers#names

    }
  }

  dynamic "rule" { # Nesting Mode: list  
    for_each = lookup(each.value, "rules", {})

    content {
      api_groups = lookup(rule.value, "apiGroups", null)
      # Type: ['list', 'string']   Optional  
      # APIGroups is the name of the APIGroup that contains the resources. If multiple API groups are specified, any action requested against one of the enumerated resources in any API group will be allowed.

      non_resource_urls = lookup(rule.value, "nonResourceUrls", null)
      # Type: ['list', 'string']   Optional  
      # NonResourceURLs is a set of partial urls that a user should have access to. *s are allowed, but only as the full, final step in the path Since non-resource URLs are not namespaced, this field is only applicable for ClusterRoles referenced from a ClusterRoleBinding. Rules can either apply to API resources (such as "pods" or "secrets") or non-resource URL paths (such as "/api"), but not both.

      resource_names = lookup(rule.value, "resourceNames", null)
      # Type: ['list', 'string']   Optional  
      # ResourceNames is an optional white list of names that the rule applies to. An empty set means that everything is allowed.

      resources = lookup(rule.value, "resources", null)
      # Type: ['list', 'string']   Optional  
      # Resources is a list of resources this rule applies to. ResourceAll represents all resources.

      verbs = lookup(rule.value, "verbs", null)
      # Type: ['list', 'string'] Required    
      # Verbs is a list of Verbs that apply to ALL the ResourceKinds and AttributeRestrictions contained in this rule. VerbAll represents all kinds.

    }
  }


}