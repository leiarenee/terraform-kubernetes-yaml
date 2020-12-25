resource "kubernetes_persistent_volume" "instance" { 
  depends_on = [null_resource.module_depends_on]
  for_each = local.persistent_volume.applications

  dynamic "metadata" { # Nesting Mode: list  Min Items : 1  Max Items : 1  
    for_each = contains(keys(each.value), "metadata") ? {item = each.value["metadata"]} : {}

    content {
      annotations = lookup(metadata.value, "annotations", null)
      # Type: ['map', 'string']   Optional  
      # An unstructured key value map stored with the persistent volume that may be used to store arbitrary metadata. More info: http://kubernetes.io/docs/user-guide/annotations

      labels = lookup(metadata.value, "labels", null)
      # Type: ['map', 'string']   Optional  
      # Map of string keys and values that can be used to organize and categorize (scope and select) the persistent volume. May match selectors of replication controllers and services. More info: http://kubernetes.io/docs/user-guide/labels

      name = lookup(metadata.value, "name", null)
      # Type: string   Optional Computed 
      # Name of the persistent volume, must be unique. Cannot be updated. More info: http://kubernetes.io/docs/user-guide/identifiers#names

    }
  }

  dynamic "spec" { # Nesting Mode: list  Min Items : 1  
    for_each = lookup(each.value, "spec", {})

    content {
      access_modes = lookup(spec.value, "accessModes", null)
      # Type: ['set', 'string'] Required    
      # Contains all ways the volume can be mounted. More info: http://kubernetes.io/docs/user-guide/persistent-volumes#access-modes

      capacity = lookup(spec.value, "capacity", null)
      # Type: ['map', 'string'] Required    
      # A description of the persistent volume's resources and capacity. More info: http://kubernetes.io/docs/user-guide/persistent-volumes#capacity

      mount_options = lookup(spec.value, "mountOptions", null)
      # Type: ['set', 'string']   Optional  
      # A list of mount options, e.g. ["ro", "soft"]. Not validated - mount will simply fail if one is invalid.

      persistent_volume_reclaim_policy = lookup(spec.value, "persistentVolumeReclaimPolicy", null)
      # Type: string   Optional  
      # What happens to a persistent volume when released from its claim. Valid options are Retain (default) and Recycle. Recycling must be supported by the volume plugin underlying this persistent volume. More info: http://kubernetes.io/docs/user-guide/persistent-volumes#recycling-policy

      storage_class_name = lookup(spec.value, "storageClassName", null)
      # Type: string   Optional  
      # A description of the persistent volume's class. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes/#class

      volume_mode = lookup(spec.value, "volumeMode", null)
      # Type: string   Optional  
      # Defines if a volume is intended to be used with a formatted filesystem. or to remain in raw block state.

      dynamic "node_affinity" { # Nesting Mode: list  Max Items : 1  
        for_each = contains(keys(spec.value), "nodeAffinity") ? {item = spec.value["nodeAffinity"]} : {}

        content {
          dynamic "required" { # Nesting Mode: list  Max Items : 1  
            for_each = contains(keys(node_affinity.value), "required") ? {item = node_affinity.value["required"]} : {}

            content {
              dynamic "node_selector_term" { # Nesting Mode: list  Min Items : 1  
                for_each = lookup(required.value, "nodeSelectorTerms", {})

                content {
                  dynamic "match_expressions" { # Nesting Mode: list  
                    for_each = lookup(node_selector_term.value, "matchExpressions", {})

                    content {
                      key = lookup(match_expressions.value, "key", null)
                      # Type: string Required    
                      # The label key that the selector applies to.

                      operator = lookup(match_expressions.value, "operator", null)
                      # Type: string Required    
                      # A key's relationship to a set of values. Valid operators ard `In`, `NotIn`, `Exists`, `DoesNotExist`, `Gt`, and `Lt`.

                      values = lookup(match_expressions.value, "values", null)
                      # Type: ['set', 'string']   Optional  
                      # An array of string values. If the operator is `In` or `NotIn`, the values array must be non-empty. If the operator is `Exists` or `DoesNotExist`, the values array must be empty. This array is replaced during a strategic merge patch.

                    }
                  }

                  dynamic "match_fields" { # Nesting Mode: list  
                    for_each = lookup(node_selector_term.value, "matchFields", {})

                    content {
                      key = lookup(match_fields.value, "key", null)
                      # Type: string Required    
                      # The label key that the selector applies to.

                      operator = lookup(match_fields.value, "operator", null)
                      # Type: string Required    
                      # A key's relationship to a set of values. Valid operators ard `In`, `NotIn`, `Exists`, `DoesNotExist`, `Gt`, and `Lt`.

                      values = lookup(match_fields.value, "values", null)
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

      dynamic "persistent_volume_source" { # Nesting Mode: list  Min Items : 1  Max Items : 1  
        for_each = contains(keys(spec.value), "persistentVolumeSource") ? {item = spec.value["persistentVolumeSource"]} : {}

        content {
          dynamic "aws_elastic_block_store" { # Nesting Mode: list  Max Items : 1  
            for_each = contains(keys(persistent_volume_source.value), "awsElasticBlockStore") ? {item = persistent_volume_source.value["awsElasticBlockStore"]} : {}

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
            for_each = contains(keys(persistent_volume_source.value), "azureDisk") ? {item = persistent_volume_source.value["azureDisk"]} : {}

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
            for_each = contains(keys(persistent_volume_source.value), "azureFile") ? {item = persistent_volume_source.value["azureFile"]} : {}

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
            for_each = contains(keys(persistent_volume_source.value), "cephFs") ? {item = persistent_volume_source.value["cephFs"]} : {}

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
            for_each = contains(keys(persistent_volume_source.value), "cinder") ? {item = persistent_volume_source.value["cinder"]} : {}

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

          dynamic "csi" { # Nesting Mode: list  Max Items : 1  
            for_each = contains(keys(persistent_volume_source.value), "csi") ? {item = persistent_volume_source.value["csi"]} : {}

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

          dynamic "fc" { # Nesting Mode: list  Max Items : 1  
            for_each = contains(keys(persistent_volume_source.value), "fc") ? {item = persistent_volume_source.value["fc"]} : {}

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
            for_each = contains(keys(persistent_volume_source.value), "flexVolume") ? {item = persistent_volume_source.value["flexVolume"]} : {}

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
            for_each = contains(keys(persistent_volume_source.value), "flocker") ? {item = persistent_volume_source.value["flocker"]} : {}

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
            for_each = contains(keys(persistent_volume_source.value), "gcePersistentDisk") ? {item = persistent_volume_source.value["gcePersistentDisk"]} : {}

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

          dynamic "glusterfs" { # Nesting Mode: list  Max Items : 1  
            for_each = contains(keys(persistent_volume_source.value), "glusterfs") ? {item = persistent_volume_source.value["glusterfs"]} : {}

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
            for_each = contains(keys(persistent_volume_source.value), "hostPath") ? {item = persistent_volume_source.value["hostPath"]} : {}

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
            for_each = contains(keys(persistent_volume_source.value), "iscsi") ? {item = persistent_volume_source.value["iscsi"]} : {}

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
            for_each = contains(keys(persistent_volume_source.value), "local") ? {item = persistent_volume_source.value["local"]} : {}

            content {
              path = lookup(local.value, "path", null)
              # Type: string   Optional  
              # Path of the directory on the host. More info: http://kubernetes.io/docs/user-guide/volumes#local

            }
          }

          dynamic "nfs" { # Nesting Mode: list  Max Items : 1  
            for_each = contains(keys(persistent_volume_source.value), "nfs") ? {item = persistent_volume_source.value["nfs"]} : {}

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

          dynamic "photon_persistent_disk" { # Nesting Mode: list  Max Items : 1  
            for_each = contains(keys(persistent_volume_source.value), "photonPersistentDisk") ? {item = persistent_volume_source.value["photonPersistentDisk"]} : {}

            content {
              fs_type = lookup(photon_persistent_disk.value, "fsType", null)
              # Type: string   Optional  
              # Filesystem type to mount. Must be a filesystem type supported by the host operating system. Ex. "ext4", "xfs", "ntfs". Implicitly inferred to be "ext4" if unspecified.

              pd_id = lookup(photon_persistent_disk.value, "pdId", null)
              # Type: string Required    
              # ID that identifies Photon Controller persistent disk

            }
          }

          dynamic "quobyte" { # Nesting Mode: list  Max Items : 1  
            for_each = contains(keys(persistent_volume_source.value), "quobyte") ? {item = persistent_volume_source.value["quobyte"]} : {}

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
            for_each = contains(keys(persistent_volume_source.value), "rbd") ? {item = persistent_volume_source.value["rbd"]} : {}

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

          dynamic "vsphere_volume" { # Nesting Mode: list  Max Items : 1  
            for_each = contains(keys(persistent_volume_source.value), "vsphereVolume") ? {item = persistent_volume_source.value["vsphereVolume"]} : {}

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

  dynamic "timeouts" { # Nesting Mode: single  
    for_each = contains(keys(each.value), "timeouts") ? {item = each.value["timeouts"]} : {}

    content {
      create = lookup(timeouts.value, "create", null)
      # Type: string   Optional  

    }
  }


}