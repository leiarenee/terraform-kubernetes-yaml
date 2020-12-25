resource "kubernetes_endpoints" "instance" { 
  depends_on = [null_resource.module_depends_on]
  for_each = local.endpoints.applications

  dynamic "metadata" { # Nesting Mode: list  Min Items : 1  Max Items : 1  
    for_each = contains(keys(each.value), "metadata") ? {item = each.value["metadata"]} : {}

    content {
      annotations = lookup(metadata.value, "annotations", null)
      # Type: ['map', 'string']   Optional  
      # An unstructured key value map stored with the endpoints that may be used to store arbitrary metadata. More info: http://kubernetes.io/docs/user-guide/annotations

      generate_name = lookup(metadata.value, "generateName", null)
      # Type: string   Optional  
      # Prefix, used by the server, to generate a unique name ONLY IF the `name` field has not been provided. This value will also be combined with a unique suffix. Read more: https://github.com/kubernetes/community/blob/master/contributors/devel/sig-architecture/api-conventions.md#idempotency

      labels = lookup(metadata.value, "labels", null)
      # Type: ['map', 'string']   Optional  
      # Map of string keys and values that can be used to organize and categorize (scope and select) the endpoints. May match selectors of replication controllers and services. More info: http://kubernetes.io/docs/user-guide/labels

      name = lookup(metadata.value, "name", null)
      # Type: string   Optional Computed 
      # Name of the endpoints, must be unique. Cannot be updated. More info: http://kubernetes.io/docs/user-guide/identifiers#names

      namespace = var.namespace != "" ? var.namespace : lookup(metadata.value, "namespace", null)
      # Type: string   Optional  
      # Namespace defines the space within which name of the endpoints must be unique.

    }
  }

  dynamic "subset" { # Nesting Mode: set  
    for_each = contains(keys(each.value), "subset") ? {item = each.value["subset"]} : {}

    content {
      dynamic "address" { # Nesting Mode: set  
        for_each = contains(keys(subset.value), "address") ? {item = subset.value["address"]} : {}

        content {
          hostname = lookup(address.value, "hostname", null)
          # Type: string   Optional  
          # The Hostname of this endpoint.

          ip = lookup(address.value, "ip", null)
          # Type: string Required    
          # The IP of this endpoint. May not be loopback (127.0.0.0/8), link-local (169.254.0.0/16), or link-local multicast ((224.0.0.0/24).

          node_name = lookup(address.value, "nodeName", null)
          # Type: string   Optional  
          # Node hosting this endpoint. This can be used to determine endpoints local to a node.

        }
      }

      dynamic "not_ready_address" { # Nesting Mode: set  
        for_each = contains(keys(subset.value), "notReadyAddress") ? {item = subset.value["notReadyAddress"]} : {}

        content {
          hostname = lookup(not_ready_address.value, "hostname", null)
          # Type: string   Optional  
          # The Hostname of this endpoint.

          ip = lookup(not_ready_address.value, "ip", null)
          # Type: string Required    
          # The IP of this endpoint. May not be loopback (127.0.0.0/8), link-local (169.254.0.0/16), or link-local multicast ((224.0.0.0/24).

          node_name = lookup(not_ready_address.value, "nodeName", null)
          # Type: string   Optional  
          # Node hosting this endpoint. This can be used to determine endpoints local to a node.

        }
      }

      dynamic "port" { # Nesting Mode: set  
        for_each = contains(keys(subset.value), "port") ? {item = subset.value["port"]} : {}

        content {
          name = lookup(port.value, "name", null)
          # Type: string   Optional  
          # The name of this port within the endpoint. Must be a DNS_LABEL. Optional if only one Port is defined on this endpoint.

          port = lookup(port.value, "port", null)
          # Type: number Required    
          # The port that will be exposed by this endpoint.

          protocol = lookup(port.value, "protocol", null)
          # Type: string   Optional  
          # The IP protocol for this port. Supports `TCP` and `UDP`. Default is `TCP`.

        }
      }

    }
  }


}