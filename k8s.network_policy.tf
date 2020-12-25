resource "kubernetes_network_policy" "instance" { 
  depends_on = [null_resource.module_depends_on]
  for_each = local.network_policy.applications

  dynamic "metadata" { # Nesting Mode: list  Min Items : 1  Max Items : 1  
    for_each = contains(keys(each.value), "metadata") ? {item = each.value["metadata"]} : {}

    content {
      annotations = lookup(metadata.value, "annotations", null)
      # Type: ['map', 'string']   Optional  
      # An unstructured key value map stored with the network policy that may be used to store arbitrary metadata. More info: http://kubernetes.io/docs/user-guide/annotations

      generate_name = lookup(metadata.value, "generateName", null)
      # Type: string   Optional  
      # Prefix, used by the server, to generate a unique name ONLY IF the `name` field has not been provided. This value will also be combined with a unique suffix. Read more: https://github.com/kubernetes/community/blob/master/contributors/devel/sig-architecture/api-conventions.md#idempotency

      labels = lookup(metadata.value, "labels", null)
      # Type: ['map', 'string']   Optional  
      # Map of string keys and values that can be used to organize and categorize (scope and select) the network policy. May match selectors of replication controllers and services. More info: http://kubernetes.io/docs/user-guide/labels

      name = lookup(metadata.value, "name", null)
      # Type: string   Optional Computed 
      # Name of the network policy, must be unique. Cannot be updated. More info: http://kubernetes.io/docs/user-guide/identifiers#names

      namespace = var.namespace != "" ? var.namespace : lookup(metadata.value, "namespace", null)
      # Type: string   Optional  
      # Namespace defines the space within which name of the network policy must be unique.

    }
  }

  dynamic "spec" { # Nesting Mode: list  Min Items : 1  Max Items : 1  
    for_each = contains(keys(each.value), "spec") ? {item = each.value["spec"]} : {}

    content {
      policy_types = lookup(spec.value, "policyTypes", null)
      # Type: ['list', 'string'] Required    
      # List of rule types that the NetworkPolicy relates to. Valid options are "Ingress", "Egress", or "Ingress,Egress". If this field is not specified, it will default based on the existence of Ingress or Egress rules; policies that contain an Egress section are assumed to affect Egress, and all policies (whether or not they contain an Ingress section) are assumed to affect Ingress. If you want to write an egress-only policy, you must explicitly specify policyTypes [ "Egress" ]. Likewise, if you want to write a policy that specifies that no egress is allowed, you must specify a policyTypes value that include "Egress" (since such a policy would not include an Egress section and would otherwise default to just [ "Ingress" ]). This field is beta-level in 1.8

      dynamic "egress" { # Nesting Mode: list  
        for_each = lookup(spec.value, "egress", {})

        content {
          dynamic "ports" { # Nesting Mode: list  
            for_each = lookup(egress.value, "ports", {})

            content {
              port = lookup(ports.value, "port", null)
              # Type: string   Optional  
              # The port on the given protocol. This can either be a numerical or named port on a pod. If this field is not provided, this matches all port names and numbers.

              protocol = lookup(ports.value, "protocol", null)
              # Type: string   Optional  
              # The protocol (TCP, UDP, or SCTP) which traffic must match. If not specified, this field defaults to TCP.

            }
          }

          dynamic "to" { # Nesting Mode: list  
            for_each = lookup(egress.value, "to", {})

            content {
              dynamic "ip_block" { # Nesting Mode: list  Max Items : 1  
                for_each = contains(keys(to.value), "ipBlock") ? {item = to.value["ipBlock"]} : {}

                content {
                  cidr = lookup(ip_block.value, "cidr", null)
                  # Type: string   Optional  
                  # CIDR is a string representing the IP Block Valid examples are "192.168.1.1/24" or "2001:db9::/64"

                  except = lookup(ip_block.value, "except", null)
                  # Type: ['list', 'string']   Optional  
                  # Except is a slice of CIDRs that should not be included within an IP Block Valid examples are "192.168.1.1/24" or "2001:db9::/64" Except values will be rejected if they are outside the CIDR range

                }
              }

              dynamic "namespace_selector" { # Nesting Mode: list  Max Items : 1  
                for_each = contains(keys(to.value), "namespaceSelector") ? {item = to.value["namespaceSelector"]} : {}

                content {
                  match_labels = lookup(namespace_selector.value, "matchLabels", null)
                  # Type: ['map', 'string']   Optional  
                  # A map of {key,value} pairs. A single {key,value} in the matchLabels map is equivalent to an element of `match_expressions`, whose key field is "key", the operator is "In", and the values array contains only "value". The requirements are ANDed.

                  dynamic "match_expressions" { # Nesting Mode: list  
                    for_each = lookup(namespace_selector.value, "matchExpressions", {})

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

              dynamic "pod_selector" { # Nesting Mode: list  Max Items : 1  
                for_each = contains(keys(to.value), "podSelector") ? {item = to.value["podSelector"]} : {}

                content {
                  match_labels = lookup(pod_selector.value, "matchLabels", null)
                  # Type: ['map', 'string']   Optional  
                  # A map of {key,value} pairs. A single {key,value} in the matchLabels map is equivalent to an element of `match_expressions`, whose key field is "key", the operator is "In", and the values array contains only "value". The requirements are ANDed.

                  dynamic "match_expressions" { # Nesting Mode: list  
                    for_each = lookup(pod_selector.value, "matchExpressions", {})

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

        }
      }

      dynamic "ingress" { # Nesting Mode: list  
        for_each = lookup(spec.value, "ingress", {})

        content {
          dynamic "from" { # Nesting Mode: list  
            for_each = lookup(ingress.value, "from", {})

            content {
              dynamic "ip_block" { # Nesting Mode: list  Max Items : 1  
                for_each = contains(keys(from.value), "ipBlock") ? {item = from.value["ipBlock"]} : {}

                content {
                  cidr = lookup(ip_block.value, "cidr", null)
                  # Type: string   Optional  
                  # CIDR is a string representing the IP Block Valid examples are "192.168.1.1/24" or "2001:db9::/64"

                  except = lookup(ip_block.value, "except", null)
                  # Type: ['list', 'string']   Optional  
                  # Except is a slice of CIDRs that should not be included within an IP Block Valid examples are "192.168.1.1/24" or "2001:db9::/64" Except values will be rejected if they are outside the CIDR range

                }
              }

              dynamic "namespace_selector" { # Nesting Mode: list  Max Items : 1  
                for_each = contains(keys(from.value), "namespaceSelector") ? {item = from.value["namespaceSelector"]} : {}

                content {
                  match_labels = lookup(namespace_selector.value, "matchLabels", null)
                  # Type: ['map', 'string']   Optional  
                  # A map of {key,value} pairs. A single {key,value} in the matchLabels map is equivalent to an element of `match_expressions`, whose key field is "key", the operator is "In", and the values array contains only "value". The requirements are ANDed.

                  dynamic "match_expressions" { # Nesting Mode: list  
                    for_each = lookup(namespace_selector.value, "matchExpressions", {})

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

              dynamic "pod_selector" { # Nesting Mode: list  Max Items : 1  
                for_each = contains(keys(from.value), "podSelector") ? {item = from.value["podSelector"]} : {}

                content {
                  match_labels = lookup(pod_selector.value, "matchLabels", null)
                  # Type: ['map', 'string']   Optional  
                  # A map of {key,value} pairs. A single {key,value} in the matchLabels map is equivalent to an element of `match_expressions`, whose key field is "key", the operator is "In", and the values array contains only "value". The requirements are ANDed.

                  dynamic "match_expressions" { # Nesting Mode: list  
                    for_each = lookup(pod_selector.value, "matchExpressions", {})

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

          dynamic "ports" { # Nesting Mode: list  
            for_each = lookup(ingress.value, "ports", {})

            content {
              port = lookup(ports.value, "port", null)
              # Type: string   Optional  
              # The port on the given protocol. This can either be a numerical or named port on a pod. If this field is not provided, this matches all port names and numbers.

              protocol = lookup(ports.value, "protocol", null)
              # Type: string   Optional  
              # The protocol (TCP, UDP, or SCTP) which traffic must match. If not specified, this field defaults to TCP.

            }
          }

        }
      }

      dynamic "pod_selector" { # Nesting Mode: list  Min Items : 1  Max Items : 1  
        for_each = contains(keys(spec.value), "podSelector") ? {item = spec.value["podSelector"]} : {}

        content {
          match_labels = lookup(pod_selector.value, "matchLabels", null)
          # Type: ['map', 'string']   Optional  
          # A map of {key,value} pairs. A single {key,value} in the matchLabels map is equivalent to an element of `match_expressions`, whose key field is "key", the operator is "In", and the values array contains only "value". The requirements are ANDed.

          dynamic "match_expressions" { # Nesting Mode: list  
            for_each = lookup(pod_selector.value, "matchExpressions", {})

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


}