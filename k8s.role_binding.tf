resource "kubernetes_role_binding" "instance" { 
  depends_on = [null_resource.module_depends_on]
  for_each = local.role_binding.applications

  dynamic "metadata" { # Nesting Mode: list  Min Items : 1  Max Items : 1  
    for_each = contains(keys(each.value), "metadata") ? {item = each.value["metadata"]} : {}

    content {
      annotations = lookup(metadata.value, "annotations", null)
      # Type: ['map', 'string']   Optional  
      # An unstructured key value map stored with the roleBinding that may be used to store arbitrary metadata. More info: http://kubernetes.io/docs/user-guide/annotations

      labels = lookup(metadata.value, "labels", null)
      # Type: ['map', 'string']   Optional  
      # Map of string keys and values that can be used to organize and categorize (scope and select) the roleBinding. May match selectors of replication controllers and services. More info: http://kubernetes.io/docs/user-guide/labels

      name = lookup(metadata.value, "name", null)
      # Type: string   Optional Computed 
      # Name of the roleBinding, must be unique. Cannot be updated. More info: http://kubernetes.io/docs/user-guide/identifiers#names

      namespace = var.namespace != "" ? var.namespace : lookup(metadata.value, "namespace", null)
      # Type: string   Optional  
      # Namespace defines the space within which name of the roleBinding must be unique.

    }
  }

  dynamic "role_ref" { # Nesting Mode: list  Min Items : 1  Max Items : 1  
    for_each = contains(keys(each.value), "roleRef") ? {item = each.value["roleRef"]} : {}

    content {
      api_group = lookup(role_ref.value, "apiGroup", null)
      # Type: string Required    
      # The API group of the user. The only value possible at the moment is `rbac.authorization.k8s.io`.

      kind = lookup(role_ref.value, "kind", null)
      # Type: string Required    
      # The kind of resource.

      name = lookup(role_ref.value, "name", null)
      # Type: string Required    
      # The name of the User to bind to.

    }
  }

  dynamic "subject" { # Nesting Mode: list  Min Items : 1  
    for_each = lookup(each.value, "subjects", {})

    content {
      api_group = lookup(subject.value, "apiGroup", null)
      # Type: string   Optional Computed 
      # The API group of the subject resource.

      kind = lookup(subject.value, "kind", null)
      # Type: string Required    
      # The kind of resource.

      name = lookup(subject.value, "name", null)
      # Type: string Required    
      # The name of the resource to bind to.

      namespace = var.namespace != "" ? var.namespace : lookup(subject.value, "namespace", null)
      # Type: string   Optional  
      # The Namespace of the subject resource.

    }
  }


}