resource "kubernetes_mutating_webhook_configuration" "instance" { 
  depends_on = [null_resource.module_depends_on]
  for_each = local.mutating_webhook_configuration.applications

  dynamic "metadata" { # Nesting Mode: list  Min Items : 1  Max Items : 1  
    for_each = contains(keys(each.value), "metadata") ? {item = each.value["metadata"]} : {}

    content {
      annotations = lookup(metadata.value, "annotations", null)
      # Type: ['map', 'string']   Optional  
      # An unstructured key value map stored with the mutating webhook configuration that may be used to store arbitrary metadata. More info: http://kubernetes.io/docs/user-guide/annotations

      generate_name = lookup(metadata.value, "generateName", null)
      # Type: string   Optional  
      # Prefix, used by the server, to generate a unique name ONLY IF the `name` field has not been provided. This value will also be combined with a unique suffix. Read more: https://github.com/kubernetes/community/blob/master/contributors/devel/sig-architecture/api-conventions.md#idempotency

      labels = lookup(metadata.value, "labels", null)
      # Type: ['map', 'string']   Optional  
      # Map of string keys and values that can be used to organize and categorize (scope and select) the mutating webhook configuration. May match selectors of replication controllers and services. More info: http://kubernetes.io/docs/user-guide/labels

      name = lookup(metadata.value, "name", null)
      # Type: string   Optional Computed 
      # Name of the mutating webhook configuration, must be unique. Cannot be updated. More info: http://kubernetes.io/docs/user-guide/identifiers#names

    }
  }

  dynamic "webhook" { # Nesting Mode: list  Min Items : 1  
    for_each = lookup(each.value, "webhooks", {})

    content {
      admission_review_versions = lookup(webhook.value, "admissionReviewVersions", null)
      # Type: ['list', 'string']   Optional  
      # AdmissionReviewVersions is an ordered list of preferred `AdmissionReview` versions the Webhook expects. API server will try to use first version in the list which it supports. If none of the versions specified in this list supported by API server, validation will fail for this object. If a persisted webhook configuration specifies allowed versions and does not include any versions known to the API Server, calls to the webhook will fail and be subject to the failure policy.

      failure_policy = lookup(webhook.value, "failurePolicy", null)
      # Type: string   Optional  
      # FailurePolicy defines how unrecognized errors from the admission endpoint are handled - allowed values are Ignore or Fail. Defaults to Fail.

      match_policy = lookup(webhook.value, "matchPolicy", null)
      # Type: string   Optional  
      # matchPolicy defines how the "rules" list is used to match incoming requests. Allowed values are "Exact" or "Equivalent".
      # - Exact: match a request only if it exactly matches a specified rule. For example, if deployments can be modified via apps/v1, apps/v1beta1, and extensions/v1beta1, but "rules" only included `apiGroups:["apps"], apiVersions:["v1"], resources: ["deployments"]`, a request to apps/v1beta1 or extensions/v1beta1 would not be sent to the webhook.
      # - Equivalent: match a request if modifies a resource listed in rules, even via another API group or version. For example, if deployments can be modified via apps/v1, apps/v1beta1, and extensions/v1beta1, and "rules" only included `apiGroups:["apps"], apiVersions:["v1"], resources: ["deployments"]`, a request to apps/v1beta1 or extensions/v1beta1 would be converted to apps/v1 and sent to the webhook.
      # Defaults to "Equivalent"

      name = lookup(webhook.value, "name", null)
      # Type: string Required    
      # The name of the admission webhook. Name should be fully qualified, e.g., imagepolicy.kubernetes.io, where "imagepolicy" is the name of the webhook, and kubernetes.io is the name of the organization. Required.

      reinvocation_policy = lookup(webhook.value, "reinvocationPolicy", null)
      # Type: string   Optional  
      # reinvocationPolicy indicates whether this webhook should be called multiple times as part of a single admission evaluation. Allowed values are "Never" and "IfNeeded".
      # Never: the webhook will not be called more than once in a single admission evaluation.
      # IfNeeded: the webhook will be called at least one additional time as part of the admission evaluation if the object being admitted is modified by other admission plugins after the initial webhook call. Webhooks that specify this option *must* be idempotent, able to process objects they previously admitted. Note: * the number of additional invocations is not guaranteed to be exactly one. * if additional invocations result in further modifications to the object, webhooks are not guaranteed to be invoked again. * webhooks that use this option may be reordered to minimize the number of additional invocations. * to validate an object after all mutations are guaranteed complete, use a validating admission webhook instead.
      # Defaults to "Never".

      side_effects = lookup(webhook.value, "sideEffects", null)
      # Type: string   Optional  
      # SideEffects states whether this webhook has side effects. Acceptable values are: None, NoneOnDryRun (webhooks created via v1beta1 may also specify Some or Unknown). Webhooks with side effects MUST implement a reconciliation system, since a request may be rejected by a future step in the admission change and the side effects therefore need to be undone. Requests with the dryRun attribute will be auto-rejected if they match a webhook with sideEffects == Unknown or Some.

      timeout_seconds = lookup(webhook.value, "timeoutSeconds", null)
      # Type: number   Optional  
      # TimeoutSeconds specifies the timeout for this webhook. After the timeout passes, the webhook call will be ignored or the API call will fail based on the failure policy. The timeout value must be between 1 and 30 seconds. Default to 10 seconds.

      dynamic "client_config" { # Nesting Mode: list  Min Items : 1  Max Items : 1  
        for_each = contains(keys(webhook.value), "clientConfig") ? {item = webhook.value["clientConfig"]} : {}

        content {
          ca_bundle = lookup(client_config.value, "caBundle", null)
          # Type: string   Optional  
          # `caBundle` is a PEM encoded CA bundle which will be used to validate the webhook's server certificate. If unspecified, system trust roots on the apiserver are used.

          url = lookup(client_config.value, "url", null)
          # Type: string   Optional  
          # `url` gives the location of the webhook, in standard URL form (`scheme://host:port/path`). Exactly one of `url` or `service` must be specified.
          # The `host` should not refer to a service running in the cluster; use the `service` field instead. The host might be resolved via external DNS in some apiservers (e.g., `kube-apiserver` cannot resolve in-cluster DNS as that would be a layering violation). `host` may also be an IP address.
          # Please note that using `localhost` or `127.0.0.1` as a `host` is risky unless you take great care to run this webhook on all hosts which run an apiserver which might need to make calls to this webhook. Such installs are likely to be non-portable, i.e., not easy to turn up in a new cluster.
          # The scheme must be "https"; the URL must begin with "https://".
          # A path is optional, and if present may be any string permissible in a URL. You may use the path to pass an arbitrary string to the webhook, for example, a cluster identifier.
          # Attempting to use a user or basic auth e.g. "user:password@" is not allowed. Fragments ("#...") and query parameters ("?...") are not allowed, either.

          dynamic "service" { # Nesting Mode: list  Max Items : 1  
            for_each = contains(keys(client_config.value), "service") ? {item = client_config.value["service"]} : {}

            content {
              name = lookup(service.value, "name", null)
              # Type: string Required    
              # `name` is the name of the service. Required

              namespace = var.namespace != "" ? var.namespace : lookup(service.value, "namespace", null)
              # Type: string Required    
              # `namespace` is the namespace of the service. Required

              path = lookup(service.value, "path", null)
              # Type: string   Optional  
              # `path` is an optional URL path which will be sent in any request to this service.

              port = lookup(service.value, "port", null)
              # Type: number   Optional  
              # If specified, the port on the service that hosting webhook. Default to 443 for backward compatibility. `port` should be a valid port number (1-65535, inclusive).

            }
          }

        }
      }

      dynamic "namespace_selector" { # Nesting Mode: list  Max Items : 1  
        for_each = contains(keys(webhook.value), "namespaceSelector") ? {item = webhook.value["namespaceSelector"]} : {}

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

      dynamic "object_selector" { # Nesting Mode: list  Max Items : 1  
        for_each = contains(keys(webhook.value), "objectSelector") ? {item = webhook.value["objectSelector"]} : {}

        content {
          match_labels = lookup(object_selector.value, "matchLabels", null)
          # Type: ['map', 'string']   Optional  
          # A map of {key,value} pairs. A single {key,value} in the matchLabels map is equivalent to an element of `match_expressions`, whose key field is "key", the operator is "In", and the values array contains only "value". The requirements are ANDed.

          dynamic "match_expressions" { # Nesting Mode: list  
            for_each = lookup(object_selector.value, "matchExpressions", {})

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

      dynamic "rule" { # Nesting Mode: list  Min Items : 1  
        for_each = lookup(webhook.value, "rules", {})

        content {
          api_groups = lookup(rule.value, "apiGroups", null)
          # Type: ['list', 'string'] Required    

          api_versions = lookup(rule.value, "apiVersions", null)
          # Type: ['list', 'string'] Required    

          operations = lookup(rule.value, "operations", null)
          # Type: ['list', 'string'] Required    
          # Operations is the operations the admission hook cares about - CREATE, UPDATE, DELETE, CONNECT or * for all of those operations and any future admission operations that are added. If '*' is present, the length of the slice must be one. Required.

          resources = lookup(rule.value, "resources", null)
          # Type: ['list', 'string'] Required    

          scope = lookup(rule.value, "scope", null)
          # Type: string   Optional  

        }
      }

    }
  }


}