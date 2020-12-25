resource "kubernetes_horizontal_pod_autoscaler" "instance" { 
  depends_on = [null_resource.module_depends_on]
  for_each = local.horizontal_pod_autoscaler.applications

  dynamic "metadata" { # Nesting Mode: list  Min Items : 1  Max Items : 1  
    for_each = contains(keys(each.value), "metadata") ? {item = each.value["metadata"]} : {}

    content {
      annotations = lookup(metadata.value, "annotations", null)
      # Type: ['map', 'string']   Optional  
      # An unstructured key value map stored with the horizontal pod autoscaler that may be used to store arbitrary metadata. More info: http://kubernetes.io/docs/user-guide/annotations

      generate_name = lookup(metadata.value, "generateName", null)
      # Type: string   Optional  
      # Prefix, used by the server, to generate a unique name ONLY IF the `name` field has not been provided. This value will also be combined with a unique suffix. Read more: https://github.com/kubernetes/community/blob/master/contributors/devel/sig-architecture/api-conventions.md#idempotency

      labels = lookup(metadata.value, "labels", null)
      # Type: ['map', 'string']   Optional  
      # Map of string keys and values that can be used to organize and categorize (scope and select) the horizontal pod autoscaler. May match selectors of replication controllers and services. More info: http://kubernetes.io/docs/user-guide/labels

      name = lookup(metadata.value, "name", null)
      # Type: string   Optional Computed 
      # Name of the horizontal pod autoscaler, must be unique. Cannot be updated. More info: http://kubernetes.io/docs/user-guide/identifiers#names

      namespace = var.namespace != "" ? var.namespace : lookup(metadata.value, "namespace", null)
      # Type: string   Optional  
      # Namespace defines the space within which name of the horizontal pod autoscaler must be unique.

    }
  }

  dynamic "spec" { # Nesting Mode: list  Min Items : 1  Max Items : 1  
    for_each = contains(keys(each.value), "spec") ? {item = each.value["spec"]} : {}

    content {
      max_replicas = lookup(spec.value, "maxReplicas", null)
      # Type: number Required    
      # Upper limit for the number of pods that can be set by the autoscaler.

      min_replicas = lookup(spec.value, "minReplicas", null)
      # Type: number   Optional  
      # Lower limit for the number of pods that can be set by the autoscaler, defaults to `1`.

      target_cpu_utilization_percentage = lookup(spec.value, "targetCpuUtilizationPercentage", null)
      # Type: number   Optional Computed 
      # Target average CPU utilization (represented as a percentage of requested CPU) over all the pods. If not specified the default autoscaling policy will be used.

      dynamic "metric" { # Nesting Mode: list  
        for_each = lookup(spec.value, "metrics", {})

        content {
          type = lookup(metric.value, "type", null)
          # Type: string Required    
          # type is the type of metric source. It should be one of "Object", "Pods", "External" or "Resource", each mapping to a matching field in the object.

          dynamic "external" { # Nesting Mode: list  Max Items : 1  
            for_each = contains(keys(metric.value), "external") ? {item = metric.value["external"]} : {}

            content {
              dynamic "metric" { # Nesting Mode: list  Min Items : 1  Max Items : 1  
                for_each = contains(keys(external.value), "metric") ? {item = external.value["metric"]} : {}

                content {
                  name = lookup(metric.value, "name", null)
                  # Type: string Required    
                  # name is the name of the given metric

                  dynamic "selector" { # Nesting Mode: list  
                    for_each = lookup(metric.value, "selector", {})

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

              dynamic "target" { # Nesting Mode: list  Max Items : 1  
                for_each = contains(keys(external.value), "target") ? {item = external.value["target"]} : {}

                content {
                  average_utilization = lookup(target.value, "averageUtilization", null)
                  # Type: number   Optional  
                  # averageUtilization is the target value of the average of the resource metric across all relevant pods, represented as a percentage of the requested value of the resource for the pods. Currently only valid for Resource metric source type

                  average_value = lookup(target.value, "averageValue", null)
                  # Type: string   Optional  
                  # averageValue is the target value of the average of the metric across all relevant pods (as a quantity)

                  type = lookup(target.value, "type", null)
                  # Type: string Required    
                  # type represents whether the metric type is Utilization, Value, or AverageValue

                  value = lookup(target.value, "value", null)
                  # Type: string   Optional  
                  # value is the target value of the metric (as a quantity).

                }
              }

            }
          }

          dynamic "object" { # Nesting Mode: list  Max Items : 1  
            for_each = contains(keys(metric.value), "object") ? {item = metric.value["object"]} : {}

            content {
              dynamic "described_object" { # Nesting Mode: list  Min Items : 1  Max Items : 1  
                for_each = contains(keys(object.value), "describedObject") ? {item = object.value["describedObject"]} : {}

                content {
                  api_version = lookup(described_object.value, "apiVersion", null)
                  # Type: string Required    
                  # API version of the referent

                  kind = lookup(described_object.value, "kind", null)
                  # Type: string Required    
                  # Kind of the referent; More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds

                  name = lookup(described_object.value, "name", null)
                  # Type: string Required    
                  # Name of the referent; More info: http://kubernetes.io/docs/user-guide/identifiers#names

                }
              }

              dynamic "metric" { # Nesting Mode: list  Min Items : 1  Max Items : 1  
                for_each = contains(keys(object.value), "metric") ? {item = object.value["metric"]} : {}

                content {
                  name = lookup(metric.value, "name", null)
                  # Type: string Required    
                  # name is the name of the given metric

                  dynamic "selector" { # Nesting Mode: list  
                    for_each = lookup(metric.value, "selector", {})

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

              dynamic "target" { # Nesting Mode: list  Max Items : 1  
                for_each = contains(keys(object.value), "target") ? {item = object.value["target"]} : {}

                content {
                  average_utilization = lookup(target.value, "averageUtilization", null)
                  # Type: number   Optional  
                  # averageUtilization is the target value of the average of the resource metric across all relevant pods, represented as a percentage of the requested value of the resource for the pods. Currently only valid for Resource metric source type

                  average_value = lookup(target.value, "averageValue", null)
                  # Type: string   Optional  
                  # averageValue is the target value of the average of the metric across all relevant pods (as a quantity)

                  type = lookup(target.value, "type", null)
                  # Type: string Required    
                  # type represents whether the metric type is Utilization, Value, or AverageValue

                  value = lookup(target.value, "value", null)
                  # Type: string   Optional  
                  # value is the target value of the metric (as a quantity).

                }
              }

            }
          }

          dynamic "pods" { # Nesting Mode: list  Max Items : 1  
            for_each = contains(keys(metric.value), "pods") ? {item = metric.value["pods"]} : {}

            content {
              dynamic "metric" { # Nesting Mode: list  Min Items : 1  Max Items : 1  
                for_each = contains(keys(pods.value), "metric") ? {item = pods.value["metric"]} : {}

                content {
                  name = lookup(metric.value, "name", null)
                  # Type: string Required    
                  # name is the name of the given metric

                  dynamic "selector" { # Nesting Mode: list  
                    for_each = lookup(metric.value, "selector", {})

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

              dynamic "target" { # Nesting Mode: list  Max Items : 1  
                for_each = contains(keys(pods.value), "target") ? {item = pods.value["target"]} : {}

                content {
                  average_utilization = lookup(target.value, "averageUtilization", null)
                  # Type: number   Optional  
                  # averageUtilization is the target value of the average of the resource metric across all relevant pods, represented as a percentage of the requested value of the resource for the pods. Currently only valid for Resource metric source type

                  average_value = lookup(target.value, "averageValue", null)
                  # Type: string   Optional  
                  # averageValue is the target value of the average of the metric across all relevant pods (as a quantity)

                  type = lookup(target.value, "type", null)
                  # Type: string Required    
                  # type represents whether the metric type is Utilization, Value, or AverageValue

                  value = lookup(target.value, "value", null)
                  # Type: string   Optional  
                  # value is the target value of the metric (as a quantity).

                }
              }

            }
          }

          dynamic "resource" { # Nesting Mode: list  Max Items : 1  
            for_each = contains(keys(metric.value), "resource") ? {item = metric.value["resource"]} : {}

            content {
              name = lookup(resource.value, "name", null)
              # Type: string Required    
              # name is the name of the resource in question.

              dynamic "target" { # Nesting Mode: list  Max Items : 1  
                for_each = contains(keys(resource.value), "target") ? {item = resource.value["target"]} : {}

                content {
                  average_utilization = lookup(target.value, "averageUtilization", null)
                  # Type: number   Optional  
                  # averageUtilization is the target value of the average of the resource metric across all relevant pods, represented as a percentage of the requested value of the resource for the pods. Currently only valid for Resource metric source type

                  average_value = lookup(target.value, "averageValue", null)
                  # Type: string   Optional  
                  # averageValue is the target value of the average of the metric across all relevant pods (as a quantity)

                  type = lookup(target.value, "type", null)
                  # Type: string Required    
                  # type represents whether the metric type is Utilization, Value, or AverageValue

                  value = lookup(target.value, "value", null)
                  # Type: string   Optional  
                  # value is the target value of the metric (as a quantity).

                }
              }

            }
          }

        }
      }

      dynamic "scale_target_ref" { # Nesting Mode: list  Min Items : 1  Max Items : 1  
        for_each = contains(keys(spec.value), "scaleTargetRef") ? {item = spec.value["scaleTargetRef"]} : {}

        content {
          api_version = lookup(scale_target_ref.value, "apiVersion", null)
          # Type: string   Optional  
          # API version of the referent

          kind = lookup(scale_target_ref.value, "kind", null)
          # Type: string Required    
          # Kind of the referent. e.g. `ReplicationController`. More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#types-kinds

          name = lookup(scale_target_ref.value, "name", null)
          # Type: string Required    
          # Name of the referent. More info: http://kubernetes.io/docs/user-guide/identifiers#names

        }
      }

    }
  }


}