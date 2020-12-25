resource "kubernetes_daemonset" "instance" { 
  depends_on = [null_resource.module_depends_on]
  for_each = local.daemonset.applications

  dynamic "metadata" { # Nesting Mode: list  Min Items : 1  Max Items : 1  
    for_each = contains(keys(each.value), "metadata") ? {item = each.value["metadata"]} : {}

    content {
      annotations = lookup(metadata.value, "annotations", null)
      # Type: ['map', 'string']   Optional  
      # An unstructured key value map stored with the daemonset that may be used to store arbitrary metadata. More info: http://kubernetes.io/docs/user-guide/annotations

      generate_name = lookup(metadata.value, "generateName", null)
      # Type: string   Optional  
      # Prefix, used by the server, to generate a unique name ONLY IF the `name` field has not been provided. This value will also be combined with a unique suffix. Read more: https://github.com/kubernetes/community/blob/master/contributors/devel/sig-architecture/api-conventions.md#idempotency

      labels = lookup(metadata.value, "labels", null)
      # Type: ['map', 'string']   Optional  
      # Map of string keys and values that can be used to organize and categorize (scope and select) the daemonset. May match selectors of replication controllers and services. More info: http://kubernetes.io/docs/user-guide/labels

      name = lookup(metadata.value, "name", null)
      # Type: string   Optional Computed 
      # Name of the daemonset, must be unique. Cannot be updated. More info: http://kubernetes.io/docs/user-guide/identifiers#names

      namespace = var.namespace != "" ? var.namespace : lookup(metadata.value, "namespace", null)
      # Type: string   Optional  
      # Namespace defines the space within which name of the daemonset must be unique.

    }
  }

  dynamic "spec" { # Nesting Mode: list  Min Items : 1  Max Items : 1  
    for_each = contains(keys(each.value), "spec") ? {item = each.value["spec"]} : {}

    content {
      min_ready_seconds = lookup(spec.value, "minReadySeconds", null)
      # Type: number   Optional  
      # Minimum number of seconds for which a newly created pod should be ready without any of its container crashing, for it to be considered available. Defaults to 0 (pod will be considered available as soon as it is ready)

      revision_history_limit = lookup(spec.value, "revisionHistoryLimit", null)
      # Type: number   Optional  
      # The number of old ReplicaSets to retain to allow rollback. This is a pointer to distinguish between explicit zero and not specified. Defaults to 10.

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

      dynamic "strategy" { # Nesting Mode: list  Max Items : 1  
        for_each = contains(keys(spec.value), "strategy") ? {item = spec.value["strategy"]} : {}

        content {
          type = lookup(strategy.value, "type", null)
          # Type: string   Optional  
          # Type of deployment. Can be 'RollingUpdate' or 'OnDelete'. Default is RollingUpdate.

          dynamic "rolling_update" { # Nesting Mode: list  Max Items : 1  
            for_each = contains(keys(strategy.value), "rollingUpdate") ? {item = strategy.value["rollingUpdate"]} : {}

            content {
              max_unavailable = lookup(rolling_update.value, "maxUnavailable", null)
              # Type: string   Optional  
              # The maximum number of DaemonSet pods that can be unavailable during the update. Value can be an absolute number (ex: 5) or a percentage of total number of DaemonSet pods at the start of the update (ex: 10%). Absolute number is calculated from percentage by rounding up. This cannot be 0. Default value is 1. Example: when this is set to 30%, at most 30% of the total number of nodes that should be running the daemon pod (i.e. status.desiredNumberScheduled) can have their pods stopped for an update at any given time. The update starts by stopping at most 30% of those DaemonSet pods and then brings up new DaemonSet pods in their place. Once the new pods are available, it then proceeds onto other DaemonSet pods, thus ensuring that at least 70% of original number of DaemonSet pods are available at all times during the update.

            }
          }

        }
      }

      dynamic "template" { # Nesting Mode: list  Min Items : 1  Max Items : 1  
        for_each = contains(keys(spec.value), "template") ? {item = spec.value["template"]} : {}

        content {
          dynamic "metadata" { # Nesting Mode: list  Min Items : 1  Max Items : 1  
            for_each = contains(keys(template.value), "metadata") ? {item = template.value["metadata"]} : {}

            content {
              annotations = lookup(metadata.value, "annotations", null)
              # Type: ['map', 'string']   Optional  
              # An unstructured key value map stored with the daemon set that may be used to store arbitrary metadata. More info: http://kubernetes.io/docs/user-guide/annotations

              generate_name = lookup(metadata.value, "generateName", null)
              # Type: string   Optional  
              # Prefix, used by the server, to generate a unique name ONLY IF the `name` field has not been provided. This value will also be combined with a unique suffix. Read more: https://github.com/kubernetes/community/blob/master/contributors/devel/sig-architecture/api-conventions.md#idempotency

              labels = lookup(metadata.value, "labels", null)
              # Type: ['map', 'string']   Optional  
              # Map of string keys and values that can be used to organize and categorize (scope and select) the daemon set. May match selectors of replication controllers and services. More info: http://kubernetes.io/docs/user-guide/labels

              name = lookup(metadata.value, "name", null)
              # Type: string   Optional Computed 
              # Name of the daemon set, must be unique. Cannot be updated. More info: http://kubernetes.io/docs/user-guide/identifiers#names

            }
          }

          dynamic "spec" { # Nesting Mode: list  Max Items : 1  
            for_each = contains(keys(template.value), "spec") ? {item = template.value["spec"]} : {}

            content {
              active_deadline_seconds = lookup(spec.value, "activeDeadlineSeconds", null)
              # Type: number   Optional  
              # Optional duration in seconds the pod may be active on the node relative to StartTime before the system will actively try to mark it failed and kill associated containers. Value must be a positive integer.

              automount_service_account_token = lookup(spec.value, "automountServiceAccountToken", null)
              # Type: bool   Optional  
              # AutomountServiceAccountToken indicates whether a service account token should be automatically mounted.

              dns_policy = lookup(spec.value, "dnsPolicy", null)
              # Type: string   Optional  
              # Set DNS policy for containers within the pod. Valid values are 'ClusterFirstWithHostNet', 'ClusterFirst', 'Default' or 'None'. DNS parameters given in DNSConfig will be merged with the policy selected with DNSPolicy. To have DNS options set along with hostNetwork, you have to specify DNS policy explicitly to 'ClusterFirstWithHostNet'. Optional: Defaults to 'ClusterFirst', see [Kubernetes reference](https://kubernetes.io/docs/concepts/services-networking/dns-pod-service/#pod-s-dns-policy).

              enable_service_links = lookup(spec.value, "enableServiceLinks", null)
              # Type: bool   Optional  
              # Enables generating environment variables for service discovery. Optional: Defaults to true.

              host_ipc = lookup(spec.value, "hostIPC", null)
              # Type: bool   Optional  
              # Use the host's ipc namespace. Optional: Defaults to false.

              host_network = lookup(spec.value, "hostNetwork", null)
              # Type: bool   Optional  
              # Host networking requested for this pod. Use the host's network namespace. If this option is set, the ports that will be used must be specified.

              host_pid = lookup(spec.value, "hostPid", null)
              # Type: bool   Optional  
              # Use the host's pid namespace.

              hostname = lookup(spec.value, "hostname", null)
              # Type: string   Optional Computed 
              # Specifies the hostname of the Pod If not specified, the pod's hostname will be set to a system-defined value.

              node_name = lookup(spec.value, "nodeName", null)
              # Type: string   Optional Computed 
              # NodeName is a request to schedule this pod onto a specific node. If it is non-empty, the scheduler simply schedules this pod onto that node, assuming that it fits resource requirements.

              node_selector = lookup(spec.value, "nodeSelector", null)
              # Type: ['map', 'string']   Optional  
              # NodeSelector is a selector which must be true for the pod to fit on a node. Selector which must match a node's labels for the pod to be scheduled on that node. More info: http://kubernetes.io/docs/user-guide/node-selection.

              priority_class_name = lookup(spec.value, "priorityClassName", null)
              # Type: string   Optional  
              # If specified, indicates the pod's priority. "system-node-critical" and "system-cluster-critical" are two special keywords which indicate the highest priorities with the former being the highest priority. Any other name must be defined by creating a PriorityClass object with that name. If not specified, the pod priority will be default or zero if there is no default.

              restart_policy = lookup(spec.value, "restartPolicy", null)
              # Type: string   Optional  
              # Restart policy for all containers within the pod. One of Always, OnFailure, Never. More info: http://kubernetes.io/docs/user-guide/pod-states#restartpolicy.

              service_account_name = lookup(spec.value, "serviceAccountName", null)
              # Type: string   Optional Computed 
              # ServiceAccountName is the name of the ServiceAccount to use to run this pod. More info: http://releases.k8s.io/HEAD/docs/design/service_accounts.md.

              share_process_namespace = lookup(spec.value, "shareProcessNamespace", null)
              # Type: bool   Optional  
              # Share a single process namespace between all of the containers in a pod. When this is set containers will be able to view and signal processes from other containers in the same pod, and the first process in each container will not be assigned PID 1. HostPID and ShareProcessNamespace cannot both be set. Optional: Defaults to false.

              subdomain = lookup(spec.value, "subdomain", null)
              # Type: string   Optional  
              # If specified, the fully qualified Pod hostname will be "...svc.". If not specified, the pod will not have a domainname at all..

              termination_grace_period_seconds = lookup(spec.value, "terminationGracePeriodSeconds", null)
              # Type: number   Optional  
              # Optional duration in seconds the pod needs to terminate gracefully. May be decreased in delete request. Value must be non-negative integer. The value zero indicates delete immediately. If this value is nil, the default grace period will be used instead. The grace period is the duration in seconds after the processes running in the pod are sent a termination signal and the time when the processes are forcibly halted with a kill signal. Set this value longer than the expected cleanup time for your process.

              dynamic "affinity" { # Nesting Mode: list  Max Items : 1  
                for_each = contains(keys(spec.value), "affinity") ? {item = spec.value["affinity"]} : {}

                content {
                  dynamic "node_affinity" { # Nesting Mode: list  Max Items : 1  
                    for_each = contains(keys(affinity.value), "nodeAffinity") ? {item = affinity.value["nodeAffinity"]} : {}

                    content {
                      dynamic "preferred_during_scheduling_ignored_during_execution" { # Nesting Mode: list  
                        for_each = lookup(node_affinity.value, "preferredDuringSchedulingIgnoredDuringExecution", {})

                        content {
                          weight = lookup(preferred_during_scheduling_ignored_during_execution.value, "weight", null)
                          # Type: number Required    
                          # weight is in the range 1-100

                          dynamic "preference" { # Nesting Mode: list  Min Items : 1  Max Items : 1  
                            for_each = contains(keys(preferred_during_scheduling_ignored_during_execution.value), "preference") ? {item = preferred_during_scheduling_ignored_during_execution.value["preference"]} : {}

                            content {
                              dynamic "match_expressions" { # Nesting Mode: list  
                                for_each = lookup(preference.value, "matchExpressions", {})

                                content {
                                  key = lookup(match_expressions.value, "key", null)
                                  # Type: string   Optional  
                                  # The label key that the selector applies to.

                                  operator = lookup(match_expressions.value, "operator", null)
                                  # Type: string   Optional  
                                  # Operator represents a key's relationship to a set of values. Valid operators are In, NotIn, Exists, DoesNotExist. Gt, and Lt.

                                  values = lookup(match_expressions.value, "values", null)
                                  # Type: ['set', 'string']   Optional  
                                  # Values is an array of string values. If the operator is In or NotIn, the values array must be non-empty. If the operator is Exists or DoesNotExist, the values array must be empty. If the operator is Gt or Lt, the values array must have a single element, which will be interpreted as an integer. This array is replaced during a strategic merge patch.

                                }
                              }

                            }
                          }

                        }
                      }

                      dynamic "required_during_scheduling_ignored_during_execution" { # Nesting Mode: list  Max Items : 1  
                        for_each = contains(keys(node_affinity.value), "requiredDuringSchedulingIgnoredDuringExecution") ? {item = node_affinity.value["requiredDuringSchedulingIgnoredDuringExecution"]} : {}

                        content {
                          dynamic "node_selector_term" { # Nesting Mode: list  
                            for_each = lookup(required_during_scheduling_ignored_during_execution.value, "nodeSelectorTerms", {})

                            content {
                              dynamic "match_expressions" { # Nesting Mode: list  
                                for_each = lookup(node_selector_term.value, "matchExpressions", {})

                                content {
                                  key = lookup(match_expressions.value, "key", null)
                                  # Type: string   Optional  
                                  # The label key that the selector applies to.

                                  operator = lookup(match_expressions.value, "operator", null)
                                  # Type: string   Optional  
                                  # Operator represents a key's relationship to a set of values. Valid operators are In, NotIn, Exists, DoesNotExist. Gt, and Lt.

                                  values = lookup(match_expressions.value, "values", null)
                                  # Type: ['set', 'string']   Optional  
                                  # Values is an array of string values. If the operator is In or NotIn, the values array must be non-empty. If the operator is Exists or DoesNotExist, the values array must be empty. If the operator is Gt or Lt, the values array must have a single element, which will be interpreted as an integer. This array is replaced during a strategic merge patch.

                                }
                              }

                            }
                          }

                        }
                      }

                    }
                  }

                  dynamic "pod_affinity" { # Nesting Mode: list  Max Items : 1  
                    for_each = contains(keys(affinity.value), "podAffinity") ? {item = affinity.value["podAffinity"]} : {}

                    content {
                      dynamic "preferred_during_scheduling_ignored_during_execution" { # Nesting Mode: list  
                        for_each = lookup(pod_affinity.value, "preferredDuringSchedulingIgnoredDuringExecution", {})

                        content {
                          weight = lookup(preferred_during_scheduling_ignored_during_execution.value, "weight", null)
                          # Type: number Required    
                          # weight associated with matching the corresponding podAffinityTerm, in the range 1-100

                          dynamic "pod_affinity_term" { # Nesting Mode: list  Min Items : 1  Max Items : 1  
                            for_each = contains(keys(preferred_during_scheduling_ignored_during_execution.value), "podAffinityTerm") ? {item = preferred_during_scheduling_ignored_during_execution.value["podAffinityTerm"]} : {}

                            content {
                              namespaces = lookup(pod_affinity_term.value, "namespaces", null)
                              # Type: ['set', 'string']   Optional  
                              # namespaces specifies which namespaces the labelSelector applies to (matches against); null or empty list means 'this pod's namespace'

                              topology_key = lookup(pod_affinity_term.value, "topologyKey", null)
                              # Type: string   Optional  
                              # empty topology key is interpreted by the scheduler as 'all topologies'

                              dynamic "label_selector" { # Nesting Mode: list  
                                for_each = contains(keys(pod_affinity_term.value), "labelSelector") ? {item = pod_affinity_term.value["labelSelector"]} : {}

                                content {
                                  match_labels = lookup(label_selector.value, "matchLabels", null)
                                  # Type: ['map', 'string']   Optional  
                                  # A map of {key,value} pairs. A single {key,value} in the matchLabels map is equivalent to an element of `match_expressions`, whose key field is "key", the operator is "In", and the values array contains only "value". The requirements are ANDed.

                                  dynamic "match_expressions" { # Nesting Mode: list  
                                    for_each = lookup(label_selector.value, "matchExpressions", {})

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

                      dynamic "required_during_scheduling_ignored_during_execution" { # Nesting Mode: list  
                        for_each = lookup(pod_affinity.value, "requiredDuringSchedulingIgnoredDuringExecution", {})

                        content {
                          namespaces = lookup(required_during_scheduling_ignored_during_execution.value, "namespaces", null)
                          # Type: ['set', 'string']   Optional  
                          # namespaces specifies which namespaces the labelSelector applies to (matches against); null or empty list means 'this pod's namespace'

                          topology_key = lookup(required_during_scheduling_ignored_during_execution.value, "topologyKey", null)
                          # Type: string   Optional  
                          # empty topology key is interpreted by the scheduler as 'all topologies'

                          dynamic "label_selector" { # Nesting Mode: list  
                            for_each = contains(keys(required_during_scheduling_ignored_during_execution.value), "labelSelector") ? {item = required_during_scheduling_ignored_during_execution.value["labelSelector"]} : {}

                            content {
                              match_labels = lookup(label_selector.value, "matchLabels", null)
                              # Type: ['map', 'string']   Optional  
                              # A map of {key,value} pairs. A single {key,value} in the matchLabels map is equivalent to an element of `match_expressions`, whose key field is "key", the operator is "In", and the values array contains only "value". The requirements are ANDed.

                              dynamic "match_expressions" { # Nesting Mode: list  
                                for_each = lookup(label_selector.value, "matchExpressions", {})

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

                  dynamic "pod_anti_affinity" { # Nesting Mode: list  Max Items : 1  
                    for_each = contains(keys(affinity.value), "podAntiAffinity") ? {item = affinity.value["podAntiAffinity"]} : {}

                    content {
                      dynamic "preferred_during_scheduling_ignored_during_execution" { # Nesting Mode: list  
                        for_each = lookup(pod_anti_affinity.value, "preferredDuringSchedulingIgnoredDuringExecution", {})

                        content {
                          weight = lookup(preferred_during_scheduling_ignored_during_execution.value, "weight", null)
                          # Type: number Required    
                          # weight associated with matching the corresponding podAffinityTerm, in the range 1-100

                          dynamic "pod_affinity_term" { # Nesting Mode: list  Min Items : 1  Max Items : 1  
                            for_each = contains(keys(preferred_during_scheduling_ignored_during_execution.value), "podAffinityTerm") ? {item = preferred_during_scheduling_ignored_during_execution.value["podAffinityTerm"]} : {}

                            content {
                              namespaces = lookup(pod_affinity_term.value, "namespaces", null)
                              # Type: ['set', 'string']   Optional  
                              # namespaces specifies which namespaces the labelSelector applies to (matches against); null or empty list means 'this pod's namespace'

                              topology_key = lookup(pod_affinity_term.value, "topologyKey", null)
                              # Type: string   Optional  
                              # empty topology key is interpreted by the scheduler as 'all topologies'

                              dynamic "label_selector" { # Nesting Mode: list  
                                for_each = contains(keys(pod_affinity_term.value), "labelSelector") ? {item = pod_affinity_term.value["labelSelector"]} : {}

                                content {
                                  match_labels = lookup(label_selector.value, "matchLabels", null)
                                  # Type: ['map', 'string']   Optional  
                                  # A map of {key,value} pairs. A single {key,value} in the matchLabels map is equivalent to an element of `match_expressions`, whose key field is "key", the operator is "In", and the values array contains only "value". The requirements are ANDed.

                                  dynamic "match_expressions" { # Nesting Mode: list  
                                    for_each = lookup(label_selector.value, "matchExpressions", {})

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

                      dynamic "required_during_scheduling_ignored_during_execution" { # Nesting Mode: list  
                        for_each = lookup(pod_anti_affinity.value, "requiredDuringSchedulingIgnoredDuringExecution", {})

                        content {
                          namespaces = lookup(required_during_scheduling_ignored_during_execution.value, "namespaces", null)
                          # Type: ['set', 'string']   Optional  
                          # namespaces specifies which namespaces the labelSelector applies to (matches against); null or empty list means 'this pod's namespace'

                          topology_key = lookup(required_during_scheduling_ignored_during_execution.value, "topologyKey", null)
                          # Type: string   Optional  
                          # empty topology key is interpreted by the scheduler as 'all topologies'

                          dynamic "label_selector" { # Nesting Mode: list  
                            for_each = contains(keys(required_during_scheduling_ignored_during_execution.value), "labelSelector") ? {item = required_during_scheduling_ignored_during_execution.value["labelSelector"]} : {}

                            content {
                              match_labels = lookup(label_selector.value, "matchLabels", null)
                              # Type: ['map', 'string']   Optional  
                              # A map of {key,value} pairs. A single {key,value} in the matchLabels map is equivalent to an element of `match_expressions`, whose key field is "key", the operator is "In", and the values array contains only "value". The requirements are ANDed.

                              dynamic "match_expressions" { # Nesting Mode: list  
                                for_each = lookup(label_selector.value, "matchExpressions", {})

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

                }
              }

              dynamic "container" { # Nesting Mode: list  
                for_each = lookup(spec.value, "containers", {})

                content {
                  args = lookup(container.value, "args", null)
                  # Type: ['list', 'string']   Optional  
                  # Arguments to the entrypoint. The docker image's CMD is used if this is not provided. Variable references $(VAR_NAME) are expanded using the container's environment. If a variable cannot be resolved, the reference in the input string will be unchanged. The $(VAR_NAME) syntax can be escaped with a double $$, ie: $$(VAR_NAME). Escaped references will never be expanded, regardless of whether the variable exists or not. Cannot be updated. More info: http://kubernetes.io/docs/user-guide/containers#containers-and-commands

                  command = lookup(container.value, "command", null)
                  # Type: ['list', 'string']   Optional  
                  # Entrypoint array. Not executed within a shell. The docker image's ENTRYPOINT is used if this is not provided. Variable references $(VAR_NAME) are expanded using the container's environment. If a variable cannot be resolved, the reference in the input string will be unchanged. The $(VAR_NAME) syntax can be escaped with a double $$, ie: $$(VAR_NAME). Escaped references will never be expanded, regardless of whether the variable exists or not. Cannot be updated. More info: http://kubernetes.io/docs/user-guide/containers#containers-and-commands

                  image = lookup(container.value, "image", null)
                  # Type: string   Optional  
                  # Docker image name. More info: http://kubernetes.io/docs/user-guide/images

                  image_pull_policy = lookup(container.value, "imagePullPolicy", null)
                  # Type: string   Optional Computed 
                  # Image pull policy. One of Always, Never, IfNotPresent. Defaults to Always if :latest tag is specified, or IfNotPresent otherwise. Cannot be updated. More info: http://kubernetes.io/docs/user-guide/images#updating-images

                  name = lookup(container.value, "name", null)
                  # Type: string Required    
                  # Name of the container specified as a DNS_LABEL. Each container in a pod must have a unique name (DNS_LABEL). Cannot be updated.

                  stdin = lookup(container.value, "stdin", null)
                  # Type: bool   Optional  
                  # Whether this container should allocate a buffer for stdin in the container runtime. If this is not set, reads from stdin in the container will always result in EOF. 

                  stdin_once = lookup(container.value, "stdinOnce", null)
                  # Type: bool   Optional  
                  # Whether the container runtime should close the stdin channel after it has been opened by a single attach. When stdin is true the stdin stream will remain open across multiple attach sessions. If stdinOnce is set to true, stdin is opened on container start, is empty until the first client attaches to stdin, and then remains open and accepts data until the client disconnects, at which time stdin is closed and remains closed until the container is restarted. If this flag is false, a container processes that reads from stdin will never receive an EOF.

                  termination_message_path = lookup(container.value, "terminationMessagePath", null)
                  # Type: string   Optional  
                  # Optional: Path at which the file to which the container's termination message will be written is mounted into the container's filesystem. Message written is intended to be brief final status, such as an assertion failure message. Defaults to /dev/termination-log. Cannot be updated.

                  termination_message_policy = lookup(container.value, "terminationMessagePolicy", null)
                  # Type: string   Optional Computed 
                  # Optional: Indicate how the termination message should be populated. File will use the contents of terminationMessagePath to populate the container status message on both success and failure. FallbackToLogsOnError will use the last chunk of container log output if the termination message file is empty and the container exited with an error. The log output is limited to 2048 bytes or 80 lines, whichever is smaller. Defaults to File. Cannot be updated.

                  tty = lookup(container.value, "tty", null)
                  # Type: bool   Optional  
                  # Whether this container should allocate a TTY for itself

                  working_dir = lookup(container.value, "workingDir", null)
                  # Type: string   Optional  
                  # Container's working directory. If not specified, the container runtime's default will be used, which might be configured in the container image. Cannot be updated.

                  dynamic "env" { # Nesting Mode: list  
                    for_each = lookup(container.value, "env", {})

                    content {
                      name = lookup(env.value, "name", null)
                      # Type: string Required    
                      # Name of the environment variable. Must be a C_IDENTIFIER

                      value = lookup(env.value, "value", null)
                      # Type: string   Optional  
                      # Variable references $(VAR_NAME) are expanded using the previous defined environment variables in the container and any service environment variables. If a variable cannot be resolved, the reference in the input string will be unchanged. The $(VAR_NAME) syntax can be escaped with a double $$, ie: $$(VAR_NAME). Escaped references will never be expanded, regardless of whether the variable exists or not. Defaults to "".

                      dynamic "value_from" { # Nesting Mode: list  Max Items : 1  
                        for_each = contains(keys(env.value), "valueFrom") ? {item = env.value["valueFrom"]} : {}

                        content {
                          dynamic "config_map_key_ref" { # Nesting Mode: list  Max Items : 1  
                            for_each = contains(keys(value_from.value), "configMapKeyRef") ? {item = value_from.value["configMapKeyRef"]} : {}

                            content {
                              key = lookup(config_map_key_ref.value, "key", null)
                              # Type: string   Optional  
                              # The key to select.

                              name = lookup(config_map_key_ref.value, "name", null)
                              # Type: string   Optional  
                              # Name of the referent. More info: http://kubernetes.io/docs/user-guide/identifiers#names

                              optional = lookup(config_map_key_ref.value, "optional", null)
                              # Type: bool   Optional  
                              # Specify whether the ConfigMap or its key must be defined.

                            }
                          }

                          dynamic "field_ref" { # Nesting Mode: list  Max Items : 1  
                            for_each = contains(keys(value_from.value), "fieldRef") ? {item = value_from.value["fieldRef"]} : {}

                            content {
                              api_version = lookup(field_ref.value, "apiVersion", null)
                              # Type: string   Optional  
                              # Version of the schema the FieldPath is written in terms of, defaults to "v1".

                              field_path = lookup(field_ref.value, "fieldPath", null)
                              # Type: string   Optional  
                              # Path of the field to select in the specified API version

                            }
                          }

                          dynamic "resource_field_ref" { # Nesting Mode: list  Max Items : 1  
                            for_each = contains(keys(value_from.value), "resourceFieldRef") ? {item = value_from.value["resourceFieldRef"]} : {}

                            content {
                              container_name = lookup(resource_field_ref.value, "containerName", null)
                              # Type: string   Optional  

                              resource = lookup(resource_field_ref.value, "resource", null)
                              # Type: string Required    
                              # Resource to select

                            }
                          }

                          dynamic "secret_key_ref" { # Nesting Mode: list  Max Items : 1  
                            for_each = contains(keys(value_from.value), "secretKeyRef") ? {item = value_from.value["secretKeyRef"]} : {}

                            content {
                              key = lookup(secret_key_ref.value, "key", null)
                              # Type: string   Optional  
                              # The key of the secret to select from. Must be a valid secret key.

                              name = lookup(secret_key_ref.value, "name", null)
                              # Type: string   Optional  
                              # Name of the referent. More info: http://kubernetes.io/docs/user-guide/identifiers#names

                              optional = lookup(secret_key_ref.value, "optional", null)
                              # Type: bool   Optional  
                              # Specify whether the Secret or its key must be defined.

                            }
                          }

                        }
                      }

                    }
                  }

                  dynamic "env_from" { # Nesting Mode: list  
                    for_each = lookup(container.value, "envFrom", {})

                    content {
                      prefix = lookup(env_from.value, "prefix", null)
                      # Type: string   Optional  
                      # An optional identifer to prepend to each key in the ConfigMap. Must be a C_IDENTIFIER.

                      dynamic "config_map_ref" { # Nesting Mode: list  Max Items : 1  
                        for_each = contains(keys(env_from.value), "configMapRef") ? {item = env_from.value["configMapRef"]} : {}

                        content {
                          name = lookup(config_map_ref.value, "name", null)
                          # Type: string Required    
                          # Name of the referent. More info: http://kubernetes.io/docs/user-guide/identifiers#names

                          optional = lookup(config_map_ref.value, "optional", null)
                          # Type: bool   Optional  
                          # Specify whether the ConfigMap must be defined

                        }
                      }

                      dynamic "secret_ref" { # Nesting Mode: list  Max Items : 1  
                        for_each = contains(keys(env_from.value), "secretRef") ? {item = env_from.value["secretRef"]} : {}

                        content {
                          name = lookup(secret_ref.value, "name", null)
                          # Type: string Required    
                          # Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names

                          optional = lookup(secret_ref.value, "optional", null)
                          # Type: bool   Optional  
                          # Specify whether the Secret must be defined

                        }
                      }

                    }
                  }

                  dynamic "lifecycle" { # Nesting Mode: list  Max Items : 1  
                    for_each = contains(keys(container.value), "lifecycle") ? {item = container.value["lifecycle"]} : {}

                    content {
                      dynamic "post_start" { # Nesting Mode: list  
                        for_each = lookup(lifecycle.value, "postStart", {})

                        content {
                          dynamic "exec" { # Nesting Mode: list  Max Items : 1  
                            for_each = contains(keys(post_start.value), "exec") ? {item = post_start.value["exec"]} : {}

                            content {
                              command = lookup(exec.value, "command", null)
                              # Type: ['list', 'string']   Optional  
                              # Command is the command line to execute inside the container, the working directory for the command is root ('/') in the container's filesystem. The command is simply exec'd, it is not run inside a shell, so traditional shell instructions. To use a shell, you need to explicitly call out to that shell. Exit status of 0 is treated as live/healthy and non-zero is unhealthy.

                            }
                          }

                          dynamic "http_get" { # Nesting Mode: list  Max Items : 1  
                            for_each = contains(keys(post_start.value), "httpGet") ? {item = post_start.value["httpGet"]} : {}

                            content {
                              host = lookup(http_get.value, "host", null)
                              # Type: string   Optional  
                              # Host name to connect to, defaults to the pod IP. You probably want to set "Host" in httpHeaders instead.

                              path = lookup(http_get.value, "path", null)
                              # Type: string   Optional  
                              # Path to access on the HTTP server.

                              port = lookup(http_get.value, "port", null)
                              # Type: string   Optional  
                              # Name or number of the port to access on the container. Number must be in the range 1 to 65535. Name must be an IANA_SVC_NAME.

                              scheme = lookup(http_get.value, "scheme", null)
                              # Type: string   Optional  
                              # Scheme to use for connecting to the host.

                              dynamic "http_header" { # Nesting Mode: list  
                                for_each = lookup(http_get.value, "httpHeaders", {})

                                content {
                                  name = lookup(http_header.value, "name", null)
                                  # Type: string   Optional  
                                  # The header field name

                                  value = lookup(http_header.value, "value", null)
                                  # Type: string   Optional  
                                  # The header field value

                                }
                              }

                            }
                          }

                          dynamic "tcp_socket" { # Nesting Mode: list  
                            for_each = lookup(post_start.value, "tcpSocket", {})

                            content {
                              port = lookup(tcp_socket.value, "port", null)
                              # Type: string Required    
                              # Number or name of the port to access on the container. Number must be in the range 1 to 65535. Name must be an IANA_SVC_NAME.

                            }
                          }

                        }
                      }

                      dynamic "pre_stop" { # Nesting Mode: list  
                        for_each = lookup(lifecycle.value, "preStop", {})

                        content {
                          dynamic "exec" { # Nesting Mode: list  Max Items : 1  
                            for_each = contains(keys(pre_stop.value), "exec") ? {item = pre_stop.value["exec"]} : {}

                            content {
                              command = lookup(exec.value, "command", null)
                              # Type: ['list', 'string']   Optional  
                              # Command is the command line to execute inside the container, the working directory for the command is root ('/') in the container's filesystem. The command is simply exec'd, it is not run inside a shell, so traditional shell instructions. To use a shell, you need to explicitly call out to that shell. Exit status of 0 is treated as live/healthy and non-zero is unhealthy.

                            }
                          }

                          dynamic "http_get" { # Nesting Mode: list  Max Items : 1  
                            for_each = contains(keys(pre_stop.value), "httpGet") ? {item = pre_stop.value["httpGet"]} : {}

                            content {
                              host = lookup(http_get.value, "host", null)
                              # Type: string   Optional  
                              # Host name to connect to, defaults to the pod IP. You probably want to set "Host" in httpHeaders instead.

                              path = lookup(http_get.value, "path", null)
                              # Type: string   Optional  
                              # Path to access on the HTTP server.

                              port = lookup(http_get.value, "port", null)
                              # Type: string   Optional  
                              # Name or number of the port to access on the container. Number must be in the range 1 to 65535. Name must be an IANA_SVC_NAME.

                              scheme = lookup(http_get.value, "scheme", null)
                              # Type: string   Optional  
                              # Scheme to use for connecting to the host.

                              dynamic "http_header" { # Nesting Mode: list  
                                for_each = lookup(http_get.value, "httpHeaders", {})

                                content {
                                  name = lookup(http_header.value, "name", null)
                                  # Type: string   Optional  
                                  # The header field name

                                  value = lookup(http_header.value, "value", null)
                                  # Type: string   Optional  
                                  # The header field value

                                }
                              }

                            }
                          }

                          dynamic "tcp_socket" { # Nesting Mode: list  
                            for_each = lookup(pre_stop.value, "tcpSocket", {})

                            content {
                              port = lookup(tcp_socket.value, "port", null)
                              # Type: string Required    
                              # Number or name of the port to access on the container. Number must be in the range 1 to 65535. Name must be an IANA_SVC_NAME.

                            }
                          }

                        }
                      }

                    }
                  }

                  dynamic "liveness_probe" { # Nesting Mode: list  Max Items : 1  
                    for_each = contains(keys(container.value), "livenessProbe") ? {item = container.value["livenessProbe"]} : {}

                    content {
                      failure_threshold = lookup(liveness_probe.value, "failureThreshold", null)
                      # Type: number   Optional  
                      # Minimum consecutive failures for the probe to be considered failed after having succeeded.

                      initial_delay_seconds = lookup(liveness_probe.value, "initialDelaySeconds", null)
                      # Type: number   Optional  
                      # Number of seconds after the container has started before liveness probes are initiated. More info: http://kubernetes.io/docs/user-guide/pod-states#container-probes

                      period_seconds = lookup(liveness_probe.value, "periodSeconds", null)
                      # Type: number   Optional  
                      # How often (in seconds) to perform the probe

                      success_threshold = lookup(liveness_probe.value, "successThreshold", null)
                      # Type: number   Optional  
                      # Minimum consecutive successes for the probe to be considered successful after having failed.

                      timeout_seconds = lookup(liveness_probe.value, "timeoutSeconds", null)
                      # Type: number   Optional  
                      # Number of seconds after which the probe times out. More info: http://kubernetes.io/docs/user-guide/pod-states#container-probes

                      dynamic "exec" { # Nesting Mode: list  Max Items : 1  
                        for_each = contains(keys(liveness_probe.value), "exec") ? {item = liveness_probe.value["exec"]} : {}

                        content {
                          command = lookup(exec.value, "command", null)
                          # Type: ['list', 'string']   Optional  
                          # Command is the command line to execute inside the container, the working directory for the command is root ('/') in the container's filesystem. The command is simply exec'd, it is not run inside a shell, so traditional shell instructions. To use a shell, you need to explicitly call out to that shell. Exit status of 0 is treated as live/healthy and non-zero is unhealthy.

                        }
                      }

                      dynamic "http_get" { # Nesting Mode: list  Max Items : 1  
                        for_each = contains(keys(liveness_probe.value), "httpGet") ? {item = liveness_probe.value["httpGet"]} : {}

                        content {
                          host = lookup(http_get.value, "host", null)
                          # Type: string   Optional  
                          # Host name to connect to, defaults to the pod IP. You probably want to set "Host" in httpHeaders instead.

                          path = lookup(http_get.value, "path", null)
                          # Type: string   Optional  
                          # Path to access on the HTTP server.

                          port = lookup(http_get.value, "port", null)
                          # Type: string   Optional  
                          # Name or number of the port to access on the container. Number must be in the range 1 to 65535. Name must be an IANA_SVC_NAME.

                          scheme = lookup(http_get.value, "scheme", null)
                          # Type: string   Optional  
                          # Scheme to use for connecting to the host.

                          dynamic "http_header" { # Nesting Mode: list  
                            for_each = lookup(http_get.value, "httpHeaders", {})

                            content {
                              name = lookup(http_header.value, "name", null)
                              # Type: string   Optional  
                              # The header field name

                              value = lookup(http_header.value, "value", null)
                              # Type: string   Optional  
                              # The header field value

                            }
                          }

                        }
                      }

                      dynamic "tcp_socket" { # Nesting Mode: list  
                        for_each = lookup(liveness_probe.value, "tcpSocket", {})

                        content {
                          port = lookup(tcp_socket.value, "port", null)
                          # Type: string Required    
                          # Number or name of the port to access on the container. Number must be in the range 1 to 65535. Name must be an IANA_SVC_NAME.

                        }
                      }

                    }
                  }

                  dynamic "port" { # Nesting Mode: list  
                    for_each = lookup(container.value, "ports", {})

                    content {
                      container_port = lookup(port.value, "containerPort", null)
                      # Type: number Required    
                      # Number of port to expose on the pod's IP address. This must be a valid port number, 0 < x < 65536.

                      host_ip = lookup(port.value, "hostIP", null)
                      # Type: string   Optional  
                      # What host IP to bind the external port to.

                      host_port = lookup(port.value, "hostPort", null)
                      # Type: number   Optional  
                      # Number of port to expose on the host. If specified, this must be a valid port number, 0 < x < 65536. If HostNetwork is specified, this must match ContainerPort. Most containers do not need this.

                      name = lookup(port.value, "name", null)
                      # Type: string   Optional  
                      # If specified, this must be an IANA_SVC_NAME and unique within the pod. Each named port in a pod must have a unique name. Name for the port that can be referred to by services

                      protocol = lookup(port.value, "protocol", null)
                      # Type: string   Optional  
                      # Protocol for port. Must be UDP or TCP. Defaults to "TCP".

                    }
                  }

                  dynamic "readiness_probe" { # Nesting Mode: list  Max Items : 1  
                    for_each = contains(keys(container.value), "readinessProbe") ? {item = container.value["readinessProbe"]} : {}

                    content {
                      failure_threshold = lookup(readiness_probe.value, "failureThreshold", null)
                      # Type: number   Optional  
                      # Minimum consecutive failures for the probe to be considered failed after having succeeded.

                      initial_delay_seconds = lookup(readiness_probe.value, "initialDelaySeconds", null)
                      # Type: number   Optional  
                      # Number of seconds after the container has started before liveness probes are initiated. More info: http://kubernetes.io/docs/user-guide/pod-states#container-probes

                      period_seconds = lookup(readiness_probe.value, "periodSeconds", null)
                      # Type: number   Optional  
                      # How often (in seconds) to perform the probe

                      success_threshold = lookup(readiness_probe.value, "successThreshold", null)
                      # Type: number   Optional  
                      # Minimum consecutive successes for the probe to be considered successful after having failed.

                      timeout_seconds = lookup(readiness_probe.value, "timeoutSeconds", null)
                      # Type: number   Optional  
                      # Number of seconds after which the probe times out. More info: http://kubernetes.io/docs/user-guide/pod-states#container-probes

                      dynamic "exec" { # Nesting Mode: list  Max Items : 1  
                        for_each = contains(keys(readiness_probe.value), "exec") ? {item = readiness_probe.value["exec"]} : {}

                        content {
                          command = lookup(exec.value, "command", null)
                          # Type: ['list', 'string']   Optional  
                          # Command is the command line to execute inside the container, the working directory for the command is root ('/') in the container's filesystem. The command is simply exec'd, it is not run inside a shell, so traditional shell instructions. To use a shell, you need to explicitly call out to that shell. Exit status of 0 is treated as live/healthy and non-zero is unhealthy.

                        }
                      }

                      dynamic "http_get" { # Nesting Mode: list  Max Items : 1  
                        for_each = contains(keys(readiness_probe.value), "httpGet") ? {item = readiness_probe.value["httpGet"]} : {}

                        content {
                          host = lookup(http_get.value, "host", null)
                          # Type: string   Optional  
                          # Host name to connect to, defaults to the pod IP. You probably want to set "Host" in httpHeaders instead.

                          path = lookup(http_get.value, "path", null)
                          # Type: string   Optional  
                          # Path to access on the HTTP server.

                          port = lookup(http_get.value, "port", null)
                          # Type: string   Optional  
                          # Name or number of the port to access on the container. Number must be in the range 1 to 65535. Name must be an IANA_SVC_NAME.

                          scheme = lookup(http_get.value, "scheme", null)
                          # Type: string   Optional  
                          # Scheme to use for connecting to the host.

                          dynamic "http_header" { # Nesting Mode: list  
                            for_each = lookup(http_get.value, "httpHeaders", {})

                            content {
                              name = lookup(http_header.value, "name", null)
                              # Type: string   Optional  
                              # The header field name

                              value = lookup(http_header.value, "value", null)
                              # Type: string   Optional  
                              # The header field value

                            }
                          }

                        }
                      }

                      dynamic "tcp_socket" { # Nesting Mode: list  
                        for_each = lookup(readiness_probe.value, "tcpSocket", {})

                        content {
                          port = lookup(tcp_socket.value, "port", null)
                          # Type: string Required    
                          # Number or name of the port to access on the container. Number must be in the range 1 to 65535. Name must be an IANA_SVC_NAME.

                        }
                      }

                    }
                  }

                  dynamic "resources" { # Nesting Mode: list  Max Items : 1  
                    for_each = contains(keys(container.value), "resources") ? {item = container.value["resources"]} : {}

                    content {
                      dynamic "limits" { # Nesting Mode: list  Max Items : 1  
                        for_each = contains(keys(resources.value), "limits") ? {item = resources.value["limits"]} : {}

                        content {
                          cpu = lookup(limits.value, "cpu", null)
                          # Type: string   Optional Computed 

                          memory = lookup(limits.value, "memory", null)
                          # Type: string   Optional Computed 

                        }
                      }

                      dynamic "requests" { # Nesting Mode: list  Max Items : 1  
                        for_each = contains(keys(resources.value), "requests") ? {item = resources.value["requests"]} : {}

                        content {
                          cpu = lookup(requests.value, "cpu", null)
                          # Type: string   Optional Computed 

                          memory = lookup(requests.value, "memory", null)
                          # Type: string   Optional Computed 

                        }
                      }

                    }
                  }

                  dynamic "security_context" { # Nesting Mode: list  Max Items : 1  
                    for_each = contains(keys(container.value), "securityContext") ? {item = container.value["securityContext"]} : {}

                    content {
                      allow_privilege_escalation = lookup(security_context.value, "allowPrivilegeEscalation", null)
                      # Type: bool   Optional  
                      # AllowPrivilegeEscalation controls whether a process can gain more privileges than its parent process. This bool directly controls if the no_new_privs flag will be set on the container process. AllowPrivilegeEscalation is true always when the container is: 1) run as Privileged 2) has CAP_SYS_ADMIN

                      privileged = lookup(security_context.value, "privileged", null)
                      # Type: bool   Optional  
                      # Run container in privileged mode. Processes in privileged containers are essentially equivalent to root on the host. Defaults to false.

                      read_only_root_filesystem = lookup(security_context.value, "readOnlyRootFilesystem", null)
                      # Type: bool   Optional  
                      # Whether this container has a read-only root filesystem. Default is false.

                      run_as_group = lookup(security_context.value, "runAsGroup", null)
                      # Type: number   Optional  
                      # The GID to run the entrypoint of the container process. Uses runtime default if unset. May also be set in PodSecurityContext. If set in both SecurityContext and PodSecurityContext, the value specified in SecurityContext takes precedence.

                      run_as_non_root = lookup(security_context.value, "runAsNonRoot", null)
                      # Type: bool   Optional  
                      # Indicates that the container must run as a non-root user. If true, the Kubelet will validate the image at runtime to ensure that it does not run as UID 0 (root) and fail to start the container if it does. If unset or false, no such validation will be performed. May also be set in PodSecurityContext. If set in both SecurityContext and PodSecurityContext, the value specified in SecurityContext takes precedence.

                      run_as_user = lookup(security_context.value, "runAsUser", null)
                      # Type: number   Optional  
                      # The UID to run the entrypoint of the container process. Defaults to user specified in image metadata if unspecified. May also be set in PodSecurityContext. If set in both SecurityContext and PodSecurityContext, the value specified in SecurityContext takes precedence.

                      dynamic "capabilities" { # Nesting Mode: list  Max Items : 1  
                        for_each = contains(keys(security_context.value), "capabilities") ? {item = security_context.value["capabilities"]} : {}

                        content {
                          add = lookup(capabilities.value, "add", null)
                          # Type: ['list', 'string']   Optional  
                          # Added capabilities

                          drop = lookup(capabilities.value, "drop", null)
                          # Type: ['list', 'string']   Optional  
                          # Removed capabilities

                        }
                      }

                      dynamic "se_linux_options" { # Nesting Mode: list  Max Items : 1  
                        for_each = contains(keys(security_context.value), "seLinuxOptions") ? {item = security_context.value["seLinuxOptions"]} : {}

                        content {
                          level = lookup(se_linux_options.value, "level", null)
                          # Type: string   Optional  
                          # Level is SELinux level label that applies to the container.

                          role = lookup(se_linux_options.value, "role", null)
                          # Type: string   Optional  
                          # Role is a SELinux role label that applies to the container.

                          type = lookup(se_linux_options.value, "type", null)
                          # Type: string   Optional  
                          # Type is a SELinux type label that applies to the container.

                          user = lookup(se_linux_options.value, "user", null)
                          # Type: string   Optional  
                          # User is a SELinux user label that applies to the container.

                        }
                      }

                    }
                  }

                  dynamic "startup_probe" { # Nesting Mode: list  Max Items : 1  
                    for_each = contains(keys(container.value), "startupProbe") ? {item = container.value["startupProbe"]} : {}

                    content {
                      failure_threshold = lookup(startup_probe.value, "failureThreshold", null)
                      # Type: number   Optional  
                      # Minimum consecutive failures for the probe to be considered failed after having succeeded.

                      initial_delay_seconds = lookup(startup_probe.value, "initialDelaySeconds", null)
                      # Type: number   Optional  
                      # Number of seconds after the container has started before liveness probes are initiated. More info: http://kubernetes.io/docs/user-guide/pod-states#container-probes

                      period_seconds = lookup(startup_probe.value, "periodSeconds", null)
                      # Type: number   Optional  
                      # How often (in seconds) to perform the probe

                      success_threshold = lookup(startup_probe.value, "successThreshold", null)
                      # Type: number   Optional  
                      # Minimum consecutive successes for the probe to be considered successful after having failed.

                      timeout_seconds = lookup(startup_probe.value, "timeoutSeconds", null)
                      # Type: number   Optional  
                      # Number of seconds after which the probe times out. More info: http://kubernetes.io/docs/user-guide/pod-states#container-probes

                      dynamic "exec" { # Nesting Mode: list  Max Items : 1  
                        for_each = contains(keys(startup_probe.value), "exec") ? {item = startup_probe.value["exec"]} : {}

                        content {
                          command = lookup(exec.value, "command", null)
                          # Type: ['list', 'string']   Optional  
                          # Command is the command line to execute inside the container, the working directory for the command is root ('/') in the container's filesystem. The command is simply exec'd, it is not run inside a shell, so traditional shell instructions. To use a shell, you need to explicitly call out to that shell. Exit status of 0 is treated as live/healthy and non-zero is unhealthy.

                        }
                      }

                      dynamic "http_get" { # Nesting Mode: list  Max Items : 1  
                        for_each = contains(keys(startup_probe.value), "httpGet") ? {item = startup_probe.value["httpGet"]} : {}

                        content {
                          host = lookup(http_get.value, "host", null)
                          # Type: string   Optional  
                          # Host name to connect to, defaults to the pod IP. You probably want to set "Host" in httpHeaders instead.

                          path = lookup(http_get.value, "path", null)
                          # Type: string   Optional  
                          # Path to access on the HTTP server.

                          port = lookup(http_get.value, "port", null)
                          # Type: string   Optional  
                          # Name or number of the port to access on the container. Number must be in the range 1 to 65535. Name must be an IANA_SVC_NAME.

                          scheme = lookup(http_get.value, "scheme", null)
                          # Type: string   Optional  
                          # Scheme to use for connecting to the host.

                          dynamic "http_header" { # Nesting Mode: list  
                            for_each = lookup(http_get.value, "httpHeaders", {})

                            content {
                              name = lookup(http_header.value, "name", null)
                              # Type: string   Optional  
                              # The header field name

                              value = lookup(http_header.value, "value", null)
                              # Type: string   Optional  
                              # The header field value

                            }
                          }

                        }
                      }

                      dynamic "tcp_socket" { # Nesting Mode: list  
                        for_each = lookup(startup_probe.value, "tcpSocket", {})

                        content {
                          port = lookup(tcp_socket.value, "port", null)
                          # Type: string Required    
                          # Number or name of the port to access on the container. Number must be in the range 1 to 65535. Name must be an IANA_SVC_NAME.

                        }
                      }

                    }
                  }

                  dynamic "volume_mount" { # Nesting Mode: list  
                    for_each = lookup(container.value, "volumeMounts", {})

                    content {
                      mount_path = lookup(volume_mount.value, "mountPath", null)
                      # Type: string Required    
                      # Path within the container at which the volume should be mounted. Must not contain ':'.

                      mount_propagation = lookup(volume_mount.value, "mountPropagation", null)
                      # Type: string   Optional  
                      # Mount propagation mode. mount_propagation determines how mounts are propagated from the host to container and the other way around. Valid values are None (default), HostToContainer and Bidirectional.

                      name = lookup(volume_mount.value, "name", null)
                      # Type: string Required    
                      # This must match the Name of a Volume.

                      read_only = lookup(volume_mount.value, "readOnly", null)
                      # Type: bool   Optional  
                      # Mounted read-only if true, read-write otherwise (false or unspecified). Defaults to false.

                      sub_path = lookup(volume_mount.value, "subPath", null)
                      # Type: string   Optional  
                      # Path within the volume from which the container's volume should be mounted. Defaults to "" (volume's root).

                    }
                  }

                }
              }

              dynamic "dns_config" { # Nesting Mode: list  Max Items : 1  
                for_each = contains(keys(spec.value), "dnsConfig") ? {item = spec.value["dnsConfig"]} : {}

                content {
                  nameservers = lookup(dns_config.value, "nameservers", null)
                  # Type: ['list', 'string']   Optional  
                  # A list of DNS name server IP addresses. This will be appended to the base nameservers generated from DNSPolicy. Duplicated nameservers will be removed.

                  searches = lookup(dns_config.value, "searches", null)
                  # Type: ['list', 'string']   Optional  
                  # A list of DNS search domains for host-name lookup. This will be appended to the base search paths generated from DNSPolicy. Duplicated search paths will be removed.

                  dynamic "option" { # Nesting Mode: list  
                    for_each = lookup(dns_config.value, "options", {})

                    content {
                      name = lookup(option.value, "name", null)
                      # Type: string Required    
                      # Name of the option.

                      value = lookup(option.value, "value", null)
                      # Type: string   Optional  
                      # Value of the option. Optional: Defaults to empty.

                    }
                  }

                }
              }

              dynamic "host_aliases" { # Nesting Mode: list  
                for_each = lookup(spec.value, "hostAliases", {})

                content {
                  hostnames = lookup(host_aliases.value, "hostnames", null)
                  # Type: ['list', 'string'] Required    
                  # Hostnames for the IP address.

                  ip = lookup(host_aliases.value, "ip", null)
                  # Type: string Required    
                  # IP address of the host file entry.

                }
              }

              dynamic "image_pull_secrets" { # Nesting Mode: list  
                for_each = lookup(spec.value, "imagePullSecrets", {})

                content {
                  name = lookup(image_pull_secrets.value, "name", null)
                  # Type: string Required    
                  # Name of the referent. More info: http://kubernetes.io/docs/user-guide/identifiers#names

                }
              }

              dynamic "init_container" { # Nesting Mode: list  
                for_each = lookup(spec.value, "initContainers", {})

                content {
                  args = lookup(init_container.value, "args", null)
                  # Type: ['list', 'string']   Optional  
                  # Arguments to the entrypoint. The docker image's CMD is used if this is not provided. Variable references $(VAR_NAME) are expanded using the container's environment. If a variable cannot be resolved, the reference in the input string will be unchanged. The $(VAR_NAME) syntax can be escaped with a double $$, ie: $$(VAR_NAME). Escaped references will never be expanded, regardless of whether the variable exists or not. Cannot be updated. More info: http://kubernetes.io/docs/user-guide/containers#containers-and-commands

                  command = lookup(init_container.value, "command", null)
                  # Type: ['list', 'string']   Optional  
                  # Entrypoint array. Not executed within a shell. The docker image's ENTRYPOINT is used if this is not provided. Variable references $(VAR_NAME) are expanded using the container's environment. If a variable cannot be resolved, the reference in the input string will be unchanged. The $(VAR_NAME) syntax can be escaped with a double $$, ie: $$(VAR_NAME). Escaped references will never be expanded, regardless of whether the variable exists or not. Cannot be updated. More info: http://kubernetes.io/docs/user-guide/containers#containers-and-commands

                  image = lookup(init_container.value, "image", null)
                  # Type: string   Optional  
                  # Docker image name. More info: http://kubernetes.io/docs/user-guide/images

                  image_pull_policy = lookup(init_container.value, "imagePullPolicy", null)
                  # Type: string   Optional Computed 
                  # Image pull policy. One of Always, Never, IfNotPresent. Defaults to Always if :latest tag is specified, or IfNotPresent otherwise. Cannot be updated. More info: http://kubernetes.io/docs/user-guide/images#updating-images

                  name = lookup(init_container.value, "name", null)
                  # Type: string Required    
                  # Name of the container specified as a DNS_LABEL. Each container in a pod must have a unique name (DNS_LABEL). Cannot be updated.

                  stdin = lookup(init_container.value, "stdin", null)
                  # Type: bool   Optional  
                  # Whether this container should allocate a buffer for stdin in the container runtime. If this is not set, reads from stdin in the container will always result in EOF. 

                  stdin_once = lookup(init_container.value, "stdinOnce", null)
                  # Type: bool   Optional  
                  # Whether the container runtime should close the stdin channel after it has been opened by a single attach. When stdin is true the stdin stream will remain open across multiple attach sessions. If stdinOnce is set to true, stdin is opened on container start, is empty until the first client attaches to stdin, and then remains open and accepts data until the client disconnects, at which time stdin is closed and remains closed until the container is restarted. If this flag is false, a container processes that reads from stdin will never receive an EOF.

                  termination_message_path = lookup(init_container.value, "terminationMessagePath", null)
                  # Type: string   Optional  
                  # Optional: Path at which the file to which the container's termination message will be written is mounted into the container's filesystem. Message written is intended to be brief final status, such as an assertion failure message. Defaults to /dev/termination-log. Cannot be updated.

                  termination_message_policy = lookup(init_container.value, "terminationMessagePolicy", null)
                  # Type: string   Optional Computed 
                  # Optional: Indicate how the termination message should be populated. File will use the contents of terminationMessagePath to populate the container status message on both success and failure. FallbackToLogsOnError will use the last chunk of container log output if the termination message file is empty and the container exited with an error. The log output is limited to 2048 bytes or 80 lines, whichever is smaller. Defaults to File. Cannot be updated.

                  tty = lookup(init_container.value, "tty", null)
                  # Type: bool   Optional  
                  # Whether this container should allocate a TTY for itself

                  working_dir = lookup(init_container.value, "workingDir", null)
                  # Type: string   Optional  
                  # Container's working directory. If not specified, the container runtime's default will be used, which might be configured in the container image. Cannot be updated.

                  dynamic "env" { # Nesting Mode: list  
                    for_each = lookup(init_container.value, "env", {})

                    content {
                      name = lookup(env.value, "name", null)
                      # Type: string Required    
                      # Name of the environment variable. Must be a C_IDENTIFIER

                      value = lookup(env.value, "value", null)
                      # Type: string   Optional  
                      # Variable references $(VAR_NAME) are expanded using the previous defined environment variables in the container and any service environment variables. If a variable cannot be resolved, the reference in the input string will be unchanged. The $(VAR_NAME) syntax can be escaped with a double $$, ie: $$(VAR_NAME). Escaped references will never be expanded, regardless of whether the variable exists or not. Defaults to "".

                      dynamic "value_from" { # Nesting Mode: list  Max Items : 1  
                        for_each = contains(keys(env.value), "valueFrom") ? {item = env.value["valueFrom"]} : {}

                        content {
                          dynamic "config_map_key_ref" { # Nesting Mode: list  Max Items : 1  
                            for_each = contains(keys(value_from.value), "configMapKeyRef") ? {item = value_from.value["configMapKeyRef"]} : {}

                            content {
                              key = lookup(config_map_key_ref.value, "key", null)
                              # Type: string   Optional  
                              # The key to select.

                              name = lookup(config_map_key_ref.value, "name", null)
                              # Type: string   Optional  
                              # Name of the referent. More info: http://kubernetes.io/docs/user-guide/identifiers#names

                              optional = lookup(config_map_key_ref.value, "optional", null)
                              # Type: bool   Optional  
                              # Specify whether the ConfigMap or its key must be defined.

                            }
                          }

                          dynamic "field_ref" { # Nesting Mode: list  Max Items : 1  
                            for_each = contains(keys(value_from.value), "fieldRef") ? {item = value_from.value["fieldRef"]} : {}

                            content {
                              api_version = lookup(field_ref.value, "apiVersion", null)
                              # Type: string   Optional  
                              # Version of the schema the FieldPath is written in terms of, defaults to "v1".

                              field_path = lookup(field_ref.value, "fieldPath", null)
                              # Type: string   Optional  
                              # Path of the field to select in the specified API version

                            }
                          }

                          dynamic "resource_field_ref" { # Nesting Mode: list  Max Items : 1  
                            for_each = contains(keys(value_from.value), "resourceFieldRef") ? {item = value_from.value["resourceFieldRef"]} : {}

                            content {
                              container_name = lookup(resource_field_ref.value, "containerName", null)
                              # Type: string   Optional  

                              resource = lookup(resource_field_ref.value, "resource", null)
                              # Type: string Required    
                              # Resource to select

                            }
                          }

                          dynamic "secret_key_ref" { # Nesting Mode: list  Max Items : 1  
                            for_each = contains(keys(value_from.value), "secretKeyRef") ? {item = value_from.value["secretKeyRef"]} : {}

                            content {
                              key = lookup(secret_key_ref.value, "key", null)
                              # Type: string   Optional  
                              # The key of the secret to select from. Must be a valid secret key.

                              name = lookup(secret_key_ref.value, "name", null)
                              # Type: string   Optional  
                              # Name of the referent. More info: http://kubernetes.io/docs/user-guide/identifiers#names

                              optional = lookup(secret_key_ref.value, "optional", null)
                              # Type: bool   Optional  
                              # Specify whether the Secret or its key must be defined.

                            }
                          }

                        }
                      }

                    }
                  }

                  dynamic "env_from" { # Nesting Mode: list  
                    for_each = lookup(init_container.value, "envFrom", {})

                    content {
                      prefix = lookup(env_from.value, "prefix", null)
                      # Type: string   Optional  
                      # An optional identifer to prepend to each key in the ConfigMap. Must be a C_IDENTIFIER.

                      dynamic "config_map_ref" { # Nesting Mode: list  Max Items : 1  
                        for_each = contains(keys(env_from.value), "configMapRef") ? {item = env_from.value["configMapRef"]} : {}

                        content {
                          name = lookup(config_map_ref.value, "name", null)
                          # Type: string Required    
                          # Name of the referent. More info: http://kubernetes.io/docs/user-guide/identifiers#names

                          optional = lookup(config_map_ref.value, "optional", null)
                          # Type: bool   Optional  
                          # Specify whether the ConfigMap must be defined

                        }
                      }

                      dynamic "secret_ref" { # Nesting Mode: list  Max Items : 1  
                        for_each = contains(keys(env_from.value), "secretRef") ? {item = env_from.value["secretRef"]} : {}

                        content {
                          name = lookup(secret_ref.value, "name", null)
                          # Type: string Required    
                          # Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names

                          optional = lookup(secret_ref.value, "optional", null)
                          # Type: bool   Optional  
                          # Specify whether the Secret must be defined

                        }
                      }

                    }
                  }

                  dynamic "lifecycle" { # Nesting Mode: list  Max Items : 1  
                    for_each = contains(keys(init_container.value), "lifecycle") ? {item = init_container.value["lifecycle"]} : {}

                    content {
                      dynamic "post_start" { # Nesting Mode: list  
                        for_each = lookup(lifecycle.value, "postStart", {})

                        content {
                          dynamic "exec" { # Nesting Mode: list  Max Items : 1  
                            for_each = contains(keys(post_start.value), "exec") ? {item = post_start.value["exec"]} : {}

                            content {
                              command = lookup(exec.value, "command", null)
                              # Type: ['list', 'string']   Optional  
                              # Command is the command line to execute inside the container, the working directory for the command is root ('/') in the container's filesystem. The command is simply exec'd, it is not run inside a shell, so traditional shell instructions. To use a shell, you need to explicitly call out to that shell. Exit status of 0 is treated as live/healthy and non-zero is unhealthy.

                            }
                          }

                          dynamic "http_get" { # Nesting Mode: list  Max Items : 1  
                            for_each = contains(keys(post_start.value), "httpGet") ? {item = post_start.value["httpGet"]} : {}

                            content {
                              host = lookup(http_get.value, "host", null)
                              # Type: string   Optional  
                              # Host name to connect to, defaults to the pod IP. You probably want to set "Host" in httpHeaders instead.

                              path = lookup(http_get.value, "path", null)
                              # Type: string   Optional  
                              # Path to access on the HTTP server.

                              port = lookup(http_get.value, "port", null)
                              # Type: string   Optional  
                              # Name or number of the port to access on the container. Number must be in the range 1 to 65535. Name must be an IANA_SVC_NAME.

                              scheme = lookup(http_get.value, "scheme", null)
                              # Type: string   Optional  
                              # Scheme to use for connecting to the host.

                              dynamic "http_header" { # Nesting Mode: list  
                                for_each = lookup(http_get.value, "httpHeaders", {})

                                content {
                                  name = lookup(http_header.value, "name", null)
                                  # Type: string   Optional  
                                  # The header field name

                                  value = lookup(http_header.value, "value", null)
                                  # Type: string   Optional  
                                  # The header field value

                                }
                              }

                            }
                          }

                          dynamic "tcp_socket" { # Nesting Mode: list  
                            for_each = lookup(post_start.value, "tcpSocket", {})

                            content {
                              port = lookup(tcp_socket.value, "port", null)
                              # Type: string Required    
                              # Number or name of the port to access on the container. Number must be in the range 1 to 65535. Name must be an IANA_SVC_NAME.

                            }
                          }

                        }
                      }

                      dynamic "pre_stop" { # Nesting Mode: list  
                        for_each = lookup(lifecycle.value, "preStop", {})

                        content {
                          dynamic "exec" { # Nesting Mode: list  Max Items : 1  
                            for_each = contains(keys(pre_stop.value), "exec") ? {item = pre_stop.value["exec"]} : {}

                            content {
                              command = lookup(exec.value, "command", null)
                              # Type: ['list', 'string']   Optional  
                              # Command is the command line to execute inside the container, the working directory for the command is root ('/') in the container's filesystem. The command is simply exec'd, it is not run inside a shell, so traditional shell instructions. To use a shell, you need to explicitly call out to that shell. Exit status of 0 is treated as live/healthy and non-zero is unhealthy.

                            }
                          }

                          dynamic "http_get" { # Nesting Mode: list  Max Items : 1  
                            for_each = contains(keys(pre_stop.value), "httpGet") ? {item = pre_stop.value["httpGet"]} : {}

                            content {
                              host = lookup(http_get.value, "host", null)
                              # Type: string   Optional  
                              # Host name to connect to, defaults to the pod IP. You probably want to set "Host" in httpHeaders instead.

                              path = lookup(http_get.value, "path", null)
                              # Type: string   Optional  
                              # Path to access on the HTTP server.

                              port = lookup(http_get.value, "port", null)
                              # Type: string   Optional  
                              # Name or number of the port to access on the container. Number must be in the range 1 to 65535. Name must be an IANA_SVC_NAME.

                              scheme = lookup(http_get.value, "scheme", null)
                              # Type: string   Optional  
                              # Scheme to use for connecting to the host.

                              dynamic "http_header" { # Nesting Mode: list  
                                for_each = lookup(http_get.value, "httpHeaders", {})

                                content {
                                  name = lookup(http_header.value, "name", null)
                                  # Type: string   Optional  
                                  # The header field name

                                  value = lookup(http_header.value, "value", null)
                                  # Type: string   Optional  
                                  # The header field value

                                }
                              }

                            }
                          }

                          dynamic "tcp_socket" { # Nesting Mode: list  
                            for_each = lookup(pre_stop.value, "tcpSocket", {})

                            content {
                              port = lookup(tcp_socket.value, "port", null)
                              # Type: string Required    
                              # Number or name of the port to access on the container. Number must be in the range 1 to 65535. Name must be an IANA_SVC_NAME.

                            }
                          }

                        }
                      }

                    }
                  }

                  dynamic "liveness_probe" { # Nesting Mode: list  Max Items : 1  
                    for_each = contains(keys(init_container.value), "livenessProbe") ? {item = init_container.value["livenessProbe"]} : {}

                    content {
                      failure_threshold = lookup(liveness_probe.value, "failureThreshold", null)
                      # Type: number   Optional  
                      # Minimum consecutive failures for the probe to be considered failed after having succeeded.

                      initial_delay_seconds = lookup(liveness_probe.value, "initialDelaySeconds", null)
                      # Type: number   Optional  
                      # Number of seconds after the container has started before liveness probes are initiated. More info: http://kubernetes.io/docs/user-guide/pod-states#container-probes

                      period_seconds = lookup(liveness_probe.value, "periodSeconds", null)
                      # Type: number   Optional  
                      # How often (in seconds) to perform the probe

                      success_threshold = lookup(liveness_probe.value, "successThreshold", null)
                      # Type: number   Optional  
                      # Minimum consecutive successes for the probe to be considered successful after having failed.

                      timeout_seconds = lookup(liveness_probe.value, "timeoutSeconds", null)
                      # Type: number   Optional  
                      # Number of seconds after which the probe times out. More info: http://kubernetes.io/docs/user-guide/pod-states#container-probes

                      dynamic "exec" { # Nesting Mode: list  Max Items : 1  
                        for_each = contains(keys(liveness_probe.value), "exec") ? {item = liveness_probe.value["exec"]} : {}

                        content {
                          command = lookup(exec.value, "command", null)
                          # Type: ['list', 'string']   Optional  
                          # Command is the command line to execute inside the container, the working directory for the command is root ('/') in the container's filesystem. The command is simply exec'd, it is not run inside a shell, so traditional shell instructions. To use a shell, you need to explicitly call out to that shell. Exit status of 0 is treated as live/healthy and non-zero is unhealthy.

                        }
                      }

                      dynamic "http_get" { # Nesting Mode: list  Max Items : 1  
                        for_each = contains(keys(liveness_probe.value), "httpGet") ? {item = liveness_probe.value["httpGet"]} : {}

                        content {
                          host = lookup(http_get.value, "host", null)
                          # Type: string   Optional  
                          # Host name to connect to, defaults to the pod IP. You probably want to set "Host" in httpHeaders instead.

                          path = lookup(http_get.value, "path", null)
                          # Type: string   Optional  
                          # Path to access on the HTTP server.

                          port = lookup(http_get.value, "port", null)
                          # Type: string   Optional  
                          # Name or number of the port to access on the container. Number must be in the range 1 to 65535. Name must be an IANA_SVC_NAME.

                          scheme = lookup(http_get.value, "scheme", null)
                          # Type: string   Optional  
                          # Scheme to use for connecting to the host.

                          dynamic "http_header" { # Nesting Mode: list  
                            for_each = lookup(http_get.value, "httpHeaders", {})

                            content {
                              name = lookup(http_header.value, "name", null)
                              # Type: string   Optional  
                              # The header field name

                              value = lookup(http_header.value, "value", null)
                              # Type: string   Optional  
                              # The header field value

                            }
                          }

                        }
                      }

                      dynamic "tcp_socket" { # Nesting Mode: list  
                        for_each = lookup(liveness_probe.value, "tcpSocket", {})

                        content {
                          port = lookup(tcp_socket.value, "port", null)
                          # Type: string Required    
                          # Number or name of the port to access on the container. Number must be in the range 1 to 65535. Name must be an IANA_SVC_NAME.

                        }
                      }

                    }
                  }

                  dynamic "port" { # Nesting Mode: list  
                    for_each = lookup(init_container.value, "ports", {})

                    content {
                      container_port = lookup(port.value, "containerPort", null)
                      # Type: number Required    
                      # Number of port to expose on the pod's IP address. This must be a valid port number, 0 < x < 65536.

                      host_ip = lookup(port.value, "hostIP", null)
                      # Type: string   Optional  
                      # What host IP to bind the external port to.

                      host_port = lookup(port.value, "hostPort", null)
                      # Type: number   Optional  
                      # Number of port to expose on the host. If specified, this must be a valid port number, 0 < x < 65536. If HostNetwork is specified, this must match ContainerPort. Most containers do not need this.

                      name = lookup(port.value, "name", null)
                      # Type: string   Optional  
                      # If specified, this must be an IANA_SVC_NAME and unique within the pod. Each named port in a pod must have a unique name. Name for the port that can be referred to by services

                      protocol = lookup(port.value, "protocol", null)
                      # Type: string   Optional  
                      # Protocol for port. Must be UDP or TCP. Defaults to "TCP".

                    }
                  }

                  dynamic "readiness_probe" { # Nesting Mode: list  Max Items : 1  
                    for_each = contains(keys(init_container.value), "readinessProbe") ? {item = init_container.value["readinessProbe"]} : {}

                    content {
                      failure_threshold = lookup(readiness_probe.value, "failureThreshold", null)
                      # Type: number   Optional  
                      # Minimum consecutive failures for the probe to be considered failed after having succeeded.

                      initial_delay_seconds = lookup(readiness_probe.value, "initialDelaySeconds", null)
                      # Type: number   Optional  
                      # Number of seconds after the container has started before liveness probes are initiated. More info: http://kubernetes.io/docs/user-guide/pod-states#container-probes

                      period_seconds = lookup(readiness_probe.value, "periodSeconds", null)
                      # Type: number   Optional  
                      # How often (in seconds) to perform the probe

                      success_threshold = lookup(readiness_probe.value, "successThreshold", null)
                      # Type: number   Optional  
                      # Minimum consecutive successes for the probe to be considered successful after having failed.

                      timeout_seconds = lookup(readiness_probe.value, "timeoutSeconds", null)
                      # Type: number   Optional  
                      # Number of seconds after which the probe times out. More info: http://kubernetes.io/docs/user-guide/pod-states#container-probes

                      dynamic "exec" { # Nesting Mode: list  Max Items : 1  
                        for_each = contains(keys(readiness_probe.value), "exec") ? {item = readiness_probe.value["exec"]} : {}

                        content {
                          command = lookup(exec.value, "command", null)
                          # Type: ['list', 'string']   Optional  
                          # Command is the command line to execute inside the container, the working directory for the command is root ('/') in the container's filesystem. The command is simply exec'd, it is not run inside a shell, so traditional shell instructions. To use a shell, you need to explicitly call out to that shell. Exit status of 0 is treated as live/healthy and non-zero is unhealthy.

                        }
                      }

                      dynamic "http_get" { # Nesting Mode: list  Max Items : 1  
                        for_each = contains(keys(readiness_probe.value), "httpGet") ? {item = readiness_probe.value["httpGet"]} : {}

                        content {
                          host = lookup(http_get.value, "host", null)
                          # Type: string   Optional  
                          # Host name to connect to, defaults to the pod IP. You probably want to set "Host" in httpHeaders instead.

                          path = lookup(http_get.value, "path", null)
                          # Type: string   Optional  
                          # Path to access on the HTTP server.

                          port = lookup(http_get.value, "port", null)
                          # Type: string   Optional  
                          # Name or number of the port to access on the container. Number must be in the range 1 to 65535. Name must be an IANA_SVC_NAME.

                          scheme = lookup(http_get.value, "scheme", null)
                          # Type: string   Optional  
                          # Scheme to use for connecting to the host.

                          dynamic "http_header" { # Nesting Mode: list  
                            for_each = lookup(http_get.value, "httpHeaders", {})

                            content {
                              name = lookup(http_header.value, "name", null)
                              # Type: string   Optional  
                              # The header field name

                              value = lookup(http_header.value, "value", null)
                              # Type: string   Optional  
                              # The header field value

                            }
                          }

                        }
                      }

                      dynamic "tcp_socket" { # Nesting Mode: list  
                        for_each = lookup(readiness_probe.value, "tcpSocket", {})

                        content {
                          port = lookup(tcp_socket.value, "port", null)
                          # Type: string Required    
                          # Number or name of the port to access on the container. Number must be in the range 1 to 65535. Name must be an IANA_SVC_NAME.

                        }
                      }

                    }
                  }

                  dynamic "resources" { # Nesting Mode: list  Max Items : 1  
                    for_each = contains(keys(init_container.value), "resources") ? {item = init_container.value["resources"]} : {}

                    content {
                      dynamic "limits" { # Nesting Mode: list  Max Items : 1  
                        for_each = contains(keys(resources.value), "limits") ? {item = resources.value["limits"]} : {}

                        content {
                          cpu = lookup(limits.value, "cpu", null)
                          # Type: string   Optional Computed 

                          memory = lookup(limits.value, "memory", null)
                          # Type: string   Optional Computed 

                        }
                      }

                      dynamic "requests" { # Nesting Mode: list  Max Items : 1  
                        for_each = contains(keys(resources.value), "requests") ? {item = resources.value["requests"]} : {}

                        content {
                          cpu = lookup(requests.value, "cpu", null)
                          # Type: string   Optional Computed 

                          memory = lookup(requests.value, "memory", null)
                          # Type: string   Optional Computed 

                        }
                      }

                    }
                  }

                  dynamic "security_context" { # Nesting Mode: list  Max Items : 1  
                    for_each = contains(keys(init_container.value), "securityContext") ? {item = init_container.value["securityContext"]} : {}

                    content {
                      allow_privilege_escalation = lookup(security_context.value, "allowPrivilegeEscalation", null)
                      # Type: bool   Optional  
                      # AllowPrivilegeEscalation controls whether a process can gain more privileges than its parent process. This bool directly controls if the no_new_privs flag will be set on the container process. AllowPrivilegeEscalation is true always when the container is: 1) run as Privileged 2) has CAP_SYS_ADMIN

                      privileged = lookup(security_context.value, "privileged", null)
                      # Type: bool   Optional  
                      # Run container in privileged mode. Processes in privileged containers are essentially equivalent to root on the host. Defaults to false.

                      read_only_root_filesystem = lookup(security_context.value, "readOnlyRootFilesystem", null)
                      # Type: bool   Optional  
                      # Whether this container has a read-only root filesystem. Default is false.

                      run_as_group = lookup(security_context.value, "runAsGroup", null)
                      # Type: number   Optional  
                      # The GID to run the entrypoint of the container process. Uses runtime default if unset. May also be set in PodSecurityContext. If set in both SecurityContext and PodSecurityContext, the value specified in SecurityContext takes precedence.

                      run_as_non_root = lookup(security_context.value, "runAsNonRoot", null)
                      # Type: bool   Optional  
                      # Indicates that the container must run as a non-root user. If true, the Kubelet will validate the image at runtime to ensure that it does not run as UID 0 (root) and fail to start the container if it does. If unset or false, no such validation will be performed. May also be set in PodSecurityContext. If set in both SecurityContext and PodSecurityContext, the value specified in SecurityContext takes precedence.

                      run_as_user = lookup(security_context.value, "runAsUser", null)
                      # Type: number   Optional  
                      # The UID to run the entrypoint of the container process. Defaults to user specified in image metadata if unspecified. May also be set in PodSecurityContext. If set in both SecurityContext and PodSecurityContext, the value specified in SecurityContext takes precedence.

                      dynamic "capabilities" { # Nesting Mode: list  Max Items : 1  
                        for_each = contains(keys(security_context.value), "capabilities") ? {item = security_context.value["capabilities"]} : {}

                        content {
                          add = lookup(capabilities.value, "add", null)
                          # Type: ['list', 'string']   Optional  
                          # Added capabilities

                          drop = lookup(capabilities.value, "drop", null)
                          # Type: ['list', 'string']   Optional  
                          # Removed capabilities

                        }
                      }

                      dynamic "se_linux_options" { # Nesting Mode: list  Max Items : 1  
                        for_each = contains(keys(security_context.value), "seLinuxOptions") ? {item = security_context.value["seLinuxOptions"]} : {}

                        content {
                          level = lookup(se_linux_options.value, "level", null)
                          # Type: string   Optional  
                          # Level is SELinux level label that applies to the container.

                          role = lookup(se_linux_options.value, "role", null)
                          # Type: string   Optional  
                          # Role is a SELinux role label that applies to the container.

                          type = lookup(se_linux_options.value, "type", null)
                          # Type: string   Optional  
                          # Type is a SELinux type label that applies to the container.

                          user = lookup(se_linux_options.value, "user", null)
                          # Type: string   Optional  
                          # User is a SELinux user label that applies to the container.

                        }
                      }

                    }
                  }

                  dynamic "startup_probe" { # Nesting Mode: list  Max Items : 1  
                    for_each = contains(keys(init_container.value), "startupProbe") ? {item = init_container.value["startupProbe"]} : {}

                    content {
                      failure_threshold = lookup(startup_probe.value, "failureThreshold", null)
                      # Type: number   Optional  
                      # Minimum consecutive failures for the probe to be considered failed after having succeeded.

                      initial_delay_seconds = lookup(startup_probe.value, "initialDelaySeconds", null)
                      # Type: number   Optional  
                      # Number of seconds after the container has started before liveness probes are initiated. More info: http://kubernetes.io/docs/user-guide/pod-states#container-probes

                      period_seconds = lookup(startup_probe.value, "periodSeconds", null)
                      # Type: number   Optional  
                      # How often (in seconds) to perform the probe

                      success_threshold = lookup(startup_probe.value, "successThreshold", null)
                      # Type: number   Optional  
                      # Minimum consecutive successes for the probe to be considered successful after having failed.

                      timeout_seconds = lookup(startup_probe.value, "timeoutSeconds", null)
                      # Type: number   Optional  
                      # Number of seconds after which the probe times out. More info: http://kubernetes.io/docs/user-guide/pod-states#container-probes

                      dynamic "exec" { # Nesting Mode: list  Max Items : 1  
                        for_each = contains(keys(startup_probe.value), "exec") ? {item = startup_probe.value["exec"]} : {}

                        content {
                          command = lookup(exec.value, "command", null)
                          # Type: ['list', 'string']   Optional  
                          # Command is the command line to execute inside the container, the working directory for the command is root ('/') in the container's filesystem. The command is simply exec'd, it is not run inside a shell, so traditional shell instructions. To use a shell, you need to explicitly call out to that shell. Exit status of 0 is treated as live/healthy and non-zero is unhealthy.

                        }
                      }

                      dynamic "http_get" { # Nesting Mode: list  Max Items : 1  
                        for_each = contains(keys(startup_probe.value), "httpGet") ? {item = startup_probe.value["httpGet"]} : {}

                        content {
                          host = lookup(http_get.value, "host", null)
                          # Type: string   Optional  
                          # Host name to connect to, defaults to the pod IP. You probably want to set "Host" in httpHeaders instead.

                          path = lookup(http_get.value, "path", null)
                          # Type: string   Optional  
                          # Path to access on the HTTP server.

                          port = lookup(http_get.value, "port", null)
                          # Type: string   Optional  
                          # Name or number of the port to access on the container. Number must be in the range 1 to 65535. Name must be an IANA_SVC_NAME.

                          scheme = lookup(http_get.value, "scheme", null)
                          # Type: string   Optional  
                          # Scheme to use for connecting to the host.

                          dynamic "http_header" { # Nesting Mode: list  
                            for_each = lookup(http_get.value, "httpHeaders", {})

                            content {
                              name = lookup(http_header.value, "name", null)
                              # Type: string   Optional  
                              # The header field name

                              value = lookup(http_header.value, "value", null)
                              # Type: string   Optional  
                              # The header field value

                            }
                          }

                        }
                      }

                      dynamic "tcp_socket" { # Nesting Mode: list  
                        for_each = lookup(startup_probe.value, "tcpSocket", {})

                        content {
                          port = lookup(tcp_socket.value, "port", null)
                          # Type: string Required    
                          # Number or name of the port to access on the container. Number must be in the range 1 to 65535. Name must be an IANA_SVC_NAME.

                        }
                      }

                    }
                  }

                  dynamic "volume_mount" { # Nesting Mode: list  
                    for_each = lookup(init_container.value, "volumeMounts", {})

                    content {
                      mount_path = lookup(volume_mount.value, "mountPath", null)
                      # Type: string Required    
                      # Path within the container at which the volume should be mounted. Must not contain ':'.

                      mount_propagation = lookup(volume_mount.value, "mountPropagation", null)
                      # Type: string   Optional  
                      # Mount propagation mode. mount_propagation determines how mounts are propagated from the host to container and the other way around. Valid values are None (default), HostToContainer and Bidirectional.

                      name = lookup(volume_mount.value, "name", null)
                      # Type: string Required    
                      # This must match the Name of a Volume.

                      read_only = lookup(volume_mount.value, "readOnly", null)
                      # Type: bool   Optional  
                      # Mounted read-only if true, read-write otherwise (false or unspecified). Defaults to false.

                      sub_path = lookup(volume_mount.value, "subPath", null)
                      # Type: string   Optional  
                      # Path within the volume from which the container's volume should be mounted. Defaults to "" (volume's root).

                    }
                  }

                }
              }

              dynamic "readiness_gate" { # Nesting Mode: list  
                for_each = lookup(spec.value, "readinessGate", {})

                content {
                  condition_type = lookup(readiness_gate.value, "conditionType", null)
                  # Type: string Required    
                  # refers to a condition in the pod's condition list with matching type.

                }
              }

              dynamic "security_context" { # Nesting Mode: list  Max Items : 1  
                for_each = contains(keys(spec.value), "securityContext") ? {item = spec.value["securityContext"]} : {}

                content {
                  fs_group = lookup(security_context.value, "fsGroup", null)
                  # Type: number   Optional  
                  # A special supplemental group that applies to all containers in a pod. Some volume types allow the Kubelet to change the ownership of that volume to be owned by the pod: 1. The owning GID will be the FSGroup 2. The setgid bit is set (new files created in the volume will be owned by FSGroup) 3. The permission bits are OR'd with rw-rw---- If unset, the Kubelet will not modify the ownership and permissions of any volume.

                  run_as_group = lookup(security_context.value, "runAsGroup", null)
                  # Type: number   Optional  
                  # The GID to run the entrypoint of the container process. Uses runtime default if unset. May also be set in SecurityContext. If set in both SecurityContext and PodSecurityContext, the value specified in SecurityContext takes precedence for that container.

                  run_as_non_root = lookup(security_context.value, "runAsNonRoot", null)
                  # Type: bool   Optional  
                  # Indicates that the container must run as a non-root user. If true, the Kubelet will validate the image at runtime to ensure that it does not run as UID 0 (root) and fail to start the container if it does. If unset or false, no such validation will be performed. May also be set in SecurityContext. If set in both SecurityContext and PodSecurityContext, the value specified in SecurityContext takes precedence.

                  run_as_user = lookup(security_context.value, "runAsUser", null)
                  # Type: number   Optional  
                  # The UID to run the entrypoint of the container process. Defaults to user specified in image metadata if unspecified. May also be set in SecurityContext. If set in both SecurityContext and PodSecurityContext, the value specified in SecurityContext takes precedence for that container.

                  supplemental_groups = lookup(security_context.value, "supplementalGroups", null)
                  # Type: ['set', 'number']   Optional  
                  # A list of groups applied to the first process run in each container, in addition to the container's primary GID. If unspecified, no groups will be added to any container.

                  dynamic "se_linux_options" { # Nesting Mode: list  Max Items : 1  
                    for_each = contains(keys(security_context.value), "seLinuxOptions") ? {item = security_context.value["seLinuxOptions"]} : {}

                    content {
                      level = lookup(se_linux_options.value, "level", null)
                      # Type: string   Optional  
                      # Level is SELinux level label that applies to the container.

                      role = lookup(se_linux_options.value, "role", null)
                      # Type: string   Optional  
                      # Role is a SELinux role label that applies to the container.

                      type = lookup(se_linux_options.value, "type", null)
                      # Type: string   Optional  
                      # Type is a SELinux type label that applies to the container.

                      user = lookup(se_linux_options.value, "user", null)
                      # Type: string   Optional  
                      # User is a SELinux user label that applies to the container.

                    }
                  }

                  dynamic "sysctl" { # Nesting Mode: list  
                    for_each = lookup(security_context.value, "sysctl", {})

                    content {
                      name = lookup(sysctl.value, "name", null)
                      # Type: string Required    
                      # Name of a property to set.

                      value = lookup(sysctl.value, "value", null)
                      # Type: string Required    
                      # Value of a property to set.

                    }
                  }

                }
              }

              dynamic "toleration" { # Nesting Mode: list  
                for_each = lookup(spec.value, "tolerations", {})

                content {
                  effect = lookup(toleration.value, "effect", null)
                  # Type: string   Optional  
                  # Effect indicates the taint effect to match. Empty means match all taint effects. When specified, allowed values are NoSchedule, PreferNoSchedule and NoExecute.

                  key = lookup(toleration.value, "key", null)
                  # Type: string   Optional  
                  # Key is the taint key that the toleration applies to. Empty means match all taint keys. If the key is empty, operator must be Exists; this combination means to match all values and all keys.

                  operator = lookup(toleration.value, "operator", null)
                  # Type: string   Optional  
                  # Operator represents a key's relationship to the value. Valid operators are Exists and Equal. Defaults to Equal. Exists is equivalent to wildcard for value, so that a pod can tolerate all taints of a particular category.

                  toleration_seconds = lookup(toleration.value, "tolerationSeconds", null)
                  # Type: string   Optional  
                  # TolerationSeconds represents the period of time the toleration (which must be of effect NoExecute, otherwise this field is ignored) tolerates the taint. By default, it is not set, which means tolerate the taint forever (do not evict). Zero and negative values will be treated as 0 (evict immediately) by the system.

                  value = lookup(toleration.value, "value", null)
                  # Type: string   Optional  
                  # Value is the taint value the toleration matches to. If the operator is Exists, the value should be empty, otherwise just a regular string.

                }
              }

              dynamic "volume" { # Nesting Mode: list  
                for_each = lookup(spec.value, "volumes", {})

                content {
                  name = lookup(volume.value, "name", null)
                  # Type: string   Optional  
                  # Volume's name. Must be a DNS_LABEL and unique within the pod. More info: http://kubernetes.io/docs/user-guide/identifiers#names

                  dynamic "aws_elastic_block_store" { # Nesting Mode: list  Max Items : 1  
                    for_each = contains(keys(volume.value), "awsElasticBlockStore") ? {item = volume.value["awsElasticBlockStore"]} : {}

                    content {
                      fs_type = lookup(aws_elastic_block_store.value, "fsType", null)
                      # Type: string   Optional  
                      # Filesystem type of the volume that you want to mount. Tip: Ensure that the filesystem type is supported by the host operating system. Examples: "ext4", "xfs", "ntfs". Implicitly inferred to be "ext4" if unspecified. More info: http://kubernetes.io/docs/user-guide/volumes#awselasticblockstore

                      partition = lookup(aws_elastic_block_store.value, "partition", null)
                      # Type: number   Optional  
                      # The partition in the volume that you want to mount. If omitted, the default is to mount by volume name. Examples: For volume /dev/sda1, you specify the partition as "1". Similarly, the volume partition for /dev/sda is "0" (or you can leave the property empty).

                      read_only = lookup(aws_elastic_block_store.value, "readOnly", null)
                      # Type: bool   Optional  
                      # Whether to set the read-only property in VolumeMounts to "true". If omitted, the default is "false". More info: http://kubernetes.io/docs/user-guide/volumes#awselasticblockstore

                      volume_id = lookup(aws_elastic_block_store.value, "volumeId", null)
                      # Type: string Required    
                      # Unique ID of the persistent disk resource in AWS (Amazon EBS volume). More info: http://kubernetes.io/docs/user-guide/volumes#awselasticblockstore

                    }
                  }

                  dynamic "azure_disk" { # Nesting Mode: list  Max Items : 1  
                    for_each = contains(keys(volume.value), "azureDisk") ? {item = volume.value["azureDisk"]} : {}

                    content {
                      caching_mode = lookup(azure_disk.value, "cachingMode", null)
                      # Type: string Required    
                      # Host Caching mode: None, Read Only, Read Write.

                      data_disk_uri = lookup(azure_disk.value, "dataDiskUri", null)
                      # Type: string Required    
                      # The URI the data disk in the blob storage

                      disk_name = lookup(azure_disk.value, "diskName", null)
                      # Type: string Required    
                      # The Name of the data disk in the blob storage

                      fs_type = lookup(azure_disk.value, "fsType", null)
                      # Type: string   Optional  
                      # Filesystem type to mount. Must be a filesystem type supported by the host operating system. Ex. "ext4", "xfs", "ntfs". Implicitly inferred to be "ext4" if unspecified.

                      kind = lookup(azure_disk.value, "kind", null)
                      # Type: string   Optional Computed 
                      # The type for the data disk. Expected values: Shared, Dedicated, Managed. Defaults to Shared

                      read_only = lookup(azure_disk.value, "readOnly", null)
                      # Type: bool   Optional  
                      # Whether to force the read-only setting in VolumeMounts. Defaults to false (read/write).

                    }
                  }

                  dynamic "azure_file" { # Nesting Mode: list  Max Items : 1  
                    for_each = contains(keys(volume.value), "azureFile") ? {item = volume.value["azureFile"]} : {}

                    content {
                      read_only = lookup(azure_file.value, "readOnly", null)
                      # Type: bool   Optional  
                      # Whether to force the read-only setting in VolumeMounts. Defaults to false (read/write).

                      secret_name = lookup(azure_file.value, "secretName", null)
                      # Type: string Required    
                      # The name of secret that contains Azure Storage Account Name and Key

                      share_name = lookup(azure_file.value, "shareName", null)
                      # Type: string Required    
                      # Share Name

                    }
                  }

                  dynamic "ceph_fs" { # Nesting Mode: list  Max Items : 1  
                    for_each = contains(keys(volume.value), "cephFs") ? {item = volume.value["cephFs"]} : {}

                    content {
                      monitors = lookup(ceph_fs.value, "monitors", null)
                      # Type: ['set', 'string'] Required    
                      # Monitors is a collection of Ceph monitors More info: http://releases.k8s.io/HEAD/examples/volumes/cephfs/README.md#how-to-use-it

                      path = lookup(ceph_fs.value, "path", null)
                      # Type: string   Optional  
                      # Used as the mounted root, rather than the full Ceph tree, default is /

                      read_only = lookup(ceph_fs.value, "readOnly", null)
                      # Type: bool   Optional  
                      # Whether to force the read-only setting in VolumeMounts. Defaults to `false` (read/write). More info: http://releases.k8s.io/HEAD/examples/volumes/cephfs/README.md#how-to-use-it

                      secret_file = lookup(ceph_fs.value, "secretFile", null)
                      # Type: string   Optional  
                      # The path to key ring for User, default is /etc/ceph/user.secret More info: http://releases.k8s.io/HEAD/examples/volumes/cephfs/README.md#how-to-use-it

                      user = lookup(ceph_fs.value, "user", null)
                      # Type: string   Optional  
                      # User is the rados user name, default is admin. More info: http://releases.k8s.io/HEAD/examples/volumes/cephfs/README.md#how-to-use-it

                      dynamic "secret_ref" { # Nesting Mode: list  Max Items : 1  
                        for_each = contains(keys(ceph_fs.value), "secretRef") ? {item = ceph_fs.value["secretRef"]} : {}

                        content {
                          name = lookup(secret_ref.value, "name", null)
                          # Type: string   Optional  
                          # Name of the referent. More info: http://kubernetes.io/docs/user-guide/identifiers#names

                          namespace = var.namespace != "" ? var.namespace : lookup(secret_ref.value, "namespace", null)
                          # Type: string   Optional Computed 
                          # Name of the referent. More info: http://kubernetes.io/docs/user-guide/identifiers#names

                        }
                      }

                    }
                  }

                  dynamic "cinder" { # Nesting Mode: list  Max Items : 1  
                    for_each = contains(keys(volume.value), "cinder") ? {item = volume.value["cinder"]} : {}

                    content {
                      fs_type = lookup(cinder.value, "fsType", null)
                      # Type: string   Optional  
                      # Filesystem type to mount. Must be a filesystem type supported by the host operating system. Examples: "ext4", "xfs", "ntfs". Implicitly inferred to be "ext4" if unspecified. More info: http://releases.k8s.io/HEAD/examples/mysql-cinder-pd/README.md

                      read_only = lookup(cinder.value, "readOnly", null)
                      # Type: bool   Optional  
                      # Whether to force the read-only setting in VolumeMounts. Defaults to false (read/write). More info: http://releases.k8s.io/HEAD/examples/mysql-cinder-pd/README.md

                      volume_id = lookup(cinder.value, "volumeId", null)
                      # Type: string Required    
                      # Volume ID used to identify the volume in Cinder. More info: http://releases.k8s.io/HEAD/examples/mysql-cinder-pd/README.md

                    }
                  }

                  dynamic "config_map" { # Nesting Mode: list  Max Items : 1  
                    for_each = contains(keys(volume.value), "configMap") ? {item = volume.value["configMap"]} : {}

                    content {
                      default_mode = lookup(config_map.value, "defaultMode", null)
                      # Type: string   Optional  
                      # Optional: mode bits to use on created files by default. Must be a value between 0 and 0777. Defaults to 0644. Directories within the path are not affected by this setting. This might be in conflict with other options that affect the file mode, like fsGroup, and the result can be other mode bits set.

                      name = lookup(config_map.value, "name", null)
                      # Type: string   Optional  
                      # Name of the referent. More info: http://kubernetes.io/docs/user-guide/identifiers#names

                      optional = lookup(config_map.value, "optional", null)
                      # Type: bool   Optional  
                      # Optional: Specify whether the ConfigMap or its keys must be defined.

                      dynamic "items" { # Nesting Mode: list  
                        for_each = lookup(config_map.value, "items", {})

                        content {
                          key = lookup(items.value, "key", null)
                          # Type: string   Optional  
                          # The key to project.

                          mode = lookup(items.value, "mode", null)
                          # Type: string   Optional  
                          # Optional: mode bits to use on this file, must be a value between 0 and 0777. If not specified, the volume defaultMode will be used. This might be in conflict with other options that affect the file mode, like fsGroup, and the result can be other mode bits set.

                          path = lookup(items.value, "path", null)
                          # Type: string   Optional  
                          # The relative path of the file to map the key to. May not be an absolute path. May not contain the path element '..'. May not start with the string '..'.

                        }
                      }

                    }
                  }

                  dynamic "csi" { # Nesting Mode: list  Max Items : 1  
                    for_each = contains(keys(volume.value), "csi") ? {item = volume.value["csi"]} : {}

                    content {
                      driver = lookup(csi.value, "driver", null)
                      # Type: string Required    
                      # the name of the volume driver to use. More info: https://kubernetes.io/docs/concepts/storage/volumes/#csi

                      fs_type = lookup(csi.value, "fsType", null)
                      # Type: string   Optional  
                      # Filesystem type to mount. Must be a filesystem type supported by the host operating system. Ex. "ext4", "xfs", "ntfs". Implicitly inferred to be "ext4" if unspecified.

                      read_only = lookup(csi.value, "readOnly", null)
                      # Type: bool   Optional  
                      # Whether to set the read-only property in VolumeMounts to "true". If omitted, the default is "false". More info: http://kubernetes.io/docs/user-guide/volumes#csi

                      volume_attributes = lookup(csi.value, "volumeAttributes", null)
                      # Type: ['map', 'string']   Optional  
                      # Attributes of the volume to publish.

                      volume_handle = lookup(csi.value, "volumeHandle", null)
                      # Type: string Required    
                      # A string value that uniquely identifies the volume. More info: https://kubernetes.io/docs/concepts/storage/volumes/#csi

                      dynamic "controller_expand_secret_ref" { # Nesting Mode: list  Max Items : 1  
                        for_each = contains(keys(csi.value), "controllerExpandSecretRef") ? {item = csi.value["controllerExpandSecretRef"]} : {}

                        content {
                          name = lookup(controller_expand_secret_ref.value, "name", null)
                          # Type: string   Optional  
                          # Name of the referent. More info: http://kubernetes.io/docs/user-guide/identifiers#names

                          namespace = var.namespace != "" ? var.namespace : lookup(controller_expand_secret_ref.value, "namespace", null)
                          # Type: string   Optional Computed 
                          # Name of the referent. More info: http://kubernetes.io/docs/user-guide/identifiers#names

                        }
                      }

                      dynamic "controller_publish_secret_ref" { # Nesting Mode: list  Max Items : 1  
                        for_each = contains(keys(csi.value), "controllerPublishSecretRef") ? {item = csi.value["controllerPublishSecretRef"]} : {}

                        content {
                          name = lookup(controller_publish_secret_ref.value, "name", null)
                          # Type: string   Optional  
                          # Name of the referent. More info: http://kubernetes.io/docs/user-guide/identifiers#names

                          namespace = var.namespace != "" ? var.namespace : lookup(controller_publish_secret_ref.value, "namespace", null)
                          # Type: string   Optional Computed 
                          # Name of the referent. More info: http://kubernetes.io/docs/user-guide/identifiers#names

                        }
                      }

                      dynamic "node_publish_secret_ref" { # Nesting Mode: list  Max Items : 1  
                        for_each = contains(keys(csi.value), "nodePublishSecretRef") ? {item = csi.value["nodePublishSecretRef"]} : {}

                        content {
                          name = lookup(node_publish_secret_ref.value, "name", null)
                          # Type: string   Optional  
                          # Name of the referent. More info: http://kubernetes.io/docs/user-guide/identifiers#names

                          namespace = var.namespace != "" ? var.namespace : lookup(node_publish_secret_ref.value, "namespace", null)
                          # Type: string   Optional Computed 
                          # Name of the referent. More info: http://kubernetes.io/docs/user-guide/identifiers#names

                        }
                      }

                      dynamic "node_stage_secret_ref" { # Nesting Mode: list  Max Items : 1  
                        for_each = contains(keys(csi.value), "nodeStageSecretRef") ? {item = csi.value["nodeStageSecretRef"]} : {}

                        content {
                          name = lookup(node_stage_secret_ref.value, "name", null)
                          # Type: string   Optional  
                          # Name of the referent. More info: http://kubernetes.io/docs/user-guide/identifiers#names

                          namespace = var.namespace != "" ? var.namespace : lookup(node_stage_secret_ref.value, "namespace", null)
                          # Type: string   Optional Computed 
                          # Name of the referent. More info: http://kubernetes.io/docs/user-guide/identifiers#names

                        }
                      }

                    }
                  }

                  dynamic "downward_api" { # Nesting Mode: list  Max Items : 1  
                    for_each = contains(keys(volume.value), "downwardApi") ? {item = volume.value["downwardApi"]} : {}

                    content {
                      default_mode = lookup(downward_api.value, "defaultMode", null)
                      # Type: string   Optional  
                      # Optional: mode bits to use on created files by default. Must be a value between 0 and 0777. Defaults to 0644. Directories within the path are not affected by this setting. This might be in conflict with other options that affect the file mode, like fsGroup, and the result can be other mode bits set.

                      dynamic "items" { # Nesting Mode: list  
                        for_each = lookup(downward_api.value, "items", {})

                        content {
                          mode = lookup(items.value, "mode", null)
                          # Type: string   Optional  
                          # Optional: mode bits to use on this file, must be a value between 0 and 0777. If not specified, the volume defaultMode will be used. This might be in conflict with other options that affect the file mode, like fsGroup, and the result can be other mode bits set.

                          path = lookup(items.value, "path", null)
                          # Type: string Required    
                          # Path is the relative path name of the file to be created. Must not be absolute or contain the '..' path. Must be utf-8 encoded. The first item of the relative path must not start with '..'

                          dynamic "field_ref" { # Nesting Mode: list  Min Items : 1  Max Items : 1  
                            for_each = contains(keys(items.value), "fieldRef") ? {item = items.value["fieldRef"]} : {}

                            content {
                              api_version = lookup(field_ref.value, "apiVersion", null)
                              # Type: string   Optional  
                              # Version of the schema the FieldPath is written in terms of, defaults to "v1".

                              field_path = lookup(field_ref.value, "fieldPath", null)
                              # Type: string   Optional  
                              # Path of the field to select in the specified API version

                            }
                          }

                          dynamic "resource_field_ref" { # Nesting Mode: list  Max Items : 1  
                            for_each = contains(keys(items.value), "resourceFieldRef") ? {item = items.value["resourceFieldRef"]} : {}

                            content {
                              container_name = lookup(resource_field_ref.value, "containerName", null)
                              # Type: string Required    

                              quantity = lookup(resource_field_ref.value, "quantity", null)
                              # Type: string   Optional  

                              resource = lookup(resource_field_ref.value, "resource", null)
                              # Type: string Required    
                              # Resource to select

                            }
                          }

                        }
                      }

                    }
                  }

                  dynamic "empty_dir" { # Nesting Mode: list  Max Items : 1  
                    for_each = contains(keys(volume.value), "emptyDir") ? {item = volume.value["emptyDir"]} : {}

                    content {
                      medium = lookup(empty_dir.value, "medium", null)
                      # Type: string   Optional  
                      # What type of storage medium should back this directory. The default is "" which means to use the node's default medium. Must be an empty string (default) or Memory. More info: http://kubernetes.io/docs/user-guide/volumes#emptydir

                      size_limit = lookup(empty_dir.value, "sizeLimit", null)
                      # Type: string   Optional  
                      # Total amount of local storage required for this EmptyDir volume.

                    }
                  }

                  dynamic "fc" { # Nesting Mode: list  Max Items : 1  
                    for_each = contains(keys(volume.value), "fc") ? {item = volume.value["fc"]} : {}

                    content {
                      fs_type = lookup(fc.value, "fsType", null)
                      # Type: string   Optional  
                      # Filesystem type to mount. Must be a filesystem type supported by the host operating system. Ex. "ext4", "xfs", "ntfs". Implicitly inferred to be "ext4" if unspecified.

                      lun = lookup(fc.value, "lun", null)
                      # Type: number Required    
                      # FC target lun number

                      read_only = lookup(fc.value, "readOnly", null)
                      # Type: bool   Optional  
                      # Whether to force the read-only setting in VolumeMounts. Defaults to false (read/write).

                      target_ww_ns = lookup(fc.value, "targetWwNs", null)
                      # Type: ['set', 'string'] Required    
                      # FC target worldwide names (WWNs)

                    }
                  }

                  dynamic "flex_volume" { # Nesting Mode: list  Max Items : 1  
                    for_each = contains(keys(volume.value), "flexVolume") ? {item = volume.value["flexVolume"]} : {}

                    content {
                      driver = lookup(flex_volume.value, "driver", null)
                      # Type: string Required    
                      # Driver is the name of the driver to use for this volume.

                      fs_type = lookup(flex_volume.value, "fsType", null)
                      # Type: string   Optional  
                      # Filesystem type to mount. Must be a filesystem type supported by the host operating system. Ex. "ext4", "xfs", "ntfs". The default filesystem depends on FlexVolume script.

                      options = lookup(flex_volume.value, "options", null)
                      # Type: ['map', 'string']   Optional  
                      # Extra command options if any.

                      read_only = lookup(flex_volume.value, "readOnly", null)
                      # Type: bool   Optional  
                      # Whether to force the ReadOnly setting in VolumeMounts. Defaults to false (read/write).

                      dynamic "secret_ref" { # Nesting Mode: list  Max Items : 1  
                        for_each = contains(keys(flex_volume.value), "secretRef") ? {item = flex_volume.value["secretRef"]} : {}

                        content {
                          name = lookup(secret_ref.value, "name", null)
                          # Type: string   Optional  
                          # Name of the referent. More info: http://kubernetes.io/docs/user-guide/identifiers#names

                          namespace = var.namespace != "" ? var.namespace : lookup(secret_ref.value, "namespace", null)
                          # Type: string   Optional Computed 
                          # Name of the referent. More info: http://kubernetes.io/docs/user-guide/identifiers#names

                        }
                      }

                    }
                  }

                  dynamic "flocker" { # Nesting Mode: list  Max Items : 1  
                    for_each = contains(keys(volume.value), "flocker") ? {item = volume.value["flocker"]} : {}

                    content {
                      dataset_name = lookup(flocker.value, "datasetName", null)
                      # Type: string   Optional  
                      # Name of the dataset stored as metadata -> name on the dataset for Flocker should be considered as deprecated

                      dataset_uuid = lookup(flocker.value, "datasetUuid", null)
                      # Type: string   Optional  
                      # UUID of the dataset. This is unique identifier of a Flocker dataset

                    }
                  }

                  dynamic "gce_persistent_disk" { # Nesting Mode: list  Max Items : 1  
                    for_each = contains(keys(volume.value), "gcePersistentDisk") ? {item = volume.value["gcePersistentDisk"]} : {}

                    content {
                      fs_type = lookup(gce_persistent_disk.value, "fsType", null)
                      # Type: string   Optional  
                      # Filesystem type of the volume that you want to mount. Tip: Ensure that the filesystem type is supported by the host operating system. Examples: "ext4", "xfs", "ntfs". Implicitly inferred to be "ext4" if unspecified. More info: http://kubernetes.io/docs/user-guide/volumes#gcepersistentdisk

                      partition = lookup(gce_persistent_disk.value, "partition", null)
                      # Type: number   Optional  
                      # The partition in the volume that you want to mount. If omitted, the default is to mount by volume name. Examples: For volume /dev/sda1, you specify the partition as "1". Similarly, the volume partition for /dev/sda is "0" (or you can leave the property empty). More info: http://kubernetes.io/docs/user-guide/volumes#gcepersistentdisk

                      pd_name = lookup(gce_persistent_disk.value, "pdName", null)
                      # Type: string Required    
                      # Unique name of the PD resource in GCE. Used to identify the disk in GCE. More info: http://kubernetes.io/docs/user-guide/volumes#gcepersistentdisk

                      read_only = lookup(gce_persistent_disk.value, "readOnly", null)
                      # Type: bool   Optional  
                      # Whether to force the ReadOnly setting in VolumeMounts. Defaults to false. More info: http://kubernetes.io/docs/user-guide/volumes#gcepersistentdisk

                    }
                  }

                  dynamic "git_repo" { # Nesting Mode: list  Max Items : 1  
                    for_each = contains(keys(volume.value), "gitRepo") ? {item = volume.value["gitRepo"]} : {}

                    content {
                      directory = lookup(git_repo.value, "directory", null)
                      # Type: string   Optional  
                      # Target directory name. Must not contain or start with '..'. If '.' is supplied, the volume directory will be the git repository. Otherwise, if specified, the volume will contain the git repository in the subdirectory with the given name.

                      repository = lookup(git_repo.value, "repository", null)
                      # Type: string   Optional  
                      # Repository URL

                      revision = lookup(git_repo.value, "revision", null)
                      # Type: string   Optional  
                      # Commit hash for the specified revision.

                    }
                  }

                  dynamic "glusterfs" { # Nesting Mode: list  Max Items : 1  
                    for_each = contains(keys(volume.value), "glusterfs") ? {item = volume.value["glusterfs"]} : {}

                    content {
                      endpoints_name = lookup(glusterfs.value, "endpointsName", null)
                      # Type: string Required    
                      # The endpoint name that details Glusterfs topology. More info: http://releases.k8s.io/HEAD/examples/volumes/glusterfs/README.md#create-a-pod

                      path = lookup(glusterfs.value, "path", null)
                      # Type: string Required    
                      # The Glusterfs volume path. More info: http://releases.k8s.io/HEAD/examples/volumes/glusterfs/README.md#create-a-pod

                      read_only = lookup(glusterfs.value, "readOnly", null)
                      # Type: bool   Optional  
                      # Whether to force the Glusterfs volume to be mounted with read-only permissions. Defaults to false. More info: http://releases.k8s.io/HEAD/examples/volumes/glusterfs/README.md#create-a-pod

                    }
                  }

                  dynamic "host_path" { # Nesting Mode: list  Max Items : 1  
                    for_each = contains(keys(volume.value), "hostPath") ? {item = volume.value["hostPath"]} : {}

                    content {
                      path = lookup(host_path.value, "path", null)
                      # Type: string   Optional  
                      # Path of the directory on the host. More info: http://kubernetes.io/docs/user-guide/volumes#hostpath

                      type = lookup(host_path.value, "type", null)
                      # Type: string   Optional  
                      # Type for HostPath volume. Allowed values are "" (default), DirectoryOrCreate, Directory, FileOrCreate, File, Socket, CharDevice and BlockDevice

                    }
                  }

                  dynamic "iscsi" { # Nesting Mode: list  Max Items : 1  
                    for_each = contains(keys(volume.value), "iscsi") ? {item = volume.value["iscsi"]} : {}

                    content {
                      fs_type = lookup(iscsi.value, "fsType", null)
                      # Type: string   Optional  
                      # Filesystem type of the volume that you want to mount. Tip: Ensure that the filesystem type is supported by the host operating system. Examples: "ext4", "xfs", "ntfs". Implicitly inferred to be "ext4" if unspecified. More info: http://kubernetes.io/docs/user-guide/volumes#iscsi

                      iqn = lookup(iscsi.value, "iqn", null)
                      # Type: string Required    
                      # Target iSCSI Qualified Name.

                      iscsi_interface = lookup(iscsi.value, "iscsiInterface", null)
                      # Type: string   Optional  
                      # iSCSI interface name that uses an iSCSI transport. Defaults to 'default' (tcp).

                      lun = lookup(iscsi.value, "lun", null)
                      # Type: number   Optional  
                      # iSCSI target lun number.

                      read_only = lookup(iscsi.value, "readOnly", null)
                      # Type: bool   Optional  
                      # Whether to force the read-only setting in VolumeMounts. Defaults to false.

                      target_portal = lookup(iscsi.value, "targetPortal", null)
                      # Type: string Required    
                      # iSCSI target portal. The portal is either an IP or ip_addr:port if the port is other than default (typically TCP ports 860 and 3260).

                    }
                  }

                  dynamic "local" { # Nesting Mode: list  Max Items : 1  
                    for_each = contains(keys(volume.value), "local") ? {item = volume.value["local"]} : {}

                    content {
                      path = lookup(local.value, "path", null)
                      # Type: string   Optional  
                      # Path of the directory on the host. More info: http://kubernetes.io/docs/user-guide/volumes#local

                    }
                  }

                  dynamic "nfs" { # Nesting Mode: list  Max Items : 1  
                    for_each = contains(keys(volume.value), "nfs") ? {item = volume.value["nfs"]} : {}

                    content {
                      path = lookup(nfs.value, "path", null)
                      # Type: string Required    
                      # Path that is exported by the NFS server. More info: http://kubernetes.io/docs/user-guide/volumes#nfs

                      read_only = lookup(nfs.value, "readOnly", null)
                      # Type: bool   Optional  
                      # Whether to force the NFS export to be mounted with read-only permissions. Defaults to false. More info: http://kubernetes.io/docs/user-guide/volumes#nfs

                      server = lookup(nfs.value, "server", null)
                      # Type: string Required    
                      # Server is the hostname or IP address of the NFS server. More info: http://kubernetes.io/docs/user-guide/volumes#nfs

                    }
                  }

                  dynamic "persistent_volume_claim" { # Nesting Mode: list  Max Items : 1  
                    for_each = contains(keys(volume.value), "persistentVolumeClaim") ? {item = volume.value["persistentVolumeClaim"]} : {}

                    content {
                      claim_name = lookup(persistent_volume_claim.value, "claimName", null)
                      # Type: string   Optional  
                      # ClaimName is the name of a PersistentVolumeClaim in the same 

                      read_only = lookup(persistent_volume_claim.value, "readOnly", null)
                      # Type: bool   Optional  
                      # Will force the ReadOnly setting in VolumeMounts.

                    }
                  }

                  dynamic "photon_persistent_disk" { # Nesting Mode: list  Max Items : 1  
                    for_each = contains(keys(volume.value), "photonPersistentDisk") ? {item = volume.value["photonPersistentDisk"]} : {}

                    content {
                      fs_type = lookup(photon_persistent_disk.value, "fsType", null)
                      # Type: string   Optional  
                      # Filesystem type to mount. Must be a filesystem type supported by the host operating system. Ex. "ext4", "xfs", "ntfs". Implicitly inferred to be "ext4" if unspecified.

                      pd_id = lookup(photon_persistent_disk.value, "pdId", null)
                      # Type: string Required    
                      # ID that identifies Photon Controller persistent disk

                    }
                  }

                  dynamic "projected" { # Nesting Mode: list  
                    for_each = lookup(volume.value, "projected", {})

                    content {
                      default_mode = lookup(projected.value, "defaultMode", null)
                      # Type: string   Optional  
                      # Optional: mode bits to use on created files by default. Must be a value between 0 and 0777. Defaults to 0644. Directories within the path are not affected by this setting. This might be in conflict with other options that affect the file mode, like fsGroup, and the result can be other mode bits set.

                      dynamic "sources" { # Nesting Mode: list  Min Items : 1  
                        for_each = lookup(projected.value, "sources", {})

                        content {
                          dynamic "config_map" { # Nesting Mode: list  
                            for_each = lookup(sources.value, "configMap", {})

                            content {
                              name = lookup(config_map.value, "name", null)
                              # Type: string   Optional  
                              # Name of the referent. More info: http://kubernetes.io/docs/user-guide/identifiers#names

                              optional = lookup(config_map.value, "optional", null)
                              # Type: bool   Optional  
                              # Optional: Specify whether the ConfigMap or it's keys must be defined.

                              dynamic "items" { # Nesting Mode: list  
                                for_each = lookup(config_map.value, "items", {})

                                content {
                                  key = lookup(items.value, "key", null)
                                  # Type: string   Optional  
                                  # The key to project.

                                  mode = lookup(items.value, "mode", null)
                                  # Type: string   Optional  
                                  # Optional: mode bits to use on this file, must be a value between 0 and 0777. If not specified, the volume defaultMode will be used. This might be in conflict with other options that affect the file mode, like fsGroup, and the result can be other mode bits set.

                                  path = lookup(items.value, "path", null)
                                  # Type: string   Optional  
                                  # The relative path of the file to map the key to. May not be an absolute path. May not contain the path element '..'. May not start with the string '..'.

                                }
                              }

                            }
                          }

                          dynamic "downward_api" { # Nesting Mode: list  Max Items : 1  
                            for_each = contains(keys(sources.value), "downwardApi") ? {item = sources.value["downwardApi"]} : {}

                            content {
                              dynamic "items" { # Nesting Mode: list  
                                for_each = lookup(downward_api.value, "items", {})

                                content {
                                  mode = lookup(items.value, "mode", null)
                                  # Type: string   Optional  
                                  # Mode bits to use on this file, must be a value between 0 and 0777. If not specified, the volume defaultMode will be used. This might be in conflict with other options that affect the file mode, like fsGroup, and the result can be other mode bits set.

                                  path = lookup(items.value, "path", null)
                                  # Type: string Required    
                                  # Path is the relative path name of the file to be created. Must not be absolute or contain the '..' path. Must be utf-8 encoded. The first item of the relative path must not start with '..'

                                  dynamic "field_ref" { # Nesting Mode: list  Max Items : 1  
                                    for_each = contains(keys(items.value), "fieldRef") ? {item = items.value["fieldRef"]} : {}

                                    content {
                                      api_version = lookup(field_ref.value, "apiVersion", null)
                                      # Type: string   Optional  
                                      # Version of the schema the FieldPath is written in terms of, defaults to 'v1'.

                                      field_path = lookup(field_ref.value, "fieldPath", null)
                                      # Type: string   Optional  
                                      # Path of the field to select in the specified API version

                                    }
                                  }

                                  dynamic "resource_field_ref" { # Nesting Mode: list  Max Items : 1  
                                    for_each = contains(keys(items.value), "resourceFieldRef") ? {item = items.value["resourceFieldRef"]} : {}

                                    content {
                                      container_name = lookup(resource_field_ref.value, "containerName", null)
                                      # Type: string Required    

                                      quantity = lookup(resource_field_ref.value, "quantity", null)
                                      # Type: string   Optional  

                                      resource = lookup(resource_field_ref.value, "resource", null)
                                      # Type: string Required    
                                      # Resource to select

                                    }
                                  }

                                }
                              }

                            }
                          }

                          dynamic "secret" { # Nesting Mode: list  
                            for_each = lookup(sources.value, "secret", {})

                            content {
                              name = lookup(secret.value, "name", null)
                              # Type: string   Optional  
                              # Name of the secret in the pod's namespace to use. More info: http://kubernetes.io/docs/user-guide/volumes#secrets

                              optional = lookup(secret.value, "optional", null)
                              # Type: bool   Optional  
                              # Optional: Specify whether the Secret or it's keys must be defined.

                              dynamic "items" { # Nesting Mode: list  
                                for_each = lookup(secret.value, "items", {})

                                content {
                                  key = lookup(items.value, "key", null)
                                  # Type: string   Optional  
                                  # The key to project.

                                  mode = lookup(items.value, "mode", null)
                                  # Type: string   Optional  
                                  # Optional: mode bits to use on this file, must be a value between 0 and 0777. If not specified, the volume defaultMode will be used. This might be in conflict with other options that affect the file mode, like fsGroup, and the result can be other mode bits set.

                                  path = lookup(items.value, "path", null)
                                  # Type: string   Optional  
                                  # The relative path of the file to map the key to. May not be an absolute path. May not contain the path element '..'. May not start with the string '..'.

                                }
                              }

                            }
                          }

                          dynamic "service_account_token" { # Nesting Mode: list  Max Items : 1  
                            for_each = contains(keys(sources.value), "serviceAccountToken") ? {item = sources.value["serviceAccountToken"]} : {}

                            content {
                              audience = lookup(service_account_token.value, "audience", null)
                              # Type: string   Optional  
                              # Audience is the intended audience of the token

                              expiration_seconds = lookup(service_account_token.value, "expirationSeconds", null)
                              # Type: number   Optional  
                              # ExpirationSeconds is the expected duration of validity of the service account token. It defaults to 1 hour and must be at least 10 minutes (600 seconds).

                              path = lookup(service_account_token.value, "path", null)
                              # Type: string Required    
                              # Path specifies a relative path to the mount point of the projected volume.

                            }
                          }

                        }
                      }

                    }
                  }

                  dynamic "quobyte" { # Nesting Mode: list  Max Items : 1  
                    for_each = contains(keys(volume.value), "quobyte") ? {item = volume.value["quobyte"]} : {}

                    content {
                      group = lookup(quobyte.value, "group", null)
                      # Type: string   Optional  
                      # Group to map volume access to Default is no group

                      read_only = lookup(quobyte.value, "readOnly", null)
                      # Type: bool   Optional  
                      # Whether to force the Quobyte volume to be mounted with read-only permissions. Defaults to false.

                      registry = lookup(quobyte.value, "registry", null)
                      # Type: string Required    
                      # Registry represents a single or multiple Quobyte Registry services specified as a string as host:port pair (multiple entries are separated with commas) which acts as the central registry for volumes

                      user = lookup(quobyte.value, "user", null)
                      # Type: string   Optional  
                      # User to map volume access to Defaults to serivceaccount user

                      volume = lookup(quobyte.value, "volume", null)
                      # Type: string Required    
                      # Volume is a string that references an already created Quobyte volume by name.

                    }
                  }

                  dynamic "rbd" { # Nesting Mode: list  Max Items : 1  
                    for_each = contains(keys(volume.value), "rbd") ? {item = volume.value["rbd"]} : {}

                    content {
                      ceph_monitors = lookup(rbd.value, "cephMonitors", null)
                      # Type: ['set', 'string'] Required    
                      # A collection of Ceph monitors. More info: http://releases.k8s.io/HEAD/examples/volumes/rbd/README.md#how-to-use-it

                      fs_type = lookup(rbd.value, "fsType", null)
                      # Type: string   Optional  
                      # Filesystem type of the volume that you want to mount. Tip: Ensure that the filesystem type is supported by the host operating system. Examples: "ext4", "xfs", "ntfs". Implicitly inferred to be "ext4" if unspecified. More info: http://kubernetes.io/docs/user-guide/volumes#rbd

                      keyring = lookup(rbd.value, "keyring", null)
                      # Type: string   Optional Computed 
                      # Keyring is the path to key ring for RBDUser. Default is /etc/ceph/keyring. More info: http://releases.k8s.io/HEAD/examples/volumes/rbd/README.md#how-to-use-it

                      rados_user = lookup(rbd.value, "radosUser", null)
                      # Type: string   Optional  
                      # The rados user name. Default is admin. More info: http://releases.k8s.io/HEAD/examples/volumes/rbd/README.md#how-to-use-it

                      rbd_image = lookup(rbd.value, "rbdImage", null)
                      # Type: string Required    
                      # The rados image name. More info: http://releases.k8s.io/HEAD/examples/volumes/rbd/README.md#how-to-use-it

                      rbd_pool = lookup(rbd.value, "rbdPool", null)
                      # Type: string   Optional  
                      # The rados pool name. Default is rbd. More info: http://releases.k8s.io/HEAD/examples/volumes/rbd/README.md#how-to-use-it.

                      read_only = lookup(rbd.value, "readOnly", null)
                      # Type: bool   Optional  
                      # Whether to force the read-only setting in VolumeMounts. Defaults to false. More info: http://releases.k8s.io/HEAD/examples/volumes/rbd/README.md#how-to-use-it

                      dynamic "secret_ref" { # Nesting Mode: list  Max Items : 1  
                        for_each = contains(keys(rbd.value), "secretRef") ? {item = rbd.value["secretRef"]} : {}

                        content {
                          name = lookup(secret_ref.value, "name", null)
                          # Type: string   Optional  
                          # Name of the referent. More info: http://kubernetes.io/docs/user-guide/identifiers#names

                          namespace = var.namespace != "" ? var.namespace : lookup(secret_ref.value, "namespace", null)
                          # Type: string   Optional Computed 
                          # Name of the referent. More info: http://kubernetes.io/docs/user-guide/identifiers#names

                        }
                      }

                    }
                  }

                  dynamic "secret" { # Nesting Mode: list  Max Items : 1  
                    for_each = contains(keys(volume.value), "secret") ? {item = volume.value["secret"]} : {}

                    content {
                      default_mode = lookup(secret.value, "defaultMode", null)
                      # Type: string   Optional  
                      # Optional: mode bits to use on created files by default. Must be a value between 0 and 0777. Defaults to 0644. Directories within the path are not affected by this setting. This might be in conflict with other options that affect the file mode, like fsGroup, and the result can be other mode bits set.

                      optional = lookup(secret.value, "optional", null)
                      # Type: bool   Optional  
                      # Optional: Specify whether the Secret or its keys must be defined.

                      secret_name = lookup(secret.value, "secretName", null)
                      # Type: string   Optional  
                      # Name of the secret in the pod's namespace to use. More info: http://kubernetes.io/docs/user-guide/volumes#secrets

                      dynamic "items" { # Nesting Mode: list  
                        for_each = lookup(secret.value, "items", {})

                        content {
                          key = lookup(items.value, "key", null)
                          # Type: string   Optional  
                          # The key to project.

                          mode = lookup(items.value, "mode", null)
                          # Type: string   Optional  
                          # Optional: mode bits to use on this file, must be a value between 0 and 0777. If not specified, the volume defaultMode will be used. This might be in conflict with other options that affect the file mode, like fsGroup, and the result can be other mode bits set.

                          path = lookup(items.value, "path", null)
                          # Type: string   Optional  
                          # The relative path of the file to map the key to. May not be an absolute path. May not contain the path element '..'. May not start with the string '..'.

                        }
                      }

                    }
                  }

                  dynamic "vsphere_volume" { # Nesting Mode: list  Max Items : 1  
                    for_each = contains(keys(volume.value), "vsphereVolume") ? {item = volume.value["vsphereVolume"]} : {}

                    content {
                      fs_type = lookup(vsphere_volume.value, "fsType", null)
                      # Type: string   Optional  
                      # Filesystem type to mount. Must be a filesystem type supported by the host operating system. Ex. "ext4", "xfs", "ntfs". Implicitly inferred to be "ext4" if unspecified.

                      volume_path = lookup(vsphere_volume.value, "volumePath", null)
                      # Type: string Required    
                      # Path that identifies vSphere volume vmdk

                    }
                  }

                }
              }

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

      delete = lookup(timeouts.value, "delete", null)
      # Type: string   Optional  

      update = lookup(timeouts.value, "update", null)
      # Type: string   Optional  

    }
  }


}