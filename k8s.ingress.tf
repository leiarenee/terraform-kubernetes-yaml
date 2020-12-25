resource "kubernetes_ingress" "instance" { 
  depends_on = [null_resource.module_depends_on]
  for_each = local.ingress.applications

  wait_for_load_balancer = lookup(each.value, "waitForLoadBalancer", null)
  # Type: bool   Optional  
  # Terraform will wait for the load balancer to have at least 1 endpoint before considering the resource created.

  dynamic "metadata" { # Nesting Mode: list  Min Items : 1  Max Items : 1  
    for_each = contains(keys(each.value), "metadata") ? {item = each.value["metadata"]} : {}

    content {
      annotations = lookup(metadata.value, "annotations", null)
      # Type: ['map', 'string']   Optional  
      # An unstructured key value map stored with the ingress that may be used to store arbitrary metadata. More info: http://kubernetes.io/docs/user-guide/annotations

      generate_name = lookup(metadata.value, "generateName", null)
      # Type: string   Optional  
      # Prefix, used by the server, to generate a unique name ONLY IF the `name` field has not been provided. This value will also be combined with a unique suffix. Read more: https://github.com/kubernetes/community/blob/master/contributors/devel/sig-architecture/api-conventions.md#idempotency

      labels = lookup(metadata.value, "labels", null)
      # Type: ['map', 'string']   Optional  
      # Map of string keys and values that can be used to organize and categorize (scope and select) the ingress. May match selectors of replication controllers and services. More info: http://kubernetes.io/docs/user-guide/labels

      name = lookup(metadata.value, "name", null)
      # Type: string   Optional Computed 
      # Name of the ingress, must be unique. Cannot be updated. More info: http://kubernetes.io/docs/user-guide/identifiers#names

      namespace = var.namespace != "" ? var.namespace : lookup(metadata.value, "namespace", null)
      # Type: string   Optional  
      # Namespace defines the space within which name of the ingress must be unique.

    }
  }

  dynamic "spec" { # Nesting Mode: list  Min Items : 1  Max Items : 1  
    for_each = contains(keys(each.value), "spec") ? {item = each.value["spec"]} : {}

    content {
      dynamic "backend" { # Nesting Mode: list  Max Items : 1  
        for_each = contains(keys(spec.value), "backend") ? {item = spec.value["backend"]} : {}

        content {
          service_name = lookup(backend.value, "serviceName", null)
          # Type: string   Optional  
          # Specifies the name of the referenced service.

          service_port = lookup(backend.value, "servicePort", null)
          # Type: string   Optional Computed 
          # Specifies the port of the referenced service.

        }
      }

      dynamic "rule" { # Nesting Mode: list  
        for_each = lookup(spec.value, "rules", {})

        content {
          host = lookup(rule.value, "host", null)
          # Type: string   Optional  
          # Host is the fully qualified domain name of a network host, as defined by RFC 3986. Note the following deviations from the "host" part of the URI as defined in RFC 3986: 1. IPs are not allowed. Currently an IngressRuleValue can only apply to
          #    the IP in the Spec of the parent Ingress.
          # 2. The `:` delimiter is not respected because ports are not allowed.
          # 	  Currently the port of an Ingress is implicitly :80 for http and
          # 	  :443 for https.
          # Both these may change in the future. Incoming requests are matched against the host before the IngressRuleValue. If the host is unspecified, the Ingress routes all traffic based on the specified IngressRuleValue.
          # Host can be "precise" which is a domain name without the terminating dot of a network host (e.g. "foo.bar.com") or "wildcard", which is a domain name prefixed with a single wildcard label (e.g. "*.foo.com"). The wildcard character '*' must appear by itself as the first DNS label and matches only a single label. You cannot have a wildcard label by itself (e.g. Host == "*"). Requests will be matched against the Host field in the following way: 1. If Host is precise, the request matches this rule if the http host header is equal to Host. 2. If Host is a wildcard, then the request matches this rule if the http host header is to equal to the suffix (removing the first label) of the wildcard rule.

          dynamic "http" { # Nesting Mode: list  Min Items : 1  Max Items : 1  
            for_each = contains(keys(rule.value), "http") ? {item = rule.value["http"]} : {}

            content {
              dynamic "path" { # Nesting Mode: list  Min Items : 1  
                for_each = lookup(http.value, "paths", {})

                content {
                  path = lookup(path.value, "path", null)
                  # Type: string   Optional  
                  # Path is matched against the path of an incoming request. Currently it can contain characters disallowed from the conventional "path" part of a URL as defined by RFC 3986. Paths must begin with a '/'. When unspecified, all paths from incoming requests are matched.

                  dynamic "backend" { # Nesting Mode: list  Max Items : 1  
                    for_each = contains(keys(path.value), "backend") ? {item = path.value["backend"]} : {}

                    content {
                      service_name = lookup(backend.value, "serviceName", null)
                      # Type: string   Optional  
                      # Specifies the name of the referenced service.

                      service_port = lookup(backend.value, "servicePort", null)
                      # Type: string   Optional Computed 
                      # Specifies the port of the referenced service.

                    }
                  }

                }
              }

            }
          }

        }
      }

      dynamic "tls" { # Nesting Mode: list  
        for_each = lookup(spec.value, "tls", {})

        content {
          hosts = lookup(tls.value, "hosts", null)
          # Type: ['list', 'string']   Optional  
          # Hosts are a list of hosts included in the TLS certificate. The values in this list must match the name/s used in the tlsSecret. Defaults to the wildcard host setting for the loadbalancer controller fulfilling this Ingress, if left unspecified.

          secret_name = lookup(tls.value, "secretName", null)
          # Type: string   Optional  
          # SecretName is the name of the secret used to terminate TLS traffic on port 443. Field is left optional to allow TLS routing based on SNI hostname alone. If the SNI host in a listener conflicts with the "Host" header field used by an IngressRule, the SNI host is used for termination and value of the Host header is used for routing.

        }
      }

    }
  }


}