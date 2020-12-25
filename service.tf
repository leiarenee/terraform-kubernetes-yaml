resource "kubernetes_service" "instance" { 
  depends_on = [null_resource.module_depends_on]
  for_each = local.service.applications

  dynamic "metadata" { # Nesting Mode: list  Min Items : 1  Max Items : 1  
    for_each = contains(keys(each.value), "metadata") ? {item = each.value["metadata"]} : {}

    content {
      annotations = lookup(metadata.value, "annotations", null)
      # Type: ['map', 'string']   Optional  
      # An unstructured key value map stored with the service that may be used to store arbitrary metadata. More info: http://kubernetes.io/docs/user-guide/annotations

      generate_name = lookup(metadata.value, "generateName", null)
      # Type: string   Optional  
      # Prefix, used by the server, to generate a unique name ONLY IF the `name` field has not been provided. This value will also be combined with a unique suffix. Read more: https://github.com/kubernetes/community/blob/master/contributors/devel/sig-architecture/api-conventions.md#idempotency

      labels = lookup(metadata.value, "labels", null)
      # Type: ['map', 'string']   Optional  
      # Map of string keys and values that can be used to organize and categorize (scope and select) the service. May match selectors of replication controllers and services. More info: http://kubernetes.io/docs/user-guide/labels

      name = lookup(metadata.value, "name", null)
      # Type: string   Optional Computed 
      # Name of the service, must be unique. Cannot be updated. More info: http://kubernetes.io/docs/user-guide/identifiers#names

      namespace = var.namespace != "" ? var.namespace : lookup(metadata.value, "namespace", null)
      # Type: string   Optional  
      # Namespace defines the space within which name of the service must be unique.

    }
  }

  dynamic "spec" { # Nesting Mode: list  Min Items : 1  Max Items : 1  
    for_each = contains(keys(each.value), "spec") ? {item = each.value["spec"]} : {}

    content {
      cluster_ip = lookup(spec.value, "clusterIP", null)
      # Type: string   Optional Computed 
      # The IP address of the service. It is usually assigned randomly by the master. If an address is specified manually and is not in use by others, it will be allocated to the service; otherwise, creation of the service will fail. `None` can be specified for headless services when proxying is not required. Ignored if type is `ExternalName`. More info: http://kubernetes.io/docs/user-guide/services#virtual-ips-and-service-proxies

      external_ips = lookup(spec.value, "externalIPs", null)
      # Type: ['set', 'string']   Optional  
      # A list of IP addresses for which nodes in the cluster will also accept traffic for this service. These IPs are not managed by Kubernetes. The user is responsible for ensuring that traffic arrives at a node with this IP.  A common example is external load-balancers that are not part of the Kubernetes system.

      external_name = lookup(spec.value, "externalName", null)
      # Type: string   Optional  
      # The external reference that kubedns or equivalent will return as a CNAME record for this service. No proxying will be involved. Must be a valid DNS name and requires `type` to be `ExternalName`.

      external_traffic_policy = lookup(spec.value, "externalTrafficPolicy", null)
      # Type: string   Optional Computed 
      # Denotes if this Service desires to route external traffic to node-local or cluster-wide endpoints. `Local` preserves the client source IP and avoids a second hop for LoadBalancer and Nodeport type services, but risks potentially imbalanced traffic spreading. `Cluster` obscures the client source IP and may cause a second hop to another node, but should have good overall load-spreading. More info: https://kubernetes.io/docs/tutorials/services/source-ip/

      health_check_node_port = lookup(spec.value, "healthCheckNodePort", null)
      # Type: number   Optional Computed 
      # Specifies the Healthcheck NodePort for the service. Only effects when type is set to `LoadBalancer` and external_traffic_policy is set to `Local`.

      load_balancer_ip = lookup(spec.value, "loadBalancerIP", null)
      # Type: string   Optional  
      # Only applies to `type = LoadBalancer`. LoadBalancer will get created with the IP specified in this field. This feature depends on whether the underlying cloud-provider supports specifying this field when a load balancer is created. This field will be ignored if the cloud-provider does not support the feature.

      load_balancer_source_ranges = lookup(spec.value, "loadBalancerSourceRanges", null)
      # Type: ['set', 'string']   Optional  
      # If specified and supported by the platform, this will restrict traffic through the cloud-provider load-balancer will be restricted to the specified client IPs. This field will be ignored if the cloud-provider does not support the feature. More info: http://kubernetes.io/docs/user-guide/services-firewalls

      publish_not_ready_addresses = lookup(spec.value, "publishNotReadyAddresses", null)
      # Type: bool   Optional  
      # When set to true, indicates that DNS implementations must publish the `notReadyAddresses` of subsets for the Endpoints associated with the Service. The default value is `false`. The primary use case for setting this field is to use a StatefulSet's Headless Service to propagate `SRV` records for its Pods without respect to their readiness for purpose of peer discovery.

      selector = lookup(spec.value, "selector", null)
      # Type: ['map', 'string']   Optional  
      # Route service traffic to pods with label keys and values matching this selector. Only applies to types `ClusterIP`, `NodePort`, and `LoadBalancer`. More info: http://kubernetes.io/docs/user-guide/services#overview

      session_affinity = lookup(spec.value, "sessionAffinity", null)
      # Type: string   Optional  
      # Used to maintain session affinity. Supports `ClientIP` and `None`. Defaults to `None`. More info: http://kubernetes.io/docs/user-guide/services#virtual-ips-and-service-proxies

      type = lookup(spec.value, "type", null)
      # Type: string   Optional  
      # Determines how the service is exposed. Defaults to `ClusterIP`. Valid options are `ExternalName`, `ClusterIP`, `NodePort`, and `LoadBalancer`. `ExternalName` maps to the specified `external_name`. More info: http://kubernetes.io/docs/user-guide/services#overview

      dynamic "port" { # Nesting Mode: list  
        for_each = lookup(spec.value, "ports", {})

        content {
          name = lookup(port.value, "name", null)
          # Type: string   Optional  
          # The name of this port within the service. All ports within the service must have unique names. Optional if only one ServicePort is defined on this service.

          node_port = lookup(port.value, "nodePort", null)
          # Type: number   Optional Computed 
          # The port on each node on which this service is exposed when `type` is `NodePort` or `LoadBalancer`. Usually assigned by the system. If specified, it will be allocated to the service if unused or else creation of the service will fail. Default is to auto-allocate a port if the `type` of this service requires one. More info: http://kubernetes.io/docs/user-guide/services#type--nodeport

          port = lookup(port.value, "port", null)
          # Type: number Required    
          # The port that will be exposed by this service.

          protocol = lookup(port.value, "protocol", null)
          # Type: string   Optional  
          # The IP protocol for this port. Supports `TCP` and `UDP`. Default is `TCP`.

          target_port = lookup(port.value, "targetPort", null)
          # Type: string   Optional Computed 
          # Number or name of the port to access on the pods targeted by the service. Number must be in the range 1 to 65535. This field is ignored for services with `cluster_ip = "None"`. More info: http://kubernetes.io/docs/user-guide/services#defining-a-service

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