resource "kubernetes_csi_driver" "instance" { 
  depends_on = [null_resource.module_depends_on]
  for_each = local.csi_driver.applications

  dynamic "metadata" { # Nesting Mode: list  Min Items : 1  Max Items : 1  
    for_each = contains(keys(each.value), "metadata") ? {item = each.value["metadata"]} : {}

    content {
      annotations = lookup(metadata.value, "annotations", null)
      # Type: ['map', 'string']   Optional  
      # An unstructured key value map stored with the csi driver that may be used to store arbitrary metadata. More info: http://kubernetes.io/docs/user-guide/annotations

      generate_name = lookup(metadata.value, "generateName", null)
      # Type: string   Optional  
      # Prefix, used by the server, to generate a unique name ONLY IF the `name` field has not been provided. This value will also be combined with a unique suffix. Read more: https://github.com/kubernetes/community/blob/master/contributors/devel/sig-architecture/api-conventions.md#idempotency

      labels = lookup(metadata.value, "labels", null)
      # Type: ['map', 'string']   Optional  
      # Map of string keys and values that can be used to organize and categorize (scope and select) the csi driver. May match selectors of replication controllers and services. More info: http://kubernetes.io/docs/user-guide/labels

      name = lookup(metadata.value, "name", null)
      # Type: string   Optional Computed 
      # Name of the csi driver, must be unique. Cannot be updated. More info: http://kubernetes.io/docs/user-guide/identifiers#names

    }
  }

  dynamic "spec" { # Nesting Mode: list  Max Items : 1  
    for_each = contains(keys(each.value), "spec") ? {item = each.value["spec"]} : {}

    content {
      attach_required = lookup(spec.value, "attachRequired", null)
      # Type: bool Required    
      # Indicates if the CSI volume driver requires an attach operation

      pod_info_on_mount = lookup(spec.value, "podInfoOnMount", null)
      # Type: bool   Optional  
      # Indicates that the CSI volume driver requires additional pod information (like podName, podUID, etc.) during mount operations

      volume_lifecycle_modes = lookup(spec.value, "volumeLifecycleModes", null)
      # Type: ['list', 'string']   Optional  
      # Defines what kind of volumes this CSI volume driver supports

    }
  }


}