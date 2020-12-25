resource "kubernetes_storage_class" "instance" { 
  depends_on = [null_resource.module_depends_on]
  for_each = local.storage_class.applications

  allow_volume_expansion = lookup(each.value, "allowVolumeExpansion", null)
  # Type: bool   Optional  
  # Indicates whether the storage class allow volume expand

  mount_options = lookup(each.value, "mountOptions", null)
  # Type: ['set', 'string']   Optional  
  # Persistent Volumes that are dynamically created by a storage class will have the mount options specified

  parameters = lookup(each.value, "parameters", null)
  # Type: ['map', 'string']   Optional  
  # The parameters for the provisioner that should create volumes of this storage class

  reclaim_policy = lookup(each.value, "reclaimPolicy", null)
  # Type: string   Optional  
  # Indicates the type of the reclaim policy

  storage_provisioner = lookup(each.value, "storageProvisioner", null)
  # Type: string Required    
  # Indicates the type of the provisioner

  volume_binding_mode = lookup(each.value, "volumeBindingMode", null)
  # Type: string   Optional  
  # Indicates when volume binding and dynamic provisioning should occur

  dynamic "metadata" { # Nesting Mode: list  Min Items : 1  Max Items : 1  
    for_each = contains(keys(each.value), "metadata") ? {item = each.value["metadata"]} : {}

    content {
      annotations = lookup(metadata.value, "annotations", null)
      # Type: ['map', 'string']   Optional  
      # An unstructured key value map stored with the storage class that may be used to store arbitrary metadata. More info: http://kubernetes.io/docs/user-guide/annotations

      generate_name = lookup(metadata.value, "generateName", null)
      # Type: string   Optional  
      # Prefix, used by the server, to generate a unique name ONLY IF the `name` field has not been provided. This value will also be combined with a unique suffix. Read more: https://github.com/kubernetes/community/blob/master/contributors/devel/sig-architecture/api-conventions.md#idempotency

      labels = lookup(metadata.value, "labels", null)
      # Type: ['map', 'string']   Optional  
      # Map of string keys and values that can be used to organize and categorize (scope and select) the storage class. May match selectors of replication controllers and services. More info: http://kubernetes.io/docs/user-guide/labels

      name = lookup(metadata.value, "name", null)
      # Type: string   Optional Computed 
      # Name of the storage class, must be unique. Cannot be updated. More info: http://kubernetes.io/docs/user-guide/identifiers#names

    }
  }


}