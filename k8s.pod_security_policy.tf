resource "kubernetes_pod_security_policy" "instance" { 
  depends_on = [null_resource.module_depends_on]
  for_each = local.pod_security_policy.applications

  dynamic "metadata" { # Nesting Mode: list  Min Items : 1  Max Items : 1  
    for_each = contains(keys(each.value), "metadata") ? {item = each.value["metadata"]} : {}

    content {
      annotations = lookup(metadata.value, "annotations", null)
      # Type: ['map', 'string']   Optional  
      # An unstructured key value map stored with the podsecuritypolicy that may be used to store arbitrary metadata. More info: http://kubernetes.io/docs/user-guide/annotations

      labels = lookup(metadata.value, "labels", null)
      # Type: ['map', 'string']   Optional  
      # Map of string keys and values that can be used to organize and categorize (scope and select) the podsecuritypolicy. May match selectors of replication controllers and services. More info: http://kubernetes.io/docs/user-guide/labels

      name = lookup(metadata.value, "name", null)
      # Type: string   Optional Computed 
      # Name of the podsecuritypolicy, must be unique. Cannot be updated. More info: http://kubernetes.io/docs/user-guide/identifiers#names

    }
  }

  dynamic "spec" { # Nesting Mode: list  Min Items : 1  Max Items : 1  
    for_each = contains(keys(each.value), "spec") ? {item = each.value["spec"]} : {}

    content {
      allow_privilege_escalation = lookup(spec.value, "allowPrivilegeEscalation", null)
      # Type: bool   Optional Computed 
      # allowPrivilegeEscalation determines if a pod can request to allow privilege escalation. If unspecified, defaults to true.

      allowed_capabilities = lookup(spec.value, "allowedCapabilities", null)
      # Type: ['list', 'string']   Optional Computed 
      # allowedCapabilities is a list of capabilities that can be requested to add to the container. Capabilities in this field may be added at the pod author's discretion. You must not list a capability in both allowedCapabilities and requiredDropCapabilities.

      allowed_proc_mount_types = lookup(spec.value, "allowedProcMountTypes", null)
      # Type: ['list', 'string']   Optional  
      # AllowedProcMountTypes is an allowlist of allowed ProcMountTypes. Empty or nil indicates that only the DefaultProcMountType may be used. This requires the ProcMountType feature flag to be enabled.

      allowed_unsafe_sysctls = lookup(spec.value, "allowedUnsafeSysctls", null)
      # Type: ['list', 'string']   Optional  
      # allowedUnsafeSysctls is a list of explicitly allowed unsafe sysctls, defaults to none. Each entry is either a plain sysctl name or ends in "*" in which case it is considered as a prefix of allowed sysctls. Single * means all unsafe sysctls are allowed. Kubelet has to allowlist all allowed unsafe sysctls explicitly to avoid rejection.
      # Examples: e.g. "foo/*" allows "foo/bar", "foo/baz", etc. e.g. "foo.*" allows "foo.bar", "foo.baz", etc.

      default_add_capabilities = lookup(spec.value, "defaultAddCapabilities", null)
      # Type: ['list', 'string']   Optional  
      # defaultAddCapabilities is the default set of capabilities that will be added to the container unless the pod spec specifically drops the capability.  You may not list a capability in both defaultAddCapabilities and requiredDropCapabilities. Capabilities added here are implicitly allowed, and need not be included in the allowedCapabilities list.

      default_allow_privilege_escalation = lookup(spec.value, "defaultAllowPrivilegeEscalation", null)
      # Type: bool   Optional Computed 
      # defaultAllowPrivilegeEscalation controls the default setting for whether a process can gain more privileges than its parent process.

      forbidden_sysctls = lookup(spec.value, "forbiddenSysctls", null)
      # Type: ['list', 'string']   Optional  
      # forbiddenSysctls is a list of explicitly forbidden sysctls, defaults to none. Each entry is either a plain sysctl name or ends in "*" in which case it is considered as a prefix of forbidden sysctls. Single * means all sysctls are forbidden.
      # Examples: e.g. "foo/*" forbids "foo/bar", "foo/baz", etc. e.g. "foo.*" forbids "foo.bar", "foo.baz", etc.

      host_ipc = lookup(spec.value, "hostIPC", null)
      # Type: bool   Optional Computed 
      # hostIPC determines if the policy allows the use of HostIPC in the pod spec.

      host_network = lookup(spec.value, "hostNetwork", null)
      # Type: bool   Optional Computed 
      # hostNetwork determines if the policy allows the use of HostNetwork in the pod spec.

      host_pid = lookup(spec.value, "hostPid", null)
      # Type: bool   Optional Computed 
      # hostPID determines if the policy allows the use of HostPID in the pod spec.

      privileged = lookup(spec.value, "privileged", null)
      # Type: bool   Optional Computed 
      # privileged determines if a pod can request to be run as privileged.

      read_only_root_filesystem = lookup(spec.value, "readOnlyRootFilesystem", null)
      # Type: bool   Optional Computed 
      # readOnlyRootFilesystem when set to true will force containers to run with a read only root file system.  If the container specifically requests to run with a non-read only root file system the PSP should deny the pod. If set to false the container may run with a read only root file system if it wishes but it will not be forced to.

      required_drop_capabilities = lookup(spec.value, "requiredDropCapabilities", null)
      # Type: ['list', 'string']   Optional Computed 
      # requiredDropCapabilities are the capabilities that will be dropped from the container.  These are required to be dropped and cannot be added.

      volumes = lookup(spec.value, "volumes", null)
      # Type: ['list', 'string']   Optional Computed 
      # volumes is an allowlist of volume plugins. Empty indicates that no volumes may be used. To allow all volumes you may use '*'.

      dynamic "allowed_flex_volumes" { # Nesting Mode: list  
        for_each = lookup(spec.value, "allowedFlexVolumes", {})

        content {
          driver = lookup(allowed_flex_volumes.value, "driver", null)
          # Type: string Required    
          # driver is the name of the Flexvolume driver.

        }
      }

      dynamic "allowed_host_paths" { # Nesting Mode: list  
        for_each = lookup(spec.value, "allowedHostPaths", {})

        content {
          path_prefix = lookup(allowed_host_paths.value, "pathPrefix", null)
          # Type: string Required    
          # pathPrefix is the path prefix that the host volume must match. It does not support `*`. Trailing slashes are trimmed when validating the path prefix with a host path.
          # Examples: `/foo` would allow `/foo`, `/foo/` and `/foo/bar` `/foo` would not allow `/food` or `/etc/foo`

          read_only = lookup(allowed_host_paths.value, "readOnly", null)
          # Type: bool   Optional  
          # when set to true, will allow host volumes matching the pathPrefix only if all volume mounts are readOnly.

        }
      }

      dynamic "fs_group" { # Nesting Mode: list  Min Items : 1  Max Items : 1  
        for_each = contains(keys(spec.value), "fsGroup") ? {item = spec.value["fsGroup"]} : {}

        content {
          rule = lookup(fs_group.value, "rule", null)
          # Type: string Required    
          # rule is the strategy that will dictate what FSGroup is used in the SecurityContext.

          dynamic "range" { # Nesting Mode: list  
            for_each = lookup(fs_group.value, "range", {})

            content {
              max = lookup(range.value, "max", null)
              # Type: number Required    
              # max is the end of the range, inclusive.

              min = lookup(range.value, "min", null)
              # Type: number Required    
              # min is the start of the range, inclusive.

            }
          }

        }
      }

      dynamic "host_ports" { # Nesting Mode: list  
        for_each = lookup(spec.value, "hostPorts", {})

        content {
          max = lookup(host_ports.value, "max", null)
          # Type: number Required    
          # max is the end of the range, inclusive.

          min = lookup(host_ports.value, "min", null)
          # Type: number Required    
          # min is the start of the range, inclusive.

        }
      }

      dynamic "run_as_group" { # Nesting Mode: list  Max Items : 1  
        for_each = contains(keys(spec.value), "runAsGroup") ? {item = spec.value["runAsGroup"]} : {}

        content {
          rule = lookup(run_as_group.value, "rule", null)
          # Type: string Required    
          # rule is the strategy that will dictate the allowable RunAsGroup values that may be set.

          dynamic "range" { # Nesting Mode: list  
            for_each = lookup(run_as_group.value, "range", {})

            content {
              max = lookup(range.value, "max", null)
              # Type: number Required    
              # max is the end of the range, inclusive.

              min = lookup(range.value, "min", null)
              # Type: number Required    
              # min is the start of the range, inclusive.

            }
          }

        }
      }

      dynamic "run_as_user" { # Nesting Mode: list  Min Items : 1  Max Items : 1  
        for_each = contains(keys(spec.value), "runAsUser") ? {item = spec.value["runAsUser"]} : {}

        content {
          rule = lookup(run_as_user.value, "rule", null)
          # Type: string Required    
          # rule is the strategy that will dictate the allowable RunAsUser values that may be set.

          dynamic "range" { # Nesting Mode: list  
            for_each = lookup(run_as_user.value, "range", {})

            content {
              max = lookup(range.value, "max", null)
              # Type: number Required    
              # max is the end of the range, inclusive.

              min = lookup(range.value, "min", null)
              # Type: number Required    
              # min is the start of the range, inclusive.

            }
          }

        }
      }

      dynamic "se_linux" { # Nesting Mode: list  Max Items : 1  
        for_each = contains(keys(spec.value), "seLinux") ? {item = spec.value["seLinux"]} : {}

        content {
          rule = lookup(se_linux.value, "rule", null)
          # Type: string Required    
          # rule is the strategy that will dictate the allowable labels that may be set.

          dynamic "se_linux_options" { # Nesting Mode: list  
            for_each = lookup(se_linux.value, "seLinuxOptions", {})

            content {
              level = lookup(se_linux_options.value, "level", null)
              # Type: string Required    

              role = lookup(se_linux_options.value, "role", null)
              # Type: string Required    

              type = lookup(se_linux_options.value, "type", null)
              # Type: string Required    

              user = lookup(se_linux_options.value, "user", null)
              # Type: string Required    

            }
          }

        }
      }

      dynamic "supplemental_groups" { # Nesting Mode: list  Min Items : 1  Max Items : 1  
        for_each = contains(keys(spec.value), "supplementalGroups") ? {item = spec.value["supplementalGroups"]} : {}

        content {
          rule = lookup(supplemental_groups.value, "rule", null)
          # Type: string Required    
          # rule is the strategy that will dictate what supplemental groups is used in the SecurityContext.

          dynamic "range" { # Nesting Mode: list  
            for_each = lookup(supplemental_groups.value, "range", {})

            content {
              max = lookup(range.value, "max", null)
              # Type: number Required    
              # max is the end of the range, inclusive.

              min = lookup(range.value, "min", null)
              # Type: number Required    
              # min is the start of the range, inclusive.

            }
          }

        }
      }

    }
  }


}