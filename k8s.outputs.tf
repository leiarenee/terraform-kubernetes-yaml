output "output" {
value = {
  for app, config in var.appConfig:
    app => {
      api_service = contains(keys(local.api_service.applications), app) ? {
        metadata = {
          generation = try(kubernetes_api_service.instance[app].metadata.0.generation,null)
          # A sequence number representing a specific generation of the desired state.

          name = try(kubernetes_api_service.instance[app].metadata.0.name,null)
          # Name of the api_service, must be unique. Cannot be updated. More info: http://kubernetes.io/docs/user-guide/identifiers#names

          resourceVersion = try(kubernetes_api_service.instance[app].metadata.0.resource_version,null)
          # An opaque value that represents the internal version of this api_service that can be used by clients to determine when api_service has changed. Read more: https://github.com/kubernetes/community/blob/master/contributors/devel/sig-architecture/api-conventions.md#concurrency-control-and-consistency

          selfLink = try(kubernetes_api_service.instance[app].metadata.0.self_link,null)
          # A URL representing this api_service.

          uid = try(kubernetes_api_service.instance[app].metadata.0.uid,null)
          # The unique in time and space value for this api_service. More info: http://kubernetes.io/docs/user-guide/identifiers#uids

        }

      } : null

      certificate_signing_request = contains(keys(local.certificate_signing_request.applications), app) ? {
        certificate = try(kubernetes_certificate_signing_request.instance[app].certificate,null)
        # If request was approved, the controller will place the issued certificate here.

        metadata = {
          generation = try(kubernetes_certificate_signing_request.instance[app].metadata.0.generation,null)
          # A sequence number representing a specific generation of the desired state.

          name = try(kubernetes_certificate_signing_request.instance[app].metadata.0.name,null)
          # Name of the certificate signing request, must be unique. Cannot be updated. More info: http://kubernetes.io/docs/user-guide/identifiers#names

          resourceVersion = try(kubernetes_certificate_signing_request.instance[app].metadata.0.resource_version,null)
          # An opaque value that represents the internal version of this certificate signing request that can be used by clients to determine when certificate signing request has changed. Read more: https://github.com/kubernetes/community/blob/master/contributors/devel/sig-architecture/api-conventions.md#concurrency-control-and-consistency

          selfLink = try(kubernetes_certificate_signing_request.instance[app].metadata.0.self_link,null)
          # A URL representing this certificate signing request.

          uid = try(kubernetes_certificate_signing_request.instance[app].metadata.0.uid,null)
          # The unique in time and space value for this certificate signing request. More info: http://kubernetes.io/docs/user-guide/identifiers#uids

        }

      } : null

      cluster_role = contains(keys(local.cluster_role.applications), app) ? {
        metadata = {
          generation = try(kubernetes_cluster_role.instance[app].metadata.0.generation,null)
          # A sequence number representing a specific generation of the desired state.

          name = try(kubernetes_cluster_role.instance[app].metadata.0.name,null)
          # Name of the clusterRole, must be unique. Cannot be updated. More info: http://kubernetes.io/docs/user-guide/identifiers#names

          resourceVersion = try(kubernetes_cluster_role.instance[app].metadata.0.resource_version,null)
          # An opaque value that represents the internal version of this clusterRole that can be used by clients to determine when clusterRole has changed. Read more: https://github.com/kubernetes/community/blob/master/contributors/devel/sig-architecture/api-conventions.md#concurrency-control-and-consistency

          selfLink = try(kubernetes_cluster_role.instance[app].metadata.0.self_link,null)
          # A URL representing this clusterRole.

          uid = try(kubernetes_cluster_role.instance[app].metadata.0.uid,null)
          # The unique in time and space value for this clusterRole. More info: http://kubernetes.io/docs/user-guide/identifiers#uids

        }

      } : null

      cluster_role_binding = contains(keys(local.cluster_role_binding.applications), app) ? {
        metadata = {
          generation = try(kubernetes_cluster_role_binding.instance[app].metadata.0.generation,null)
          # A sequence number representing a specific generation of the desired state.

          name = try(kubernetes_cluster_role_binding.instance[app].metadata.0.name,null)
          # Name of the clusterRoleBinding, must be unique. Cannot be updated. More info: http://kubernetes.io/docs/user-guide/identifiers#names

          resourceVersion = try(kubernetes_cluster_role_binding.instance[app].metadata.0.resource_version,null)
          # An opaque value that represents the internal version of this clusterRoleBinding that can be used by clients to determine when clusterRoleBinding has changed. Read more: https://github.com/kubernetes/community/blob/master/contributors/devel/sig-architecture/api-conventions.md#concurrency-control-and-consistency

          selfLink = try(kubernetes_cluster_role_binding.instance[app].metadata.0.self_link,null)
          # A URL representing this clusterRoleBinding.

          uid = try(kubernetes_cluster_role_binding.instance[app].metadata.0.uid,null)
          # The unique in time and space value for this clusterRoleBinding. More info: http://kubernetes.io/docs/user-guide/identifiers#uids

        }

        subject = {
          apiGroup = try(kubernetes_cluster_role_binding.instance[app].subject.0.api_group,null)
          # The API group of the subject resource.

        }

      } : null

      config_map = contains(keys(local.config_map.applications), app) ? {
        metadata = {
          generation = try(kubernetes_config_map.instance[app].metadata.0.generation,null)
          # A sequence number representing a specific generation of the desired state.

          name = try(kubernetes_config_map.instance[app].metadata.0.name,null)
          # Name of the config map, must be unique. Cannot be updated. More info: http://kubernetes.io/docs/user-guide/identifiers#names

          resourceVersion = try(kubernetes_config_map.instance[app].metadata.0.resource_version,null)
          # An opaque value that represents the internal version of this config map that can be used by clients to determine when config map has changed. Read more: https://github.com/kubernetes/community/blob/master/contributors/devel/sig-architecture/api-conventions.md#concurrency-control-and-consistency

          selfLink = try(kubernetes_config_map.instance[app].metadata.0.self_link,null)
          # A URL representing this config map.

          uid = try(kubernetes_config_map.instance[app].metadata.0.uid,null)
          # The unique in time and space value for this config map. More info: http://kubernetes.io/docs/user-guide/identifiers#uids

        }

      } : null

      cron_job = contains(keys(local.cron_job.applications), app) ? {
        metadata = {
          generation = try(kubernetes_cron_job.instance[app].metadata.0.generation,null)
          # A sequence number representing a specific generation of the desired state.

          name = try(kubernetes_cron_job.instance[app].metadata.0.name,null)
          # Name of the cronjob, must be unique. Cannot be updated. More info: http://kubernetes.io/docs/user-guide/identifiers#names

          resourceVersion = try(kubernetes_cron_job.instance[app].metadata.0.resource_version,null)
          # An opaque value that represents the internal version of this cronjob that can be used by clients to determine when cronjob has changed. Read more: https://github.com/kubernetes/community/blob/master/contributors/devel/sig-architecture/api-conventions.md#concurrency-control-and-consistency

          selfLink = try(kubernetes_cron_job.instance[app].metadata.0.self_link,null)
          # A URL representing this cronjob.

          uid = try(kubernetes_cron_job.instance[app].metadata.0.uid,null)
          # The unique in time and space value for this cronjob. More info: http://kubernetes.io/docs/user-guide/identifiers#uids

        }

        spec_job_template_metadata = {
          generation = try(kubernetes_cron_job.instance[app].spec.0.job_template.0.metadata.0.generation,null)
          # A sequence number representing a specific generation of the desired state.

          name = try(kubernetes_cron_job.instance[app].spec.0.job_template.0.metadata.0.name,null)
          # Name of the jobTemplateSpec, must be unique. Cannot be updated. More info: http://kubernetes.io/docs/user-guide/identifiers#names

          resourceVersion = try(kubernetes_cron_job.instance[app].spec.0.job_template.0.metadata.0.resource_version,null)
          # An opaque value that represents the internal version of this jobTemplateSpec that can be used by clients to determine when jobTemplateSpec has changed. Read more: https://github.com/kubernetes/community/blob/master/contributors/devel/sig-architecture/api-conventions.md#concurrency-control-and-consistency

          selfLink = try(kubernetes_cron_job.instance[app].spec.0.job_template.0.metadata.0.self_link,null)
          # A URL representing this jobTemplateSpec.

          uid = try(kubernetes_cron_job.instance[app].spec.0.job_template.0.metadata.0.uid,null)
          # The unique in time and space value for this jobTemplateSpec. More info: http://kubernetes.io/docs/user-guide/identifiers#uids

        }

        spec_job_template_spec_template_metadata = {
          generation = try(kubernetes_cron_job.instance[app].spec.0.job_template.0.spec.0.template.0.metadata.0.generation,null)
          # A sequence number representing a specific generation of the desired state.

          name = try(kubernetes_cron_job.instance[app].spec.0.job_template.0.spec.0.template.0.metadata.0.name,null)
          # Name of the job, must be unique. Cannot be updated. More info: http://kubernetes.io/docs/user-guide/identifiers#names

          resourceVersion = try(kubernetes_cron_job.instance[app].spec.0.job_template.0.spec.0.template.0.metadata.0.resource_version,null)
          # An opaque value that represents the internal version of this job that can be used by clients to determine when job has changed. Read more: https://github.com/kubernetes/community/blob/master/contributors/devel/sig-architecture/api-conventions.md#concurrency-control-and-consistency

          selfLink = try(kubernetes_cron_job.instance[app].spec.0.job_template.0.spec.0.template.0.metadata.0.self_link,null)
          # A URL representing this job.

          uid = try(kubernetes_cron_job.instance[app].spec.0.job_template.0.spec.0.template.0.metadata.0.uid,null)
          # The unique in time and space value for this job. More info: http://kubernetes.io/docs/user-guide/identifiers#uids

        }

        spec_job_template_spec_template_spec = {
          hostname = try(kubernetes_cron_job.instance[app].spec.0.job_template.0.spec.0.template.0.spec.0.hostname,null)
          # Specifies the hostname of the Pod If not specified, the pod's hostname will be set to a system-defined value.

          nodeName = try(kubernetes_cron_job.instance[app].spec.0.job_template.0.spec.0.template.0.spec.0.node_name,null)
          # NodeName is a request to schedule this pod onto a specific node. If it is non-empty, the scheduler simply schedules this pod onto that node, assuming that it fits resource requirements.

          serviceAccountName = try(kubernetes_cron_job.instance[app].spec.0.job_template.0.spec.0.template.0.spec.0.service_account_name,null)
          # ServiceAccountName is the name of the ServiceAccount to use to run this pod. More info: http://releases.k8s.io/HEAD/docs/design/service_accounts.md.

        }

        spec_job_template_spec_template_spec_container = {
          imagePullPolicy = try(kubernetes_cron_job.instance[app].spec.0.job_template.0.spec.0.template.0.spec.0.container.0.image_pull_policy,null)
          # Image pull policy. One of Always, Never, IfNotPresent. Defaults to Always if :latest tag is specified, or IfNotPresent otherwise. Cannot be updated. More info: http://kubernetes.io/docs/user-guide/images#updating-images

          terminationMessagePolicy = try(kubernetes_cron_job.instance[app].spec.0.job_template.0.spec.0.template.0.spec.0.container.0.termination_message_policy,null)
          # Optional: Indicate how the termination message should be populated. File will use the contents of terminationMessagePath to populate the container status message on both success and failure. FallbackToLogsOnError will use the last chunk of container log output if the termination message file is empty and the container exited with an error. The log output is limited to 2048 bytes or 80 lines, whichever is smaller. Defaults to File. Cannot be updated.

        }

        spec_job_template_spec_template_spec_container_resources_limits = {
          cpu = try(kubernetes_cron_job.instance[app].spec.0.job_template.0.spec.0.template.0.spec.0.container.0.resources.0.limits.0.cpu,null)
          memory = try(kubernetes_cron_job.instance[app].spec.0.job_template.0.spec.0.template.0.spec.0.container.0.resources.0.limits.0.memory,null)
        }

        spec_job_template_spec_template_spec_container_resources_requests = {
          cpu = try(kubernetes_cron_job.instance[app].spec.0.job_template.0.spec.0.template.0.spec.0.container.0.resources.0.requests.0.cpu,null)
          memory = try(kubernetes_cron_job.instance[app].spec.0.job_template.0.spec.0.template.0.spec.0.container.0.resources.0.requests.0.memory,null)
        }

        spec_job_template_spec_template_spec_init_container = {
          imagePullPolicy = try(kubernetes_cron_job.instance[app].spec.0.job_template.0.spec.0.template.0.spec.0.init_container.0.image_pull_policy,null)
          # Image pull policy. One of Always, Never, IfNotPresent. Defaults to Always if :latest tag is specified, or IfNotPresent otherwise. Cannot be updated. More info: http://kubernetes.io/docs/user-guide/images#updating-images

          terminationMessagePolicy = try(kubernetes_cron_job.instance[app].spec.0.job_template.0.spec.0.template.0.spec.0.init_container.0.termination_message_policy,null)
          # Optional: Indicate how the termination message should be populated. File will use the contents of terminationMessagePath to populate the container status message on both success and failure. FallbackToLogsOnError will use the last chunk of container log output if the termination message file is empty and the container exited with an error. The log output is limited to 2048 bytes or 80 lines, whichever is smaller. Defaults to File. Cannot be updated.

        }

        spec_job_template_spec_template_spec_init_container_resources_limits = {
          cpu = try(kubernetes_cron_job.instance[app].spec.0.job_template.0.spec.0.template.0.spec.0.init_container.0.resources.0.limits.0.cpu,null)
          memory = try(kubernetes_cron_job.instance[app].spec.0.job_template.0.spec.0.template.0.spec.0.init_container.0.resources.0.limits.0.memory,null)
        }

        spec_job_template_spec_template_spec_init_container_resources_requests = {
          cpu = try(kubernetes_cron_job.instance[app].spec.0.job_template.0.spec.0.template.0.spec.0.init_container.0.resources.0.requests.0.cpu,null)
          memory = try(kubernetes_cron_job.instance[app].spec.0.job_template.0.spec.0.template.0.spec.0.init_container.0.resources.0.requests.0.memory,null)
        }

        spec_job_template_spec_template_spec_volume_azure_disk = {
          kind = try(kubernetes_cron_job.instance[app].spec.0.job_template.0.spec.0.template.0.spec.0.volume.0.azure_disk.0.kind,null)
          # The type for the data disk. Expected values: Shared, Dedicated, Managed. Defaults to Shared

        }

        spec_job_template_spec_template_spec_volume_ceph_fs_secret_ref = {
          namespace = try(kubernetes_cron_job.instance[app].spec.0.job_template.0.spec.0.template.0.spec.0.volume.0.ceph_fs.0.secret_ref.0.namespace,null)
          # Name of the referent. More info: http://kubernetes.io/docs/user-guide/identifiers#names

        }

        spec_job_template_spec_template_spec_volume_csi_controller_expand_secret_ref = {
          namespace = try(kubernetes_cron_job.instance[app].spec.0.job_template.0.spec.0.template.0.spec.0.volume.0.csi.0.controller_expand_secret_ref.0.namespace,null)
          # Name of the referent. More info: http://kubernetes.io/docs/user-guide/identifiers#names

        }

        spec_job_template_spec_template_spec_volume_csi_controller_publish_secret_ref = {
          namespace = try(kubernetes_cron_job.instance[app].spec.0.job_template.0.spec.0.template.0.spec.0.volume.0.csi.0.controller_publish_secret_ref.0.namespace,null)
          # Name of the referent. More info: http://kubernetes.io/docs/user-guide/identifiers#names

        }

        spec_job_template_spec_template_spec_volume_csi_node_publish_secret_ref = {
          namespace = try(kubernetes_cron_job.instance[app].spec.0.job_template.0.spec.0.template.0.spec.0.volume.0.csi.0.node_publish_secret_ref.0.namespace,null)
          # Name of the referent. More info: http://kubernetes.io/docs/user-guide/identifiers#names

        }

        spec_job_template_spec_template_spec_volume_csi_node_stage_secret_ref = {
          namespace = try(kubernetes_cron_job.instance[app].spec.0.job_template.0.spec.0.template.0.spec.0.volume.0.csi.0.node_stage_secret_ref.0.namespace,null)
          # Name of the referent. More info: http://kubernetes.io/docs/user-guide/identifiers#names

        }

        spec_job_template_spec_template_spec_volume_flex_volume_secret_ref = {
          namespace = try(kubernetes_cron_job.instance[app].spec.0.job_template.0.spec.0.template.0.spec.0.volume.0.flex_volume.0.secret_ref.0.namespace,null)
          # Name of the referent. More info: http://kubernetes.io/docs/user-guide/identifiers#names

        }

        spec_job_template_spec_template_spec_volume_rbd = {
          keyring = try(kubernetes_cron_job.instance[app].spec.0.job_template.0.spec.0.template.0.spec.0.volume.0.rbd.0.keyring,null)
          # Keyring is the path to key ring for RBDUser. Default is /etc/ceph/keyring. More info: http://releases.k8s.io/HEAD/examples/volumes/rbd/README.md#how-to-use-it

        }

        spec_job_template_spec_template_spec_volume_rbd_secret_ref = {
          namespace = try(kubernetes_cron_job.instance[app].spec.0.job_template.0.spec.0.template.0.spec.0.volume.0.rbd.0.secret_ref.0.namespace,null)
          # Name of the referent. More info: http://kubernetes.io/docs/user-guide/identifiers#names

        }

      } : null

      csi_driver = contains(keys(local.csi_driver.applications), app) ? {
        metadata = {
          generation = try(kubernetes_csi_driver.instance[app].metadata.0.generation,null)
          # A sequence number representing a specific generation of the desired state.

          name = try(kubernetes_csi_driver.instance[app].metadata.0.name,null)
          # Name of the csi driver, must be unique. Cannot be updated. More info: http://kubernetes.io/docs/user-guide/identifiers#names

          resourceVersion = try(kubernetes_csi_driver.instance[app].metadata.0.resource_version,null)
          # An opaque value that represents the internal version of this csi driver that can be used by clients to determine when csi driver has changed. Read more: https://github.com/kubernetes/community/blob/master/contributors/devel/sig-architecture/api-conventions.md#concurrency-control-and-consistency

          selfLink = try(kubernetes_csi_driver.instance[app].metadata.0.self_link,null)
          # A URL representing this csi driver.

          uid = try(kubernetes_csi_driver.instance[app].metadata.0.uid,null)
          # The unique in time and space value for this csi driver. More info: http://kubernetes.io/docs/user-guide/identifiers#uids

        }

      } : null

      daemonset = contains(keys(local.daemonset.applications), app) ? {
        metadata = {
          generation = try(kubernetes_daemonset.instance[app].metadata.0.generation,null)
          # A sequence number representing a specific generation of the desired state.

          name = try(kubernetes_daemonset.instance[app].metadata.0.name,null)
          # Name of the daemonset, must be unique. Cannot be updated. More info: http://kubernetes.io/docs/user-guide/identifiers#names

          resourceVersion = try(kubernetes_daemonset.instance[app].metadata.0.resource_version,null)
          # An opaque value that represents the internal version of this daemonset that can be used by clients to determine when daemonset has changed. Read more: https://github.com/kubernetes/community/blob/master/contributors/devel/sig-architecture/api-conventions.md#concurrency-control-and-consistency

          selfLink = try(kubernetes_daemonset.instance[app].metadata.0.self_link,null)
          # A URL representing this daemonset.

          uid = try(kubernetes_daemonset.instance[app].metadata.0.uid,null)
          # The unique in time and space value for this daemonset. More info: http://kubernetes.io/docs/user-guide/identifiers#uids

        }

        spec_template_metadata = {
          generation = try(kubernetes_daemonset.instance[app].spec.0.template.0.metadata.0.generation,null)
          # A sequence number representing a specific generation of the desired state.

          name = try(kubernetes_daemonset.instance[app].spec.0.template.0.metadata.0.name,null)
          # Name of the daemon set, must be unique. Cannot be updated. More info: http://kubernetes.io/docs/user-guide/identifiers#names

          resourceVersion = try(kubernetes_daemonset.instance[app].spec.0.template.0.metadata.0.resource_version,null)
          # An opaque value that represents the internal version of this daemon set that can be used by clients to determine when daemon set has changed. Read more: https://github.com/kubernetes/community/blob/master/contributors/devel/sig-architecture/api-conventions.md#concurrency-control-and-consistency

          selfLink = try(kubernetes_daemonset.instance[app].spec.0.template.0.metadata.0.self_link,null)
          # A URL representing this daemon set.

          uid = try(kubernetes_daemonset.instance[app].spec.0.template.0.metadata.0.uid,null)
          # The unique in time and space value for this daemon set. More info: http://kubernetes.io/docs/user-guide/identifiers#uids

        }

        spec_template_spec = {
          hostname = try(kubernetes_daemonset.instance[app].spec.0.template.0.spec.0.hostname,null)
          # Specifies the hostname of the Pod If not specified, the pod's hostname will be set to a system-defined value.

          nodeName = try(kubernetes_daemonset.instance[app].spec.0.template.0.spec.0.node_name,null)
          # NodeName is a request to schedule this pod onto a specific node. If it is non-empty, the scheduler simply schedules this pod onto that node, assuming that it fits resource requirements.

          serviceAccountName = try(kubernetes_daemonset.instance[app].spec.0.template.0.spec.0.service_account_name,null)
          # ServiceAccountName is the name of the ServiceAccount to use to run this pod. More info: http://releases.k8s.io/HEAD/docs/design/service_accounts.md.

        }

        spec_template_spec_container = {
          imagePullPolicy = try(kubernetes_daemonset.instance[app].spec.0.template.0.spec.0.container.0.image_pull_policy,null)
          # Image pull policy. One of Always, Never, IfNotPresent. Defaults to Always if :latest tag is specified, or IfNotPresent otherwise. Cannot be updated. More info: http://kubernetes.io/docs/user-guide/images#updating-images

          terminationMessagePolicy = try(kubernetes_daemonset.instance[app].spec.0.template.0.spec.0.container.0.termination_message_policy,null)
          # Optional: Indicate how the termination message should be populated. File will use the contents of terminationMessagePath to populate the container status message on both success and failure. FallbackToLogsOnError will use the last chunk of container log output if the termination message file is empty and the container exited with an error. The log output is limited to 2048 bytes or 80 lines, whichever is smaller. Defaults to File. Cannot be updated.

        }

        spec_template_spec_container_resources_limits = {
          cpu = try(kubernetes_daemonset.instance[app].spec.0.template.0.spec.0.container.0.resources.0.limits.0.cpu,null)
          memory = try(kubernetes_daemonset.instance[app].spec.0.template.0.spec.0.container.0.resources.0.limits.0.memory,null)
        }

        spec_template_spec_container_resources_requests = {
          cpu = try(kubernetes_daemonset.instance[app].spec.0.template.0.spec.0.container.0.resources.0.requests.0.cpu,null)
          memory = try(kubernetes_daemonset.instance[app].spec.0.template.0.spec.0.container.0.resources.0.requests.0.memory,null)
        }

        spec_template_spec_init_container = {
          imagePullPolicy = try(kubernetes_daemonset.instance[app].spec.0.template.0.spec.0.init_container.0.image_pull_policy,null)
          # Image pull policy. One of Always, Never, IfNotPresent. Defaults to Always if :latest tag is specified, or IfNotPresent otherwise. Cannot be updated. More info: http://kubernetes.io/docs/user-guide/images#updating-images

          terminationMessagePolicy = try(kubernetes_daemonset.instance[app].spec.0.template.0.spec.0.init_container.0.termination_message_policy,null)
          # Optional: Indicate how the termination message should be populated. File will use the contents of terminationMessagePath to populate the container status message on both success and failure. FallbackToLogsOnError will use the last chunk of container log output if the termination message file is empty and the container exited with an error. The log output is limited to 2048 bytes or 80 lines, whichever is smaller. Defaults to File. Cannot be updated.

        }

        spec_template_spec_init_container_resources_limits = {
          cpu = try(kubernetes_daemonset.instance[app].spec.0.template.0.spec.0.init_container.0.resources.0.limits.0.cpu,null)
          memory = try(kubernetes_daemonset.instance[app].spec.0.template.0.spec.0.init_container.0.resources.0.limits.0.memory,null)
        }

        spec_template_spec_init_container_resources_requests = {
          cpu = try(kubernetes_daemonset.instance[app].spec.0.template.0.spec.0.init_container.0.resources.0.requests.0.cpu,null)
          memory = try(kubernetes_daemonset.instance[app].spec.0.template.0.spec.0.init_container.0.resources.0.requests.0.memory,null)
        }

        spec_template_spec_volume_azure_disk = {
          kind = try(kubernetes_daemonset.instance[app].spec.0.template.0.spec.0.volume.0.azure_disk.0.kind,null)
          # The type for the data disk. Expected values: Shared, Dedicated, Managed. Defaults to Shared

        }

        spec_template_spec_volume_ceph_fs_secret_ref = {
          namespace = try(kubernetes_daemonset.instance[app].spec.0.template.0.spec.0.volume.0.ceph_fs.0.secret_ref.0.namespace,null)
          # Name of the referent. More info: http://kubernetes.io/docs/user-guide/identifiers#names

        }

        spec_template_spec_volume_csi_controller_expand_secret_ref = {
          namespace = try(kubernetes_daemonset.instance[app].spec.0.template.0.spec.0.volume.0.csi.0.controller_expand_secret_ref.0.namespace,null)
          # Name of the referent. More info: http://kubernetes.io/docs/user-guide/identifiers#names

        }

        spec_template_spec_volume_csi_controller_publish_secret_ref = {
          namespace = try(kubernetes_daemonset.instance[app].spec.0.template.0.spec.0.volume.0.csi.0.controller_publish_secret_ref.0.namespace,null)
          # Name of the referent. More info: http://kubernetes.io/docs/user-guide/identifiers#names

        }

        spec_template_spec_volume_csi_node_publish_secret_ref = {
          namespace = try(kubernetes_daemonset.instance[app].spec.0.template.0.spec.0.volume.0.csi.0.node_publish_secret_ref.0.namespace,null)
          # Name of the referent. More info: http://kubernetes.io/docs/user-guide/identifiers#names

        }

        spec_template_spec_volume_csi_node_stage_secret_ref = {
          namespace = try(kubernetes_daemonset.instance[app].spec.0.template.0.spec.0.volume.0.csi.0.node_stage_secret_ref.0.namespace,null)
          # Name of the referent. More info: http://kubernetes.io/docs/user-guide/identifiers#names

        }

        spec_template_spec_volume_flex_volume_secret_ref = {
          namespace = try(kubernetes_daemonset.instance[app].spec.0.template.0.spec.0.volume.0.flex_volume.0.secret_ref.0.namespace,null)
          # Name of the referent. More info: http://kubernetes.io/docs/user-guide/identifiers#names

        }

        spec_template_spec_volume_rbd = {
          keyring = try(kubernetes_daemonset.instance[app].spec.0.template.0.spec.0.volume.0.rbd.0.keyring,null)
          # Keyring is the path to key ring for RBDUser. Default is /etc/ceph/keyring. More info: http://releases.k8s.io/HEAD/examples/volumes/rbd/README.md#how-to-use-it

        }

        spec_template_spec_volume_rbd_secret_ref = {
          namespace = try(kubernetes_daemonset.instance[app].spec.0.template.0.spec.0.volume.0.rbd.0.secret_ref.0.namespace,null)
          # Name of the referent. More info: http://kubernetes.io/docs/user-guide/identifiers#names

        }

      } : null

      default_service_account = contains(keys(local.default_service_account.applications), app) ? {
        defaultSecretName = try(kubernetes_default_service_account.instance[app].default_secret_name,null)
        metadata = {
          generation = try(kubernetes_default_service_account.instance[app].metadata.0.generation,null)
          # A sequence number representing a specific generation of the desired state.

          resourceVersion = try(kubernetes_default_service_account.instance[app].metadata.0.resource_version,null)
          # An opaque value that represents the internal version of this service account that can be used by clients to determine when service account has changed. Read more: https://github.com/kubernetes/community/blob/master/contributors/devel/sig-architecture/api-conventions.md#concurrency-control-and-consistency

          selfLink = try(kubernetes_default_service_account.instance[app].metadata.0.self_link,null)
          # A URL representing this service account.

          uid = try(kubernetes_default_service_account.instance[app].metadata.0.uid,null)
          # The unique in time and space value for this service account. More info: http://kubernetes.io/docs/user-guide/identifiers#uids

        }

      } : null

      deployment = contains(keys(local.deployment.applications), app) ? {
        metadata = {
          generation = try(kubernetes_deployment.instance[app].metadata.0.generation,null)
          # A sequence number representing a specific generation of the desired state.

          name = try(kubernetes_deployment.instance[app].metadata.0.name,null)
          # Name of the deployment, must be unique. Cannot be updated. More info: http://kubernetes.io/docs/user-guide/identifiers#names

          resourceVersion = try(kubernetes_deployment.instance[app].metadata.0.resource_version,null)
          # An opaque value that represents the internal version of this deployment that can be used by clients to determine when deployment has changed. Read more: https://github.com/kubernetes/community/blob/master/contributors/devel/sig-architecture/api-conventions.md#concurrency-control-and-consistency

          selfLink = try(kubernetes_deployment.instance[app].metadata.0.self_link,null)
          # A URL representing this deployment.

          uid = try(kubernetes_deployment.instance[app].metadata.0.uid,null)
          # The unique in time and space value for this deployment. More info: http://kubernetes.io/docs/user-guide/identifiers#uids

        }

        spec_template_metadata = {
          generation = try(kubernetes_deployment.instance[app].spec.0.template.0.metadata.0.generation,null)
          # A sequence number representing a specific generation of the desired state.

          name = try(kubernetes_deployment.instance[app].spec.0.template.0.metadata.0.name,null)
          # Name of the pod, must be unique. Cannot be updated. More info: http://kubernetes.io/docs/user-guide/identifiers#names

          resourceVersion = try(kubernetes_deployment.instance[app].spec.0.template.0.metadata.0.resource_version,null)
          # An opaque value that represents the internal version of this pod that can be used by clients to determine when pod has changed. Read more: https://github.com/kubernetes/community/blob/master/contributors/devel/sig-architecture/api-conventions.md#concurrency-control-and-consistency

          selfLink = try(kubernetes_deployment.instance[app].spec.0.template.0.metadata.0.self_link,null)
          # A URL representing this pod.

          uid = try(kubernetes_deployment.instance[app].spec.0.template.0.metadata.0.uid,null)
          # The unique in time and space value for this pod. More info: http://kubernetes.io/docs/user-guide/identifiers#uids

        }

        spec_template_spec = {
          hostname = try(kubernetes_deployment.instance[app].spec.0.template.0.spec.0.hostname,null)
          # Specifies the hostname of the Pod If not specified, the pod's hostname will be set to a system-defined value.

          nodeName = try(kubernetes_deployment.instance[app].spec.0.template.0.spec.0.node_name,null)
          # NodeName is a request to schedule this pod onto a specific node. If it is non-empty, the scheduler simply schedules this pod onto that node, assuming that it fits resource requirements.

          serviceAccountName = try(kubernetes_deployment.instance[app].spec.0.template.0.spec.0.service_account_name,null)
          # ServiceAccountName is the name of the ServiceAccount to use to run this pod. More info: http://releases.k8s.io/HEAD/docs/design/service_accounts.md.

        }

        spec_template_spec_container = {
          imagePullPolicy = try(kubernetes_deployment.instance[app].spec.0.template.0.spec.0.container.0.image_pull_policy,null)
          # Image pull policy. One of Always, Never, IfNotPresent. Defaults to Always if :latest tag is specified, or IfNotPresent otherwise. Cannot be updated. More info: http://kubernetes.io/docs/user-guide/images#updating-images

          terminationMessagePolicy = try(kubernetes_deployment.instance[app].spec.0.template.0.spec.0.container.0.termination_message_policy,null)
          # Optional: Indicate how the termination message should be populated. File will use the contents of terminationMessagePath to populate the container status message on both success and failure. FallbackToLogsOnError will use the last chunk of container log output if the termination message file is empty and the container exited with an error. The log output is limited to 2048 bytes or 80 lines, whichever is smaller. Defaults to File. Cannot be updated.

        }

        spec_template_spec_container_resources_limits = {
          cpu = try(kubernetes_deployment.instance[app].spec.0.template.0.spec.0.container.0.resources.0.limits.0.cpu,null)
          memory = try(kubernetes_deployment.instance[app].spec.0.template.0.spec.0.container.0.resources.0.limits.0.memory,null)
        }

        spec_template_spec_container_resources_requests = {
          cpu = try(kubernetes_deployment.instance[app].spec.0.template.0.spec.0.container.0.resources.0.requests.0.cpu,null)
          memory = try(kubernetes_deployment.instance[app].spec.0.template.0.spec.0.container.0.resources.0.requests.0.memory,null)
        }

        spec_template_spec_init_container = {
          imagePullPolicy = try(kubernetes_deployment.instance[app].spec.0.template.0.spec.0.init_container.0.image_pull_policy,null)
          # Image pull policy. One of Always, Never, IfNotPresent. Defaults to Always if :latest tag is specified, or IfNotPresent otherwise. Cannot be updated. More info: http://kubernetes.io/docs/user-guide/images#updating-images

          terminationMessagePolicy = try(kubernetes_deployment.instance[app].spec.0.template.0.spec.0.init_container.0.termination_message_policy,null)
          # Optional: Indicate how the termination message should be populated. File will use the contents of terminationMessagePath to populate the container status message on both success and failure. FallbackToLogsOnError will use the last chunk of container log output if the termination message file is empty and the container exited with an error. The log output is limited to 2048 bytes or 80 lines, whichever is smaller. Defaults to File. Cannot be updated.

        }

        spec_template_spec_init_container_resources_limits = {
          cpu = try(kubernetes_deployment.instance[app].spec.0.template.0.spec.0.init_container.0.resources.0.limits.0.cpu,null)
          memory = try(kubernetes_deployment.instance[app].spec.0.template.0.spec.0.init_container.0.resources.0.limits.0.memory,null)
        }

        spec_template_spec_init_container_resources_requests = {
          cpu = try(kubernetes_deployment.instance[app].spec.0.template.0.spec.0.init_container.0.resources.0.requests.0.cpu,null)
          memory = try(kubernetes_deployment.instance[app].spec.0.template.0.spec.0.init_container.0.resources.0.requests.0.memory,null)
        }

        spec_template_spec_volume_azure_disk = {
          kind = try(kubernetes_deployment.instance[app].spec.0.template.0.spec.0.volume.0.azure_disk.0.kind,null)
          # The type for the data disk. Expected values: Shared, Dedicated, Managed. Defaults to Shared

        }

        spec_template_spec_volume_ceph_fs_secret_ref = {
          namespace = try(kubernetes_deployment.instance[app].spec.0.template.0.spec.0.volume.0.ceph_fs.0.secret_ref.0.namespace,null)
          # Name of the referent. More info: http://kubernetes.io/docs/user-guide/identifiers#names

        }

        spec_template_spec_volume_csi_controller_expand_secret_ref = {
          namespace = try(kubernetes_deployment.instance[app].spec.0.template.0.spec.0.volume.0.csi.0.controller_expand_secret_ref.0.namespace,null)
          # Name of the referent. More info: http://kubernetes.io/docs/user-guide/identifiers#names

        }

        spec_template_spec_volume_csi_controller_publish_secret_ref = {
          namespace = try(kubernetes_deployment.instance[app].spec.0.template.0.spec.0.volume.0.csi.0.controller_publish_secret_ref.0.namespace,null)
          # Name of the referent. More info: http://kubernetes.io/docs/user-guide/identifiers#names

        }

        spec_template_spec_volume_csi_node_publish_secret_ref = {
          namespace = try(kubernetes_deployment.instance[app].spec.0.template.0.spec.0.volume.0.csi.0.node_publish_secret_ref.0.namespace,null)
          # Name of the referent. More info: http://kubernetes.io/docs/user-guide/identifiers#names

        }

        spec_template_spec_volume_csi_node_stage_secret_ref = {
          namespace = try(kubernetes_deployment.instance[app].spec.0.template.0.spec.0.volume.0.csi.0.node_stage_secret_ref.0.namespace,null)
          # Name of the referent. More info: http://kubernetes.io/docs/user-guide/identifiers#names

        }

        spec_template_spec_volume_flex_volume_secret_ref = {
          namespace = try(kubernetes_deployment.instance[app].spec.0.template.0.spec.0.volume.0.flex_volume.0.secret_ref.0.namespace,null)
          # Name of the referent. More info: http://kubernetes.io/docs/user-guide/identifiers#names

        }

        spec_template_spec_volume_rbd = {
          keyring = try(kubernetes_deployment.instance[app].spec.0.template.0.spec.0.volume.0.rbd.0.keyring,null)
          # Keyring is the path to key ring for RBDUser. Default is /etc/ceph/keyring. More info: http://releases.k8s.io/HEAD/examples/volumes/rbd/README.md#how-to-use-it

        }

        spec_template_spec_volume_rbd_secret_ref = {
          namespace = try(kubernetes_deployment.instance[app].spec.0.template.0.spec.0.volume.0.rbd.0.secret_ref.0.namespace,null)
          # Name of the referent. More info: http://kubernetes.io/docs/user-guide/identifiers#names

        }

      } : null

      endpoints = contains(keys(local.endpoints.applications), app) ? {
        metadata = {
          generation = try(kubernetes_endpoints.instance[app].metadata.0.generation,null)
          # A sequence number representing a specific generation of the desired state.

          name = try(kubernetes_endpoints.instance[app].metadata.0.name,null)
          # Name of the endpoints, must be unique. Cannot be updated. More info: http://kubernetes.io/docs/user-guide/identifiers#names

          resourceVersion = try(kubernetes_endpoints.instance[app].metadata.0.resource_version,null)
          # An opaque value that represents the internal version of this endpoints that can be used by clients to determine when endpoints has changed. Read more: https://github.com/kubernetes/community/blob/master/contributors/devel/sig-architecture/api-conventions.md#concurrency-control-and-consistency

          selfLink = try(kubernetes_endpoints.instance[app].metadata.0.self_link,null)
          # A URL representing this endpoints.

          uid = try(kubernetes_endpoints.instance[app].metadata.0.uid,null)
          # The unique in time and space value for this endpoints. More info: http://kubernetes.io/docs/user-guide/identifiers#uids

        }

      } : null

      horizontal_pod_autoscaler = contains(keys(local.horizontal_pod_autoscaler.applications), app) ? {
        metadata = {
          generation = try(kubernetes_horizontal_pod_autoscaler.instance[app].metadata.0.generation,null)
          # A sequence number representing a specific generation of the desired state.

          name = try(kubernetes_horizontal_pod_autoscaler.instance[app].metadata.0.name,null)
          # Name of the horizontal pod autoscaler, must be unique. Cannot be updated. More info: http://kubernetes.io/docs/user-guide/identifiers#names

          resourceVersion = try(kubernetes_horizontal_pod_autoscaler.instance[app].metadata.0.resource_version,null)
          # An opaque value that represents the internal version of this horizontal pod autoscaler that can be used by clients to determine when horizontal pod autoscaler has changed. Read more: https://github.com/kubernetes/community/blob/master/contributors/devel/sig-architecture/api-conventions.md#concurrency-control-and-consistency

          selfLink = try(kubernetes_horizontal_pod_autoscaler.instance[app].metadata.0.self_link,null)
          # A URL representing this horizontal pod autoscaler.

          uid = try(kubernetes_horizontal_pod_autoscaler.instance[app].metadata.0.uid,null)
          # The unique in time and space value for this horizontal pod autoscaler. More info: http://kubernetes.io/docs/user-guide/identifiers#uids

        }

        spec = {
          targetCpuUtilizationPercentage = try(kubernetes_horizontal_pod_autoscaler.instance[app].spec.0.target_cpu_utilization_percentage,null)
          # Target average CPU utilization (represented as a percentage of requested CPU) over all the pods. If not specified the default autoscaling policy will be used.

        }

      } : null

      ingress = contains(keys(local.ingress.applications), app) ? {
        loadBalancerIngress = try(kubernetes_ingress.instance[app].load_balancer_ingress,null)
        metadata = {
          generation = try(kubernetes_ingress.instance[app].metadata.0.generation,null)
          # A sequence number representing a specific generation of the desired state.

          name = try(kubernetes_ingress.instance[app].metadata.0.name,null)
          # Name of the ingress, must be unique. Cannot be updated. More info: http://kubernetes.io/docs/user-guide/identifiers#names

          resourceVersion = try(kubernetes_ingress.instance[app].metadata.0.resource_version,null)
          # An opaque value that represents the internal version of this ingress that can be used by clients to determine when ingress has changed. Read more: https://github.com/kubernetes/community/blob/master/contributors/devel/sig-architecture/api-conventions.md#concurrency-control-and-consistency

          selfLink = try(kubernetes_ingress.instance[app].metadata.0.self_link,null)
          # A URL representing this ingress.

          uid = try(kubernetes_ingress.instance[app].metadata.0.uid,null)
          # The unique in time and space value for this ingress. More info: http://kubernetes.io/docs/user-guide/identifiers#uids

        }

        spec_backend = {
          servicePort = try(kubernetes_ingress.instance[app].spec.0.backend.0.service_port,null)
          # Specifies the port of the referenced service.

        }

        spec_rule_http_path_backend = {
          servicePort = try(kubernetes_ingress.instance[app].spec.0.rule.0.http.0.path.0.backend.0.service_port,null)
          # Specifies the port of the referenced service.

        }

      } : null

      job = contains(keys(local.job.applications), app) ? {
        metadata = {
          generation = try(kubernetes_job.instance[app].metadata.0.generation,null)
          # A sequence number representing a specific generation of the desired state.

          labels = try(kubernetes_job.instance[app].metadata.0.labels,null)
          # Map of string keys and values that can be used to organize and categorize (scope and select) the job. May match selectors of replication controllers and services. More info: http://kubernetes.io/docs/user-guide/labels

          name = try(kubernetes_job.instance[app].metadata.0.name,null)
          # Name of the job, must be unique. Cannot be updated. More info: http://kubernetes.io/docs/user-guide/identifiers#names

          resourceVersion = try(kubernetes_job.instance[app].metadata.0.resource_version,null)
          # An opaque value that represents the internal version of this job that can be used by clients to determine when job has changed. Read more: https://github.com/kubernetes/community/blob/master/contributors/devel/sig-architecture/api-conventions.md#concurrency-control-and-consistency

          selfLink = try(kubernetes_job.instance[app].metadata.0.self_link,null)
          # A URL representing this job.

          uid = try(kubernetes_job.instance[app].metadata.0.uid,null)
          # The unique in time and space value for this job. More info: http://kubernetes.io/docs/user-guide/identifiers#uids

        }

        spec_template_metadata = {
          generation = try(kubernetes_job.instance[app].spec.0.template.0.metadata.0.generation,null)
          # A sequence number representing a specific generation of the desired state.

          name = try(kubernetes_job.instance[app].spec.0.template.0.metadata.0.name,null)
          # Name of the job, must be unique. Cannot be updated. More info: http://kubernetes.io/docs/user-guide/identifiers#names

          resourceVersion = try(kubernetes_job.instance[app].spec.0.template.0.metadata.0.resource_version,null)
          # An opaque value that represents the internal version of this job that can be used by clients to determine when job has changed. Read more: https://github.com/kubernetes/community/blob/master/contributors/devel/sig-architecture/api-conventions.md#concurrency-control-and-consistency

          selfLink = try(kubernetes_job.instance[app].spec.0.template.0.metadata.0.self_link,null)
          # A URL representing this job.

          uid = try(kubernetes_job.instance[app].spec.0.template.0.metadata.0.uid,null)
          # The unique in time and space value for this job. More info: http://kubernetes.io/docs/user-guide/identifiers#uids

        }

        spec_template_spec = {
          hostname = try(kubernetes_job.instance[app].spec.0.template.0.spec.0.hostname,null)
          # Specifies the hostname of the Pod If not specified, the pod's hostname will be set to a system-defined value.

          nodeName = try(kubernetes_job.instance[app].spec.0.template.0.spec.0.node_name,null)
          # NodeName is a request to schedule this pod onto a specific node. If it is non-empty, the scheduler simply schedules this pod onto that node, assuming that it fits resource requirements.

          serviceAccountName = try(kubernetes_job.instance[app].spec.0.template.0.spec.0.service_account_name,null)
          # ServiceAccountName is the name of the ServiceAccount to use to run this pod. More info: http://releases.k8s.io/HEAD/docs/design/service_accounts.md.

        }

        spec_template_spec_container = {
          imagePullPolicy = try(kubernetes_job.instance[app].spec.0.template.0.spec.0.container.0.image_pull_policy,null)
          # Image pull policy. One of Always, Never, IfNotPresent. Defaults to Always if :latest tag is specified, or IfNotPresent otherwise. Cannot be updated. More info: http://kubernetes.io/docs/user-guide/images#updating-images

          terminationMessagePolicy = try(kubernetes_job.instance[app].spec.0.template.0.spec.0.container.0.termination_message_policy,null)
          # Optional: Indicate how the termination message should be populated. File will use the contents of terminationMessagePath to populate the container status message on both success and failure. FallbackToLogsOnError will use the last chunk of container log output if the termination message file is empty and the container exited with an error. The log output is limited to 2048 bytes or 80 lines, whichever is smaller. Defaults to File. Cannot be updated.

        }

        spec_template_spec_container_resources_limits = {
          cpu = try(kubernetes_job.instance[app].spec.0.template.0.spec.0.container.0.resources.0.limits.0.cpu,null)
          memory = try(kubernetes_job.instance[app].spec.0.template.0.spec.0.container.0.resources.0.limits.0.memory,null)
        }

        spec_template_spec_container_resources_requests = {
          cpu = try(kubernetes_job.instance[app].spec.0.template.0.spec.0.container.0.resources.0.requests.0.cpu,null)
          memory = try(kubernetes_job.instance[app].spec.0.template.0.spec.0.container.0.resources.0.requests.0.memory,null)
        }

        spec_template_spec_init_container = {
          imagePullPolicy = try(kubernetes_job.instance[app].spec.0.template.0.spec.0.init_container.0.image_pull_policy,null)
          # Image pull policy. One of Always, Never, IfNotPresent. Defaults to Always if :latest tag is specified, or IfNotPresent otherwise. Cannot be updated. More info: http://kubernetes.io/docs/user-guide/images#updating-images

          terminationMessagePolicy = try(kubernetes_job.instance[app].spec.0.template.0.spec.0.init_container.0.termination_message_policy,null)
          # Optional: Indicate how the termination message should be populated. File will use the contents of terminationMessagePath to populate the container status message on both success and failure. FallbackToLogsOnError will use the last chunk of container log output if the termination message file is empty and the container exited with an error. The log output is limited to 2048 bytes or 80 lines, whichever is smaller. Defaults to File. Cannot be updated.

        }

        spec_template_spec_init_container_resources_limits = {
          cpu = try(kubernetes_job.instance[app].spec.0.template.0.spec.0.init_container.0.resources.0.limits.0.cpu,null)
          memory = try(kubernetes_job.instance[app].spec.0.template.0.spec.0.init_container.0.resources.0.limits.0.memory,null)
        }

        spec_template_spec_init_container_resources_requests = {
          cpu = try(kubernetes_job.instance[app].spec.0.template.0.spec.0.init_container.0.resources.0.requests.0.cpu,null)
          memory = try(kubernetes_job.instance[app].spec.0.template.0.spec.0.init_container.0.resources.0.requests.0.memory,null)
        }

        spec_template_spec_volume_azure_disk = {
          kind = try(kubernetes_job.instance[app].spec.0.template.0.spec.0.volume.0.azure_disk.0.kind,null)
          # The type for the data disk. Expected values: Shared, Dedicated, Managed. Defaults to Shared

        }

        spec_template_spec_volume_ceph_fs_secret_ref = {
          namespace = try(kubernetes_job.instance[app].spec.0.template.0.spec.0.volume.0.ceph_fs.0.secret_ref.0.namespace,null)
          # Name of the referent. More info: http://kubernetes.io/docs/user-guide/identifiers#names

        }

        spec_template_spec_volume_csi_controller_expand_secret_ref = {
          namespace = try(kubernetes_job.instance[app].spec.0.template.0.spec.0.volume.0.csi.0.controller_expand_secret_ref.0.namespace,null)
          # Name of the referent. More info: http://kubernetes.io/docs/user-guide/identifiers#names

        }

        spec_template_spec_volume_csi_controller_publish_secret_ref = {
          namespace = try(kubernetes_job.instance[app].spec.0.template.0.spec.0.volume.0.csi.0.controller_publish_secret_ref.0.namespace,null)
          # Name of the referent. More info: http://kubernetes.io/docs/user-guide/identifiers#names

        }

        spec_template_spec_volume_csi_node_publish_secret_ref = {
          namespace = try(kubernetes_job.instance[app].spec.0.template.0.spec.0.volume.0.csi.0.node_publish_secret_ref.0.namespace,null)
          # Name of the referent. More info: http://kubernetes.io/docs/user-guide/identifiers#names

        }

        spec_template_spec_volume_csi_node_stage_secret_ref = {
          namespace = try(kubernetes_job.instance[app].spec.0.template.0.spec.0.volume.0.csi.0.node_stage_secret_ref.0.namespace,null)
          # Name of the referent. More info: http://kubernetes.io/docs/user-guide/identifiers#names

        }

        spec_template_spec_volume_flex_volume_secret_ref = {
          namespace = try(kubernetes_job.instance[app].spec.0.template.0.spec.0.volume.0.flex_volume.0.secret_ref.0.namespace,null)
          # Name of the referent. More info: http://kubernetes.io/docs/user-guide/identifiers#names

        }

        spec_template_spec_volume_rbd = {
          keyring = try(kubernetes_job.instance[app].spec.0.template.0.spec.0.volume.0.rbd.0.keyring,null)
          # Keyring is the path to key ring for RBDUser. Default is /etc/ceph/keyring. More info: http://releases.k8s.io/HEAD/examples/volumes/rbd/README.md#how-to-use-it

        }

        spec_template_spec_volume_rbd_secret_ref = {
          namespace = try(kubernetes_job.instance[app].spec.0.template.0.spec.0.volume.0.rbd.0.secret_ref.0.namespace,null)
          # Name of the referent. More info: http://kubernetes.io/docs/user-guide/identifiers#names

        }

      } : null

      limit_range = contains(keys(local.limit_range.applications), app) ? {
        metadata = {
          generation = try(kubernetes_limit_range.instance[app].metadata.0.generation,null)
          # A sequence number representing a specific generation of the desired state.

          name = try(kubernetes_limit_range.instance[app].metadata.0.name,null)
          # Name of the limit range, must be unique. Cannot be updated. More info: http://kubernetes.io/docs/user-guide/identifiers#names

          resourceVersion = try(kubernetes_limit_range.instance[app].metadata.0.resource_version,null)
          # An opaque value that represents the internal version of this limit range that can be used by clients to determine when limit range has changed. Read more: https://github.com/kubernetes/community/blob/master/contributors/devel/sig-architecture/api-conventions.md#concurrency-control-and-consistency

          selfLink = try(kubernetes_limit_range.instance[app].metadata.0.self_link,null)
          # A URL representing this limit range.

          uid = try(kubernetes_limit_range.instance[app].metadata.0.uid,null)
          # The unique in time and space value for this limit range. More info: http://kubernetes.io/docs/user-guide/identifiers#uids

        }

        spec_limit = {
          defaultRequest = try(kubernetes_limit_range.instance[app].spec.0.limit.0.default_request,null)
          # The default resource requirement request value by resource name if resource request is omitted.

        }

      } : null

      mutating_webhook_configuration = contains(keys(local.mutating_webhook_configuration.applications), app) ? {
        metadata = {
          generation = try(kubernetes_mutating_webhook_configuration.instance[app].metadata.0.generation,null)
          # A sequence number representing a specific generation of the desired state.

          name = try(kubernetes_mutating_webhook_configuration.instance[app].metadata.0.name,null)
          # Name of the mutating webhook configuration, must be unique. Cannot be updated. More info: http://kubernetes.io/docs/user-guide/identifiers#names

          resourceVersion = try(kubernetes_mutating_webhook_configuration.instance[app].metadata.0.resource_version,null)
          # An opaque value that represents the internal version of this mutating webhook configuration that can be used by clients to determine when mutating webhook configuration has changed. Read more: https://github.com/kubernetes/community/blob/master/contributors/devel/sig-architecture/api-conventions.md#concurrency-control-and-consistency

          selfLink = try(kubernetes_mutating_webhook_configuration.instance[app].metadata.0.self_link,null)
          # A URL representing this mutating webhook configuration.

          uid = try(kubernetes_mutating_webhook_configuration.instance[app].metadata.0.uid,null)
          # The unique in time and space value for this mutating webhook configuration. More info: http://kubernetes.io/docs/user-guide/identifiers#uids

        }

      } : null

      namespace = contains(keys(local.namespace.applications), app) ? {
        metadata = {
          generation = try(kubernetes_namespace.instance[app].metadata.0.generation,null)
          # A sequence number representing a specific generation of the desired state.

          name = try(kubernetes_namespace.instance[app].metadata.0.name,null)
          # Name of the namespace, must be unique. Cannot be updated. More info: http://kubernetes.io/docs/user-guide/identifiers#names

          resourceVersion = try(kubernetes_namespace.instance[app].metadata.0.resource_version,null)
          # An opaque value that represents the internal version of this namespace that can be used by clients to determine when namespace has changed. Read more: https://github.com/kubernetes/community/blob/master/contributors/devel/sig-architecture/api-conventions.md#concurrency-control-and-consistency

          selfLink = try(kubernetes_namespace.instance[app].metadata.0.self_link,null)
          # A URL representing this namespace.

          uid = try(kubernetes_namespace.instance[app].metadata.0.uid,null)
          # The unique in time and space value for this namespace. More info: http://kubernetes.io/docs/user-guide/identifiers#uids

        }

      } : null

      network_policy = contains(keys(local.network_policy.applications), app) ? {
        metadata = {
          generation = try(kubernetes_network_policy.instance[app].metadata.0.generation,null)
          # A sequence number representing a specific generation of the desired state.

          name = try(kubernetes_network_policy.instance[app].metadata.0.name,null)
          # Name of the network policy, must be unique. Cannot be updated. More info: http://kubernetes.io/docs/user-guide/identifiers#names

          resourceVersion = try(kubernetes_network_policy.instance[app].metadata.0.resource_version,null)
          # An opaque value that represents the internal version of this network policy that can be used by clients to determine when network policy has changed. Read more: https://github.com/kubernetes/community/blob/master/contributors/devel/sig-architecture/api-conventions.md#concurrency-control-and-consistency

          selfLink = try(kubernetes_network_policy.instance[app].metadata.0.self_link,null)
          # A URL representing this network policy.

          uid = try(kubernetes_network_policy.instance[app].metadata.0.uid,null)
          # The unique in time and space value for this network policy. More info: http://kubernetes.io/docs/user-guide/identifiers#uids

        }

      } : null

      persistent_volume = contains(keys(local.persistent_volume.applications), app) ? {
        metadata = {
          generation = try(kubernetes_persistent_volume.instance[app].metadata.0.generation,null)
          # A sequence number representing a specific generation of the desired state.

          name = try(kubernetes_persistent_volume.instance[app].metadata.0.name,null)
          # Name of the persistent volume, must be unique. Cannot be updated. More info: http://kubernetes.io/docs/user-guide/identifiers#names

          resourceVersion = try(kubernetes_persistent_volume.instance[app].metadata.0.resource_version,null)
          # An opaque value that represents the internal version of this persistent volume that can be used by clients to determine when persistent volume has changed. Read more: https://github.com/kubernetes/community/blob/master/contributors/devel/sig-architecture/api-conventions.md#concurrency-control-and-consistency

          selfLink = try(kubernetes_persistent_volume.instance[app].metadata.0.self_link,null)
          # A URL representing this persistent volume.

          uid = try(kubernetes_persistent_volume.instance[app].metadata.0.uid,null)
          # The unique in time and space value for this persistent volume. More info: http://kubernetes.io/docs/user-guide/identifiers#uids

        }

        spec_persistent_volume_source_azure_disk = {
          kind = try(kubernetes_persistent_volume.instance[app].spec.0.persistent_volume_source.0.azure_disk.0.kind,null)
          # The type for the data disk. Expected values: Shared, Dedicated, Managed. Defaults to Shared

        }

        spec_persistent_volume_source_ceph_fs_secret_ref = {
          namespace = try(kubernetes_persistent_volume.instance[app].spec.0.persistent_volume_source.0.ceph_fs.0.secret_ref.0.namespace,null)
          # Name of the referent. More info: http://kubernetes.io/docs/user-guide/identifiers#names

        }

        spec_persistent_volume_source_csi_controller_expand_secret_ref = {
          namespace = try(kubernetes_persistent_volume.instance[app].spec.0.persistent_volume_source.0.csi.0.controller_expand_secret_ref.0.namespace,null)
          # Name of the referent. More info: http://kubernetes.io/docs/user-guide/identifiers#names

        }

        spec_persistent_volume_source_csi_controller_publish_secret_ref = {
          namespace = try(kubernetes_persistent_volume.instance[app].spec.0.persistent_volume_source.0.csi.0.controller_publish_secret_ref.0.namespace,null)
          # Name of the referent. More info: http://kubernetes.io/docs/user-guide/identifiers#names

        }

        spec_persistent_volume_source_csi_node_publish_secret_ref = {
          namespace = try(kubernetes_persistent_volume.instance[app].spec.0.persistent_volume_source.0.csi.0.node_publish_secret_ref.0.namespace,null)
          # Name of the referent. More info: http://kubernetes.io/docs/user-guide/identifiers#names

        }

        spec_persistent_volume_source_csi_node_stage_secret_ref = {
          namespace = try(kubernetes_persistent_volume.instance[app].spec.0.persistent_volume_source.0.csi.0.node_stage_secret_ref.0.namespace,null)
          # Name of the referent. More info: http://kubernetes.io/docs/user-guide/identifiers#names

        }

        spec_persistent_volume_source_flex_volume_secret_ref = {
          namespace = try(kubernetes_persistent_volume.instance[app].spec.0.persistent_volume_source.0.flex_volume.0.secret_ref.0.namespace,null)
          # Name of the referent. More info: http://kubernetes.io/docs/user-guide/identifiers#names

        }

        spec_persistent_volume_source_rbd = {
          keyring = try(kubernetes_persistent_volume.instance[app].spec.0.persistent_volume_source.0.rbd.0.keyring,null)
          # Keyring is the path to key ring for RBDUser. Default is /etc/ceph/keyring. More info: http://releases.k8s.io/HEAD/examples/volumes/rbd/README.md#how-to-use-it

        }

        spec_persistent_volume_source_rbd_secret_ref = {
          namespace = try(kubernetes_persistent_volume.instance[app].spec.0.persistent_volume_source.0.rbd.0.secret_ref.0.namespace,null)
          # Name of the referent. More info: http://kubernetes.io/docs/user-guide/identifiers#names

        }

      } : null

      persistent_volume_claim = contains(keys(local.persistent_volume_claim.applications), app) ? {
        metadata = {
          generation = try(kubernetes_persistent_volume_claim.instance[app].metadata.0.generation,null)
          # A sequence number representing a specific generation of the desired state.

          name = try(kubernetes_persistent_volume_claim.instance[app].metadata.0.name,null)
          # Name of the persistent volume claim, must be unique. Cannot be updated. More info: http://kubernetes.io/docs/user-guide/identifiers#names

          resourceVersion = try(kubernetes_persistent_volume_claim.instance[app].metadata.0.resource_version,null)
          # An opaque value that represents the internal version of this persistent volume claim that can be used by clients to determine when persistent volume claim has changed. Read more: https://github.com/kubernetes/community/blob/master/contributors/devel/sig-architecture/api-conventions.md#concurrency-control-and-consistency

          selfLink = try(kubernetes_persistent_volume_claim.instance[app].metadata.0.self_link,null)
          # A URL representing this persistent volume claim.

          uid = try(kubernetes_persistent_volume_claim.instance[app].metadata.0.uid,null)
          # The unique in time and space value for this persistent volume claim. More info: http://kubernetes.io/docs/user-guide/identifiers#uids

        }

        spec = {
          storageClassName = try(kubernetes_persistent_volume_claim.instance[app].spec.0.storage_class_name,null)
          # Name of the storage class requested by the claim

          volumeName = try(kubernetes_persistent_volume_claim.instance[app].spec.0.volume_name,null)
          # The binding reference to the PersistentVolume backing this claim.

        }

      } : null

      pod = contains(keys(local.pod.applications), app) ? {
        metadata = {
          generation = try(kubernetes_pod.instance[app].metadata.0.generation,null)
          # A sequence number representing a specific generation of the desired state.

          name = try(kubernetes_pod.instance[app].metadata.0.name,null)
          # Name of the pod, must be unique. Cannot be updated. More info: http://kubernetes.io/docs/user-guide/identifiers#names

          resourceVersion = try(kubernetes_pod.instance[app].metadata.0.resource_version,null)
          # An opaque value that represents the internal version of this pod that can be used by clients to determine when pod has changed. Read more: https://github.com/kubernetes/community/blob/master/contributors/devel/sig-architecture/api-conventions.md#concurrency-control-and-consistency

          selfLink = try(kubernetes_pod.instance[app].metadata.0.self_link,null)
          # A URL representing this pod.

          uid = try(kubernetes_pod.instance[app].metadata.0.uid,null)
          # The unique in time and space value for this pod. More info: http://kubernetes.io/docs/user-guide/identifiers#uids

        }

        spec = {
          hostname = try(kubernetes_pod.instance[app].spec.0.hostname,null)
          # Specifies the hostname of the Pod If not specified, the pod's hostname will be set to a system-defined value.

          nodeName = try(kubernetes_pod.instance[app].spec.0.node_name,null)
          # NodeName is a request to schedule this pod onto a specific node. If it is non-empty, the scheduler simply schedules this pod onto that node, assuming that it fits resource requirements.

          serviceAccountName = try(kubernetes_pod.instance[app].spec.0.service_account_name,null)
          # ServiceAccountName is the name of the ServiceAccount to use to run this pod. More info: http://releases.k8s.io/HEAD/docs/design/service_accounts.md.

        }

        spec_container = {
          imagePullPolicy = try(kubernetes_pod.instance[app].spec.0.container.0.image_pull_policy,null)
          # Image pull policy. One of Always, Never, IfNotPresent. Defaults to Always if :latest tag is specified, or IfNotPresent otherwise. Cannot be updated. More info: http://kubernetes.io/docs/user-guide/images#updating-images

          terminationMessagePolicy = try(kubernetes_pod.instance[app].spec.0.container.0.termination_message_policy,null)
          # Optional: Indicate how the termination message should be populated. File will use the contents of terminationMessagePath to populate the container status message on both success and failure. FallbackToLogsOnError will use the last chunk of container log output if the termination message file is empty and the container exited with an error. The log output is limited to 2048 bytes or 80 lines, whichever is smaller. Defaults to File. Cannot be updated.

        }

        spec_container_resources_limits = {
          cpu = try(kubernetes_pod.instance[app].spec.0.container.0.resources.0.limits.0.cpu,null)
          memory = try(kubernetes_pod.instance[app].spec.0.container.0.resources.0.limits.0.memory,null)
        }

        spec_container_resources_requests = {
          cpu = try(kubernetes_pod.instance[app].spec.0.container.0.resources.0.requests.0.cpu,null)
          memory = try(kubernetes_pod.instance[app].spec.0.container.0.resources.0.requests.0.memory,null)
        }

        spec_init_container = {
          imagePullPolicy = try(kubernetes_pod.instance[app].spec.0.init_container.0.image_pull_policy,null)
          # Image pull policy. One of Always, Never, IfNotPresent. Defaults to Always if :latest tag is specified, or IfNotPresent otherwise. Cannot be updated. More info: http://kubernetes.io/docs/user-guide/images#updating-images

          terminationMessagePolicy = try(kubernetes_pod.instance[app].spec.0.init_container.0.termination_message_policy,null)
          # Optional: Indicate how the termination message should be populated. File will use the contents of terminationMessagePath to populate the container status message on both success and failure. FallbackToLogsOnError will use the last chunk of container log output if the termination message file is empty and the container exited with an error. The log output is limited to 2048 bytes or 80 lines, whichever is smaller. Defaults to File. Cannot be updated.

        }

        spec_init_container_resources_limits = {
          cpu = try(kubernetes_pod.instance[app].spec.0.init_container.0.resources.0.limits.0.cpu,null)
          memory = try(kubernetes_pod.instance[app].spec.0.init_container.0.resources.0.limits.0.memory,null)
        }

        spec_init_container_resources_requests = {
          cpu = try(kubernetes_pod.instance[app].spec.0.init_container.0.resources.0.requests.0.cpu,null)
          memory = try(kubernetes_pod.instance[app].spec.0.init_container.0.resources.0.requests.0.memory,null)
        }

        spec_volume_azure_disk = {
          kind = try(kubernetes_pod.instance[app].spec.0.volume.0.azure_disk.0.kind,null)
          # The type for the data disk. Expected values: Shared, Dedicated, Managed. Defaults to Shared

        }

        spec_volume_ceph_fs_secret_ref = {
          namespace = try(kubernetes_pod.instance[app].spec.0.volume.0.ceph_fs.0.secret_ref.0.namespace,null)
          # Name of the referent. More info: http://kubernetes.io/docs/user-guide/identifiers#names

        }

        spec_volume_csi_controller_expand_secret_ref = {
          namespace = try(kubernetes_pod.instance[app].spec.0.volume.0.csi.0.controller_expand_secret_ref.0.namespace,null)
          # Name of the referent. More info: http://kubernetes.io/docs/user-guide/identifiers#names

        }

        spec_volume_csi_controller_publish_secret_ref = {
          namespace = try(kubernetes_pod.instance[app].spec.0.volume.0.csi.0.controller_publish_secret_ref.0.namespace,null)
          # Name of the referent. More info: http://kubernetes.io/docs/user-guide/identifiers#names

        }

        spec_volume_csi_node_publish_secret_ref = {
          namespace = try(kubernetes_pod.instance[app].spec.0.volume.0.csi.0.node_publish_secret_ref.0.namespace,null)
          # Name of the referent. More info: http://kubernetes.io/docs/user-guide/identifiers#names

        }

        spec_volume_csi_node_stage_secret_ref = {
          namespace = try(kubernetes_pod.instance[app].spec.0.volume.0.csi.0.node_stage_secret_ref.0.namespace,null)
          # Name of the referent. More info: http://kubernetes.io/docs/user-guide/identifiers#names

        }

        spec_volume_flex_volume_secret_ref = {
          namespace = try(kubernetes_pod.instance[app].spec.0.volume.0.flex_volume.0.secret_ref.0.namespace,null)
          # Name of the referent. More info: http://kubernetes.io/docs/user-guide/identifiers#names

        }

        spec_volume_rbd = {
          keyring = try(kubernetes_pod.instance[app].spec.0.volume.0.rbd.0.keyring,null)
          # Keyring is the path to key ring for RBDUser. Default is /etc/ceph/keyring. More info: http://releases.k8s.io/HEAD/examples/volumes/rbd/README.md#how-to-use-it

        }

        spec_volume_rbd_secret_ref = {
          namespace = try(kubernetes_pod.instance[app].spec.0.volume.0.rbd.0.secret_ref.0.namespace,null)
          # Name of the referent. More info: http://kubernetes.io/docs/user-guide/identifiers#names

        }

      } : null

      pod_disruption_budget = contains(keys(local.pod_disruption_budget.applications), app) ? {
        metadata = {
          generation = try(kubernetes_pod_disruption_budget.instance[app].metadata.0.generation,null)
          # A sequence number representing a specific generation of the desired state.

          name = try(kubernetes_pod_disruption_budget.instance[app].metadata.0.name,null)
          # Name of the pod disruption budget, must be unique. Cannot be updated. More info: http://kubernetes.io/docs/user-guide/identifiers#names

          resourceVersion = try(kubernetes_pod_disruption_budget.instance[app].metadata.0.resource_version,null)
          # An opaque value that represents the internal version of this pod disruption budget that can be used by clients to determine when pod disruption budget has changed. Read more: https://github.com/kubernetes/community/blob/master/contributors/devel/sig-architecture/api-conventions.md#concurrency-control-and-consistency

          selfLink = try(kubernetes_pod_disruption_budget.instance[app].metadata.0.self_link,null)
          # A URL representing this pod disruption budget.

          uid = try(kubernetes_pod_disruption_budget.instance[app].metadata.0.uid,null)
          # The unique in time and space value for this pod disruption budget. More info: http://kubernetes.io/docs/user-guide/identifiers#uids

        }

      } : null

      pod_security_policy = contains(keys(local.pod_security_policy.applications), app) ? {
        metadata = {
          generation = try(kubernetes_pod_security_policy.instance[app].metadata.0.generation,null)
          # A sequence number representing a specific generation of the desired state.

          name = try(kubernetes_pod_security_policy.instance[app].metadata.0.name,null)
          # Name of the podsecuritypolicy, must be unique. Cannot be updated. More info: http://kubernetes.io/docs/user-guide/identifiers#names

          resourceVersion = try(kubernetes_pod_security_policy.instance[app].metadata.0.resource_version,null)
          # An opaque value that represents the internal version of this podsecuritypolicy that can be used by clients to determine when podsecuritypolicy has changed. Read more: https://github.com/kubernetes/community/blob/master/contributors/devel/sig-architecture/api-conventions.md#concurrency-control-and-consistency

          selfLink = try(kubernetes_pod_security_policy.instance[app].metadata.0.self_link,null)
          # A URL representing this podsecuritypolicy.

          uid = try(kubernetes_pod_security_policy.instance[app].metadata.0.uid,null)
          # The unique in time and space value for this podsecuritypolicy. More info: http://kubernetes.io/docs/user-guide/identifiers#uids

        }

        spec = {
          allowPrivilegeEscalation = try(kubernetes_pod_security_policy.instance[app].spec.0.allow_privilege_escalation,null)
          # allowPrivilegeEscalation determines if a pod can request to allow privilege escalation. If unspecified, defaults to true.

          allowedCapabilities = try(kubernetes_pod_security_policy.instance[app].spec.0.allowed_capabilities,null)
          # allowedCapabilities is a list of capabilities that can be requested to add to the container. Capabilities in this field may be added at the pod author's discretion. You must not list a capability in both allowedCapabilities and requiredDropCapabilities.

          defaultAllowPrivilegeEscalation = try(kubernetes_pod_security_policy.instance[app].spec.0.default_allow_privilege_escalation,null)
          # defaultAllowPrivilegeEscalation controls the default setting for whether a process can gain more privileges than its parent process.

          hostIpc = try(kubernetes_pod_security_policy.instance[app].spec.0.host_ipc,null)
          # hostIPC determines if the policy allows the use of HostIPC in the pod spec.

          hostNetwork = try(kubernetes_pod_security_policy.instance[app].spec.0.host_network,null)
          # hostNetwork determines if the policy allows the use of HostNetwork in the pod spec.

          hostPid = try(kubernetes_pod_security_policy.instance[app].spec.0.host_pid,null)
          # hostPID determines if the policy allows the use of HostPID in the pod spec.

          privileged = try(kubernetes_pod_security_policy.instance[app].spec.0.privileged,null)
          # privileged determines if a pod can request to be run as privileged.

          readOnlyRootFilesystem = try(kubernetes_pod_security_policy.instance[app].spec.0.read_only_root_filesystem,null)
          # readOnlyRootFilesystem when set to true will force containers to run with a read only root file system.  If the container specifically requests to run with a non-read only root file system the PSP should deny the pod. If set to false the container may run with a read only root file system if it wishes but it will not be forced to.

          requiredDropCapabilities = try(kubernetes_pod_security_policy.instance[app].spec.0.required_drop_capabilities,null)
          # requiredDropCapabilities are the capabilities that will be dropped from the container.  These are required to be dropped and cannot be added.

          volumes = try(kubernetes_pod_security_policy.instance[app].spec.0.volumes,null)
          # volumes is an allowlist of volume plugins. Empty indicates that no volumes may be used. To allow all volumes you may use '*'.

        }

      } : null

      priority_class = contains(keys(local.priority_class.applications), app) ? {
        metadata = {
          generation = try(kubernetes_priority_class.instance[app].metadata.0.generation,null)
          # A sequence number representing a specific generation of the desired state.

          name = try(kubernetes_priority_class.instance[app].metadata.0.name,null)
          # Name of the priority class, must be unique. Cannot be updated. More info: http://kubernetes.io/docs/user-guide/identifiers#names

          resourceVersion = try(kubernetes_priority_class.instance[app].metadata.0.resource_version,null)
          # An opaque value that represents the internal version of this priority class that can be used by clients to determine when priority class has changed. Read more: https://github.com/kubernetes/community/blob/master/contributors/devel/sig-architecture/api-conventions.md#concurrency-control-and-consistency

          selfLink = try(kubernetes_priority_class.instance[app].metadata.0.self_link,null)
          # A URL representing this priority class.

          uid = try(kubernetes_priority_class.instance[app].metadata.0.uid,null)
          # The unique in time and space value for this priority class. More info: http://kubernetes.io/docs/user-guide/identifiers#uids

        }

      } : null

      replication_controller = contains(keys(local.replication_controller.applications), app) ? {
        metadata = {
          generation = try(kubernetes_replication_controller.instance[app].metadata.0.generation,null)
          # A sequence number representing a specific generation of the desired state.

          name = try(kubernetes_replication_controller.instance[app].metadata.0.name,null)
          # Name of the replication controller, must be unique. Cannot be updated. More info: http://kubernetes.io/docs/user-guide/identifiers#names

          resourceVersion = try(kubernetes_replication_controller.instance[app].metadata.0.resource_version,null)
          # An opaque value that represents the internal version of this replication controller that can be used by clients to determine when replication controller has changed. Read more: https://github.com/kubernetes/community/blob/master/contributors/devel/sig-architecture/api-conventions.md#concurrency-control-and-consistency

          selfLink = try(kubernetes_replication_controller.instance[app].metadata.0.self_link,null)
          # A URL representing this replication controller.

          uid = try(kubernetes_replication_controller.instance[app].metadata.0.uid,null)
          # The unique in time and space value for this replication controller. More info: http://kubernetes.io/docs/user-guide/identifiers#uids

        }

        spec_template = {
          activeDeadlineSeconds = try(kubernetes_replication_controller.instance[app].spec.0.template.0.active_deadline_seconds,null)
          # Optional duration in seconds the pod may be active on the node relative to StartTime before the system will actively try to mark it failed and kill associated containers. Value must be a positive integer.

          dnsPolicy = try(kubernetes_replication_controller.instance[app].spec.0.template.0.dns_policy,null)
          # Set DNS policy for containers within the pod. Valid values are 'ClusterFirstWithHostNet', 'ClusterFirst', 'Default' or 'None'. DNS parameters given in DNSConfig will be merged with the policy selected with DNSPolicy. To have DNS options set along with hostNetwork, you have to specify DNS policy explicitly to 'ClusterFirstWithHostNet'. Optional: Defaults to 'ClusterFirst', see [Kubernetes reference](https://kubernetes.io/docs/concepts/services-networking/dns-pod-service/#pod-s-dns-policy).

          hostIpc = try(kubernetes_replication_controller.instance[app].spec.0.template.0.host_ipc,null)
          # Use the host's ipc namespace. Optional: Defaults to false.

          hostNetwork = try(kubernetes_replication_controller.instance[app].spec.0.template.0.host_network,null)
          # Host networking requested for this pod. Use the host's network namespace. If this option is set, the ports that will be used must be specified.

          hostPid = try(kubernetes_replication_controller.instance[app].spec.0.template.0.host_pid,null)
          # Use the host's pid namespace.

          hostname = try(kubernetes_replication_controller.instance[app].spec.0.template.0.hostname,null)
          # Specifies the hostname of the Pod If not specified, the pod's hostname will be set to a system-defined value.

          nodeName = try(kubernetes_replication_controller.instance[app].spec.0.template.0.node_name,null)
          # NodeName is a request to schedule this pod onto a specific node. If it is non-empty, the scheduler simply schedules this pod onto that node, assuming that it fits resource requirements.

          nodeSelector = try(kubernetes_replication_controller.instance[app].spec.0.template.0.node_selector,null)
          # NodeSelector is a selector which must be true for the pod to fit on a node. Selector which must match a node's labels for the pod to be scheduled on that node. More info: http://kubernetes.io/docs/user-guide/node-selection.

          priorityClassName = try(kubernetes_replication_controller.instance[app].spec.0.template.0.priority_class_name,null)
          # If specified, indicates the pod's priority. "system-node-critical" and "system-cluster-critical" are two special keywords which indicate the highest priorities with the former being the highest priority. Any other name must be defined by creating a PriorityClass object with that name. If not specified, the pod priority will be default or zero if there is no default.

          restartPolicy = try(kubernetes_replication_controller.instance[app].spec.0.template.0.restart_policy,null)
          # Restart policy for all containers within the pod. One of Always, OnFailure, Never. More info: http://kubernetes.io/docs/user-guide/pod-states#restartpolicy.

          serviceAccountName = try(kubernetes_replication_controller.instance[app].spec.0.template.0.service_account_name,null)
          # ServiceAccountName is the name of the ServiceAccount to use to run this pod. More info: http://releases.k8s.io/HEAD/docs/design/service_accounts.md.

          subdomain = try(kubernetes_replication_controller.instance[app].spec.0.template.0.subdomain,null)
          # If specified, the fully qualified Pod hostname will be "...svc.". If not specified, the pod will not have a domainname at all..

          terminationGracePeriodSeconds = try(kubernetes_replication_controller.instance[app].spec.0.template.0.termination_grace_period_seconds,null)
          # Optional duration in seconds the pod needs to terminate gracefully. May be decreased in delete request. Value must be non-negative integer. The value zero indicates delete immediately. If this value is nil, the default grace period will be used instead. The grace period is the duration in seconds after the processes running in the pod are sent a termination signal and the time when the processes are forcibly halted with a kill signal. Set this value longer than the expected cleanup time for your process.

        }

        spec_template_container = {
          imagePullPolicy = try(kubernetes_replication_controller.instance[app].spec.0.template.0.container.0.image_pull_policy,null)
          # Image pull policy. One of Always, Never, IfNotPresent. Defaults to Always if :latest tag is specified, or IfNotPresent otherwise. Cannot be updated. More info: http://kubernetes.io/docs/user-guide/images#updating-images

          terminationMessagePolicy = try(kubernetes_replication_controller.instance[app].spec.0.template.0.container.0.termination_message_policy,null)
          # Optional: Indicate how the termination message should be populated. File will use the contents of terminationMessagePath to populate the container status message on both success and failure. FallbackToLogsOnError will use the last chunk of container log output if the termination message file is empty and the container exited with an error. The log output is limited to 2048 bytes or 80 lines, whichever is smaller. Defaults to File. Cannot be updated.

        }

        spec_template_container_resources_limits = {
          cpu = try(kubernetes_replication_controller.instance[app].spec.0.template.0.container.0.resources.0.limits.0.cpu,null)
          memory = try(kubernetes_replication_controller.instance[app].spec.0.template.0.container.0.resources.0.limits.0.memory,null)
        }

        spec_template_container_resources_requests = {
          cpu = try(kubernetes_replication_controller.instance[app].spec.0.template.0.container.0.resources.0.requests.0.cpu,null)
          memory = try(kubernetes_replication_controller.instance[app].spec.0.template.0.container.0.resources.0.requests.0.memory,null)
        }

        spec_template_init_container = {
          imagePullPolicy = try(kubernetes_replication_controller.instance[app].spec.0.template.0.init_container.0.image_pull_policy,null)
          # Image pull policy. One of Always, Never, IfNotPresent. Defaults to Always if :latest tag is specified, or IfNotPresent otherwise. Cannot be updated. More info: http://kubernetes.io/docs/user-guide/images#updating-images

          terminationMessagePolicy = try(kubernetes_replication_controller.instance[app].spec.0.template.0.init_container.0.termination_message_policy,null)
          # Optional: Indicate how the termination message should be populated. File will use the contents of terminationMessagePath to populate the container status message on both success and failure. FallbackToLogsOnError will use the last chunk of container log output if the termination message file is empty and the container exited with an error. The log output is limited to 2048 bytes or 80 lines, whichever is smaller. Defaults to File. Cannot be updated.

        }

        spec_template_init_container_resources_limits = {
          cpu = try(kubernetes_replication_controller.instance[app].spec.0.template.0.init_container.0.resources.0.limits.0.cpu,null)
          memory = try(kubernetes_replication_controller.instance[app].spec.0.template.0.init_container.0.resources.0.limits.0.memory,null)
        }

        spec_template_init_container_resources_requests = {
          cpu = try(kubernetes_replication_controller.instance[app].spec.0.template.0.init_container.0.resources.0.requests.0.cpu,null)
          memory = try(kubernetes_replication_controller.instance[app].spec.0.template.0.init_container.0.resources.0.requests.0.memory,null)
        }

        spec_template_metadata = {
          generation = try(kubernetes_replication_controller.instance[app].spec.0.template.0.metadata.0.generation,null)
          # A sequence number representing a specific generation of the desired state.

          name = try(kubernetes_replication_controller.instance[app].spec.0.template.0.metadata.0.name,null)
          # Name of the replication controller's template, must be unique. Cannot be updated. More info: http://kubernetes.io/docs/user-guide/identifiers#names

          resourceVersion = try(kubernetes_replication_controller.instance[app].spec.0.template.0.metadata.0.resource_version,null)
          # An opaque value that represents the internal version of this replication controller's template that can be used by clients to determine when replication controller's template has changed. Read more: https://github.com/kubernetes/community/blob/master/contributors/devel/sig-architecture/api-conventions.md#concurrency-control-and-consistency

          selfLink = try(kubernetes_replication_controller.instance[app].spec.0.template.0.metadata.0.self_link,null)
          # A URL representing this replication controller's template.

          uid = try(kubernetes_replication_controller.instance[app].spec.0.template.0.metadata.0.uid,null)
          # The unique in time and space value for this replication controller's template. More info: http://kubernetes.io/docs/user-guide/identifiers#uids

        }

        spec_template_spec = {
          activeDeadlineSeconds = try(kubernetes_replication_controller.instance[app].spec.0.template.0.spec.0.active_deadline_seconds,null)
          # Optional duration in seconds the pod may be active on the node relative to StartTime before the system will actively try to mark it failed and kill associated containers. Value must be a positive integer.

          dnsPolicy = try(kubernetes_replication_controller.instance[app].spec.0.template.0.spec.0.dns_policy,null)
          # Set DNS policy for containers within the pod. Valid values are 'ClusterFirstWithHostNet', 'ClusterFirst', 'Default' or 'None'. DNS parameters given in DNSConfig will be merged with the policy selected with DNSPolicy. To have DNS options set along with hostNetwork, you have to specify DNS policy explicitly to 'ClusterFirstWithHostNet'. Optional: Defaults to 'ClusterFirst', see [Kubernetes reference](https://kubernetes.io/docs/concepts/services-networking/dns-pod-service/#pod-s-dns-policy).

          hostIpc = try(kubernetes_replication_controller.instance[app].spec.0.template.0.spec.0.host_ipc,null)
          # Use the host's ipc namespace. Optional: Defaults to false.

          hostNetwork = try(kubernetes_replication_controller.instance[app].spec.0.template.0.spec.0.host_network,null)
          # Host networking requested for this pod. Use the host's network namespace. If this option is set, the ports that will be used must be specified.

          hostPid = try(kubernetes_replication_controller.instance[app].spec.0.template.0.spec.0.host_pid,null)
          # Use the host's pid namespace.

          hostname = try(kubernetes_replication_controller.instance[app].spec.0.template.0.spec.0.hostname,null)
          # Specifies the hostname of the Pod If not specified, the pod's hostname will be set to a system-defined value.

          nodeName = try(kubernetes_replication_controller.instance[app].spec.0.template.0.spec.0.node_name,null)
          # NodeName is a request to schedule this pod onto a specific node. If it is non-empty, the scheduler simply schedules this pod onto that node, assuming that it fits resource requirements.

          nodeSelector = try(kubernetes_replication_controller.instance[app].spec.0.template.0.spec.0.node_selector,null)
          # NodeSelector is a selector which must be true for the pod to fit on a node. Selector which must match a node's labels for the pod to be scheduled on that node. More info: http://kubernetes.io/docs/user-guide/node-selection.

          priorityClassName = try(kubernetes_replication_controller.instance[app].spec.0.template.0.spec.0.priority_class_name,null)
          # If specified, indicates the pod's priority. "system-node-critical" and "system-cluster-critical" are two special keywords which indicate the highest priorities with the former being the highest priority. Any other name must be defined by creating a PriorityClass object with that name. If not specified, the pod priority will be default or zero if there is no default.

          restartPolicy = try(kubernetes_replication_controller.instance[app].spec.0.template.0.spec.0.restart_policy,null)
          # Restart policy for all containers within the pod. One of Always, OnFailure, Never. More info: http://kubernetes.io/docs/user-guide/pod-states#restartpolicy.

          serviceAccountName = try(kubernetes_replication_controller.instance[app].spec.0.template.0.spec.0.service_account_name,null)
          # ServiceAccountName is the name of the ServiceAccount to use to run this pod. More info: http://releases.k8s.io/HEAD/docs/design/service_accounts.md.

          subdomain = try(kubernetes_replication_controller.instance[app].spec.0.template.0.spec.0.subdomain,null)
          # If specified, the fully qualified Pod hostname will be "...svc.". If not specified, the pod will not have a domainname at all..

          terminationGracePeriodSeconds = try(kubernetes_replication_controller.instance[app].spec.0.template.0.spec.0.termination_grace_period_seconds,null)
          # Optional duration in seconds the pod needs to terminate gracefully. May be decreased in delete request. Value must be non-negative integer. The value zero indicates delete immediately. If this value is nil, the default grace period will be used instead. The grace period is the duration in seconds after the processes running in the pod are sent a termination signal and the time when the processes are forcibly halted with a kill signal. Set this value longer than the expected cleanup time for your process.

        }

        spec_template_spec_container = {
          imagePullPolicy = try(kubernetes_replication_controller.instance[app].spec.0.template.0.spec.0.container.0.image_pull_policy,null)
          # Image pull policy. One of Always, Never, IfNotPresent. Defaults to Always if :latest tag is specified, or IfNotPresent otherwise. Cannot be updated. More info: http://kubernetes.io/docs/user-guide/images#updating-images

          terminationMessagePolicy = try(kubernetes_replication_controller.instance[app].spec.0.template.0.spec.0.container.0.termination_message_policy,null)
          # Optional: Indicate how the termination message should be populated. File will use the contents of terminationMessagePath to populate the container status message on both success and failure. FallbackToLogsOnError will use the last chunk of container log output if the termination message file is empty and the container exited with an error. The log output is limited to 2048 bytes or 80 lines, whichever is smaller. Defaults to File. Cannot be updated.

        }

        spec_template_spec_container_resources_limits = {
          cpu = try(kubernetes_replication_controller.instance[app].spec.0.template.0.spec.0.container.0.resources.0.limits.0.cpu,null)
          memory = try(kubernetes_replication_controller.instance[app].spec.0.template.0.spec.0.container.0.resources.0.limits.0.memory,null)
        }

        spec_template_spec_container_resources_requests = {
          cpu = try(kubernetes_replication_controller.instance[app].spec.0.template.0.spec.0.container.0.resources.0.requests.0.cpu,null)
          memory = try(kubernetes_replication_controller.instance[app].spec.0.template.0.spec.0.container.0.resources.0.requests.0.memory,null)
        }

        spec_template_spec_init_container = {
          imagePullPolicy = try(kubernetes_replication_controller.instance[app].spec.0.template.0.spec.0.init_container.0.image_pull_policy,null)
          # Image pull policy. One of Always, Never, IfNotPresent. Defaults to Always if :latest tag is specified, or IfNotPresent otherwise. Cannot be updated. More info: http://kubernetes.io/docs/user-guide/images#updating-images

          terminationMessagePolicy = try(kubernetes_replication_controller.instance[app].spec.0.template.0.spec.0.init_container.0.termination_message_policy,null)
          # Optional: Indicate how the termination message should be populated. File will use the contents of terminationMessagePath to populate the container status message on both success and failure. FallbackToLogsOnError will use the last chunk of container log output if the termination message file is empty and the container exited with an error. The log output is limited to 2048 bytes or 80 lines, whichever is smaller. Defaults to File. Cannot be updated.

        }

        spec_template_spec_init_container_resources_limits = {
          cpu = try(kubernetes_replication_controller.instance[app].spec.0.template.0.spec.0.init_container.0.resources.0.limits.0.cpu,null)
          memory = try(kubernetes_replication_controller.instance[app].spec.0.template.0.spec.0.init_container.0.resources.0.limits.0.memory,null)
        }

        spec_template_spec_init_container_resources_requests = {
          cpu = try(kubernetes_replication_controller.instance[app].spec.0.template.0.spec.0.init_container.0.resources.0.requests.0.cpu,null)
          memory = try(kubernetes_replication_controller.instance[app].spec.0.template.0.spec.0.init_container.0.resources.0.requests.0.memory,null)
        }

        spec_template_spec_volume_azure_disk = {
          kind = try(kubernetes_replication_controller.instance[app].spec.0.template.0.spec.0.volume.0.azure_disk.0.kind,null)
          # The type for the data disk. Expected values: Shared, Dedicated, Managed. Defaults to Shared

        }

        spec_template_spec_volume_ceph_fs_secret_ref = {
          namespace = try(kubernetes_replication_controller.instance[app].spec.0.template.0.spec.0.volume.0.ceph_fs.0.secret_ref.0.namespace,null)
          # Name of the referent. More info: http://kubernetes.io/docs/user-guide/identifiers#names

        }

        spec_template_spec_volume_csi_controller_expand_secret_ref = {
          namespace = try(kubernetes_replication_controller.instance[app].spec.0.template.0.spec.0.volume.0.csi.0.controller_expand_secret_ref.0.namespace,null)
          # Name of the referent. More info: http://kubernetes.io/docs/user-guide/identifiers#names

        }

        spec_template_spec_volume_csi_controller_publish_secret_ref = {
          namespace = try(kubernetes_replication_controller.instance[app].spec.0.template.0.spec.0.volume.0.csi.0.controller_publish_secret_ref.0.namespace,null)
          # Name of the referent. More info: http://kubernetes.io/docs/user-guide/identifiers#names

        }

        spec_template_spec_volume_csi_node_publish_secret_ref = {
          namespace = try(kubernetes_replication_controller.instance[app].spec.0.template.0.spec.0.volume.0.csi.0.node_publish_secret_ref.0.namespace,null)
          # Name of the referent. More info: http://kubernetes.io/docs/user-guide/identifiers#names

        }

        spec_template_spec_volume_csi_node_stage_secret_ref = {
          namespace = try(kubernetes_replication_controller.instance[app].spec.0.template.0.spec.0.volume.0.csi.0.node_stage_secret_ref.0.namespace,null)
          # Name of the referent. More info: http://kubernetes.io/docs/user-guide/identifiers#names

        }

        spec_template_spec_volume_flex_volume_secret_ref = {
          namespace = try(kubernetes_replication_controller.instance[app].spec.0.template.0.spec.0.volume.0.flex_volume.0.secret_ref.0.namespace,null)
          # Name of the referent. More info: http://kubernetes.io/docs/user-guide/identifiers#names

        }

        spec_template_spec_volume_rbd = {
          keyring = try(kubernetes_replication_controller.instance[app].spec.0.template.0.spec.0.volume.0.rbd.0.keyring,null)
          # Keyring is the path to key ring for RBDUser. Default is /etc/ceph/keyring. More info: http://releases.k8s.io/HEAD/examples/volumes/rbd/README.md#how-to-use-it

        }

        spec_template_spec_volume_rbd_secret_ref = {
          namespace = try(kubernetes_replication_controller.instance[app].spec.0.template.0.spec.0.volume.0.rbd.0.secret_ref.0.namespace,null)
          # Name of the referent. More info: http://kubernetes.io/docs/user-guide/identifiers#names

        }

        spec_template_volume_azure_disk = {
          kind = try(kubernetes_replication_controller.instance[app].spec.0.template.0.volume.0.azure_disk.0.kind,null)
          # The type for the data disk. Expected values: Shared, Dedicated, Managed. Defaults to Shared

        }

        spec_template_volume_ceph_fs_secret_ref = {
          namespace = try(kubernetes_replication_controller.instance[app].spec.0.template.0.volume.0.ceph_fs.0.secret_ref.0.namespace,null)
          # Name of the referent. More info: http://kubernetes.io/docs/user-guide/identifiers#names

        }

        spec_template_volume_csi_controller_expand_secret_ref = {
          namespace = try(kubernetes_replication_controller.instance[app].spec.0.template.0.volume.0.csi.0.controller_expand_secret_ref.0.namespace,null)
          # Name of the referent. More info: http://kubernetes.io/docs/user-guide/identifiers#names

        }

        spec_template_volume_csi_controller_publish_secret_ref = {
          namespace = try(kubernetes_replication_controller.instance[app].spec.0.template.0.volume.0.csi.0.controller_publish_secret_ref.0.namespace,null)
          # Name of the referent. More info: http://kubernetes.io/docs/user-guide/identifiers#names

        }

        spec_template_volume_csi_node_publish_secret_ref = {
          namespace = try(kubernetes_replication_controller.instance[app].spec.0.template.0.volume.0.csi.0.node_publish_secret_ref.0.namespace,null)
          # Name of the referent. More info: http://kubernetes.io/docs/user-guide/identifiers#names

        }

        spec_template_volume_csi_node_stage_secret_ref = {
          namespace = try(kubernetes_replication_controller.instance[app].spec.0.template.0.volume.0.csi.0.node_stage_secret_ref.0.namespace,null)
          # Name of the referent. More info: http://kubernetes.io/docs/user-guide/identifiers#names

        }

        spec_template_volume_flex_volume_secret_ref = {
          namespace = try(kubernetes_replication_controller.instance[app].spec.0.template.0.volume.0.flex_volume.0.secret_ref.0.namespace,null)
          # Name of the referent. More info: http://kubernetes.io/docs/user-guide/identifiers#names

        }

        spec_template_volume_rbd = {
          keyring = try(kubernetes_replication_controller.instance[app].spec.0.template.0.volume.0.rbd.0.keyring,null)
          # Keyring is the path to key ring for RBDUser. Default is /etc/ceph/keyring. More info: http://releases.k8s.io/HEAD/examples/volumes/rbd/README.md#how-to-use-it

        }

        spec_template_volume_rbd_secret_ref = {
          namespace = try(kubernetes_replication_controller.instance[app].spec.0.template.0.volume.0.rbd.0.secret_ref.0.namespace,null)
          # Name of the referent. More info: http://kubernetes.io/docs/user-guide/identifiers#names

        }

      } : null

      resource_quota = contains(keys(local.resource_quota.applications), app) ? {
        metadata = {
          generation = try(kubernetes_resource_quota.instance[app].metadata.0.generation,null)
          # A sequence number representing a specific generation of the desired state.

          name = try(kubernetes_resource_quota.instance[app].metadata.0.name,null)
          # Name of the resource quota, must be unique. Cannot be updated. More info: http://kubernetes.io/docs/user-guide/identifiers#names

          resourceVersion = try(kubernetes_resource_quota.instance[app].metadata.0.resource_version,null)
          # An opaque value that represents the internal version of this resource quota that can be used by clients to determine when resource quota has changed. Read more: https://github.com/kubernetes/community/blob/master/contributors/devel/sig-architecture/api-conventions.md#concurrency-control-and-consistency

          selfLink = try(kubernetes_resource_quota.instance[app].metadata.0.self_link,null)
          # A URL representing this resource quota.

          uid = try(kubernetes_resource_quota.instance[app].metadata.0.uid,null)
          # The unique in time and space value for this resource quota. More info: http://kubernetes.io/docs/user-guide/identifiers#uids

        }

      } : null

      role = contains(keys(local.role.applications), app) ? {
        metadata = {
          generation = try(kubernetes_role.instance[app].metadata.0.generation,null)
          # A sequence number representing a specific generation of the desired state.

          name = try(kubernetes_role.instance[app].metadata.0.name,null)
          # Name of the role, must be unique. Cannot be updated. More info: http://kubernetes.io/docs/user-guide/identifiers#names

          resourceVersion = try(kubernetes_role.instance[app].metadata.0.resource_version,null)
          # An opaque value that represents the internal version of this role that can be used by clients to determine when role has changed. Read more: https://github.com/kubernetes/community/blob/master/contributors/devel/sig-architecture/api-conventions.md#concurrency-control-and-consistency

          selfLink = try(kubernetes_role.instance[app].metadata.0.self_link,null)
          # A URL representing this role.

          uid = try(kubernetes_role.instance[app].metadata.0.uid,null)
          # The unique in time and space value for this role. More info: http://kubernetes.io/docs/user-guide/identifiers#uids

        }

      } : null

      role_binding = contains(keys(local.role_binding.applications), app) ? {
        metadata = {
          generation = try(kubernetes_role_binding.instance[app].metadata.0.generation,null)
          # A sequence number representing a specific generation of the desired state.

          name = try(kubernetes_role_binding.instance[app].metadata.0.name,null)
          # Name of the roleBinding, must be unique. Cannot be updated. More info: http://kubernetes.io/docs/user-guide/identifiers#names

          resourceVersion = try(kubernetes_role_binding.instance[app].metadata.0.resource_version,null)
          # An opaque value that represents the internal version of this roleBinding that can be used by clients to determine when roleBinding has changed. Read more: https://github.com/kubernetes/community/blob/master/contributors/devel/sig-architecture/api-conventions.md#concurrency-control-and-consistency

          selfLink = try(kubernetes_role_binding.instance[app].metadata.0.self_link,null)
          # A URL representing this roleBinding.

          uid = try(kubernetes_role_binding.instance[app].metadata.0.uid,null)
          # The unique in time and space value for this roleBinding. More info: http://kubernetes.io/docs/user-guide/identifiers#uids

        }

        subject = {
          apiGroup = try(kubernetes_role_binding.instance[app].subject.0.api_group,null)
          # The API group of the subject resource.

        }

      } : null

      secret = contains(keys(local.secret.applications), app) ? {
        metadata = {
          generation = try(kubernetes_secret.instance[app].metadata.0.generation,null)
          # A sequence number representing a specific generation of the desired state.

          name = try(kubernetes_secret.instance[app].metadata.0.name,null)
          # Name of the secret, must be unique. Cannot be updated. More info: http://kubernetes.io/docs/user-guide/identifiers#names

          resourceVersion = try(kubernetes_secret.instance[app].metadata.0.resource_version,null)
          # An opaque value that represents the internal version of this secret that can be used by clients to determine when secret has changed. Read more: https://github.com/kubernetes/community/blob/master/contributors/devel/sig-architecture/api-conventions.md#concurrency-control-and-consistency

          selfLink = try(kubernetes_secret.instance[app].metadata.0.self_link,null)
          # A URL representing this secret.

          uid = try(kubernetes_secret.instance[app].metadata.0.uid,null)
          # The unique in time and space value for this secret. More info: http://kubernetes.io/docs/user-guide/identifiers#uids

        }

      } : null

      service = contains(keys(local.service.applications), app) ? {
        loadBalancerIngress = try(kubernetes_service.instance[app].load_balancer_ingress,null)
        metadata = {
          generation = try(kubernetes_service.instance[app].metadata.0.generation,null)
          # A sequence number representing a specific generation of the desired state.

          name = try(kubernetes_service.instance[app].metadata.0.name,null)
          # Name of the service, must be unique. Cannot be updated. More info: http://kubernetes.io/docs/user-guide/identifiers#names

          resourceVersion = try(kubernetes_service.instance[app].metadata.0.resource_version,null)
          # An opaque value that represents the internal version of this service that can be used by clients to determine when service has changed. Read more: https://github.com/kubernetes/community/blob/master/contributors/devel/sig-architecture/api-conventions.md#concurrency-control-and-consistency

          selfLink = try(kubernetes_service.instance[app].metadata.0.self_link,null)
          # A URL representing this service.

          uid = try(kubernetes_service.instance[app].metadata.0.uid,null)
          # The unique in time and space value for this service. More info: http://kubernetes.io/docs/user-guide/identifiers#uids

        }

        spec = {
          clusterIp = try(kubernetes_service.instance[app].spec.0.cluster_ip,null)
          # The IP address of the service. It is usually assigned randomly by the master. If an address is specified manually and is not in use by others, it will be allocated to the service; otherwise, creation of the service will fail. `None` can be specified for headless services when proxying is not required. Ignored if type is `ExternalName`. More info: http://kubernetes.io/docs/user-guide/services#virtual-ips-and-service-proxies

          externalTrafficPolicy = try(kubernetes_service.instance[app].spec.0.external_traffic_policy,null)
          # Denotes if this Service desires to route external traffic to node-local or cluster-wide endpoints. `Local` preserves the client source IP and avoids a second hop for LoadBalancer and Nodeport type services, but risks potentially imbalanced traffic spreading. `Cluster` obscures the client source IP and may cause a second hop to another node, but should have good overall load-spreading. More info: https://kubernetes.io/docs/tutorials/services/source-ip/

          healthCheckNodePort = try(kubernetes_service.instance[app].spec.0.health_check_node_port,null)
          # Specifies the Healthcheck NodePort for the service. Only effects when type is set to `LoadBalancer` and external_traffic_policy is set to `Local`.

        }

        spec_port = {
          nodePort = try(kubernetes_service.instance[app].spec.0.port.0.node_port,null)
          # The port on each node on which this service is exposed when `type` is `NodePort` or `LoadBalancer`. Usually assigned by the system. If specified, it will be allocated to the service if unused or else creation of the service will fail. Default is to auto-allocate a port if the `type` of this service requires one. More info: http://kubernetes.io/docs/user-guide/services#type--nodeport

          targetPort = try(kubernetes_service.instance[app].spec.0.port.0.target_port,null)
          # Number or name of the port to access on the pods targeted by the service. Number must be in the range 1 to 65535. This field is ignored for services with `cluster_ip = "None"`. More info: http://kubernetes.io/docs/user-guide/services#defining-a-service

        }

      } : null

      service_account = contains(keys(local.service_account.applications), app) ? {
        defaultSecretName = try(kubernetes_service_account.instance[app].default_secret_name,null)
        metadata = {
          generation = try(kubernetes_service_account.instance[app].metadata.0.generation,null)
          # A sequence number representing a specific generation of the desired state.

          name = try(kubernetes_service_account.instance[app].metadata.0.name,null)
          # Name of the service account, must be unique. Cannot be updated. More info: http://kubernetes.io/docs/user-guide/identifiers#names

          resourceVersion = try(kubernetes_service_account.instance[app].metadata.0.resource_version,null)
          # An opaque value that represents the internal version of this service account that can be used by clients to determine when service account has changed. Read more: https://github.com/kubernetes/community/blob/master/contributors/devel/sig-architecture/api-conventions.md#concurrency-control-and-consistency

          selfLink = try(kubernetes_service_account.instance[app].metadata.0.self_link,null)
          # A URL representing this service account.

          uid = try(kubernetes_service_account.instance[app].metadata.0.uid,null)
          # The unique in time and space value for this service account. More info: http://kubernetes.io/docs/user-guide/identifiers#uids

        }

      } : null

      stateful_set = contains(keys(local.stateful_set.applications), app) ? {
        metadata = {
          generation = try(kubernetes_stateful_set.instance[app].metadata.0.generation,null)
          # A sequence number representing a specific generation of the desired state.

          name = try(kubernetes_stateful_set.instance[app].metadata.0.name,null)
          # Name of the stateful set, must be unique. Cannot be updated. More info: http://kubernetes.io/docs/user-guide/identifiers#names

          resourceVersion = try(kubernetes_stateful_set.instance[app].metadata.0.resource_version,null)
          # An opaque value that represents the internal version of this stateful set that can be used by clients to determine when stateful set has changed. Read more: https://github.com/kubernetes/community/blob/master/contributors/devel/sig-architecture/api-conventions.md#concurrency-control-and-consistency

          selfLink = try(kubernetes_stateful_set.instance[app].metadata.0.self_link,null)
          # A URL representing this stateful set.

          uid = try(kubernetes_stateful_set.instance[app].metadata.0.uid,null)
          # The unique in time and space value for this stateful set. More info: http://kubernetes.io/docs/user-guide/identifiers#uids

        }

        spec = {
          podManagementPolicy = try(kubernetes_stateful_set.instance[app].spec.0.pod_management_policy,null)
          # Controls how pods are created during initial scale up, when replacing pods on nodes, or when scaling down.

          revisionHistoryLimit = try(kubernetes_stateful_set.instance[app].spec.0.revision_history_limit,null)
          # The maximum number of revisions that will be maintained in the StatefulSet's revision history. The default value is 10.

        }

        spec_template_metadata = {
          generation = try(kubernetes_stateful_set.instance[app].spec.0.template.0.metadata.0.generation,null)
          # A sequence number representing a specific generation of the desired state.

          name = try(kubernetes_stateful_set.instance[app].spec.0.template.0.metadata.0.name,null)
          # Name of the stateful set, must be unique. Cannot be updated. More info: http://kubernetes.io/docs/user-guide/identifiers#names

          resourceVersion = try(kubernetes_stateful_set.instance[app].spec.0.template.0.metadata.0.resource_version,null)
          # An opaque value that represents the internal version of this stateful set that can be used by clients to determine when stateful set has changed. Read more: https://github.com/kubernetes/community/blob/master/contributors/devel/sig-architecture/api-conventions.md#concurrency-control-and-consistency

          selfLink = try(kubernetes_stateful_set.instance[app].spec.0.template.0.metadata.0.self_link,null)
          # A URL representing this stateful set.

          uid = try(kubernetes_stateful_set.instance[app].spec.0.template.0.metadata.0.uid,null)
          # The unique in time and space value for this stateful set. More info: http://kubernetes.io/docs/user-guide/identifiers#uids

        }

        spec_template_spec = {
          hostname = try(kubernetes_stateful_set.instance[app].spec.0.template.0.spec.0.hostname,null)
          # Specifies the hostname of the Pod If not specified, the pod's hostname will be set to a system-defined value.

          nodeName = try(kubernetes_stateful_set.instance[app].spec.0.template.0.spec.0.node_name,null)
          # NodeName is a request to schedule this pod onto a specific node. If it is non-empty, the scheduler simply schedules this pod onto that node, assuming that it fits resource requirements.

          serviceAccountName = try(kubernetes_stateful_set.instance[app].spec.0.template.0.spec.0.service_account_name,null)
          # ServiceAccountName is the name of the ServiceAccount to use to run this pod. More info: http://releases.k8s.io/HEAD/docs/design/service_accounts.md.

        }

        spec_template_spec_container = {
          imagePullPolicy = try(kubernetes_stateful_set.instance[app].spec.0.template.0.spec.0.container.0.image_pull_policy,null)
          # Image pull policy. One of Always, Never, IfNotPresent. Defaults to Always if :latest tag is specified, or IfNotPresent otherwise. Cannot be updated. More info: http://kubernetes.io/docs/user-guide/images#updating-images

          terminationMessagePolicy = try(kubernetes_stateful_set.instance[app].spec.0.template.0.spec.0.container.0.termination_message_policy,null)
          # Optional: Indicate how the termination message should be populated. File will use the contents of terminationMessagePath to populate the container status message on both success and failure. FallbackToLogsOnError will use the last chunk of container log output if the termination message file is empty and the container exited with an error. The log output is limited to 2048 bytes or 80 lines, whichever is smaller. Defaults to File. Cannot be updated.

        }

        spec_template_spec_container_resources_limits = {
          cpu = try(kubernetes_stateful_set.instance[app].spec.0.template.0.spec.0.container.0.resources.0.limits.0.cpu,null)
          memory = try(kubernetes_stateful_set.instance[app].spec.0.template.0.spec.0.container.0.resources.0.limits.0.memory,null)
        }

        spec_template_spec_container_resources_requests = {
          cpu = try(kubernetes_stateful_set.instance[app].spec.0.template.0.spec.0.container.0.resources.0.requests.0.cpu,null)
          memory = try(kubernetes_stateful_set.instance[app].spec.0.template.0.spec.0.container.0.resources.0.requests.0.memory,null)
        }

        spec_template_spec_init_container = {
          imagePullPolicy = try(kubernetes_stateful_set.instance[app].spec.0.template.0.spec.0.init_container.0.image_pull_policy,null)
          # Image pull policy. One of Always, Never, IfNotPresent. Defaults to Always if :latest tag is specified, or IfNotPresent otherwise. Cannot be updated. More info: http://kubernetes.io/docs/user-guide/images#updating-images

          terminationMessagePolicy = try(kubernetes_stateful_set.instance[app].spec.0.template.0.spec.0.init_container.0.termination_message_policy,null)
          # Optional: Indicate how the termination message should be populated. File will use the contents of terminationMessagePath to populate the container status message on both success and failure. FallbackToLogsOnError will use the last chunk of container log output if the termination message file is empty and the container exited with an error. The log output is limited to 2048 bytes or 80 lines, whichever is smaller. Defaults to File. Cannot be updated.

        }

        spec_template_spec_init_container_resources_limits = {
          cpu = try(kubernetes_stateful_set.instance[app].spec.0.template.0.spec.0.init_container.0.resources.0.limits.0.cpu,null)
          memory = try(kubernetes_stateful_set.instance[app].spec.0.template.0.spec.0.init_container.0.resources.0.limits.0.memory,null)
        }

        spec_template_spec_init_container_resources_requests = {
          cpu = try(kubernetes_stateful_set.instance[app].spec.0.template.0.spec.0.init_container.0.resources.0.requests.0.cpu,null)
          memory = try(kubernetes_stateful_set.instance[app].spec.0.template.0.spec.0.init_container.0.resources.0.requests.0.memory,null)
        }

        spec_template_spec_volume_azure_disk = {
          kind = try(kubernetes_stateful_set.instance[app].spec.0.template.0.spec.0.volume.0.azure_disk.0.kind,null)
          # The type for the data disk. Expected values: Shared, Dedicated, Managed. Defaults to Shared

        }

        spec_template_spec_volume_ceph_fs_secret_ref = {
          namespace = try(kubernetes_stateful_set.instance[app].spec.0.template.0.spec.0.volume.0.ceph_fs.0.secret_ref.0.namespace,null)
          # Name of the referent. More info: http://kubernetes.io/docs/user-guide/identifiers#names

        }

        spec_template_spec_volume_csi_controller_expand_secret_ref = {
          namespace = try(kubernetes_stateful_set.instance[app].spec.0.template.0.spec.0.volume.0.csi.0.controller_expand_secret_ref.0.namespace,null)
          # Name of the referent. More info: http://kubernetes.io/docs/user-guide/identifiers#names

        }

        spec_template_spec_volume_csi_controller_publish_secret_ref = {
          namespace = try(kubernetes_stateful_set.instance[app].spec.0.template.0.spec.0.volume.0.csi.0.controller_publish_secret_ref.0.namespace,null)
          # Name of the referent. More info: http://kubernetes.io/docs/user-guide/identifiers#names

        }

        spec_template_spec_volume_csi_node_publish_secret_ref = {
          namespace = try(kubernetes_stateful_set.instance[app].spec.0.template.0.spec.0.volume.0.csi.0.node_publish_secret_ref.0.namespace,null)
          # Name of the referent. More info: http://kubernetes.io/docs/user-guide/identifiers#names

        }

        spec_template_spec_volume_csi_node_stage_secret_ref = {
          namespace = try(kubernetes_stateful_set.instance[app].spec.0.template.0.spec.0.volume.0.csi.0.node_stage_secret_ref.0.namespace,null)
          # Name of the referent. More info: http://kubernetes.io/docs/user-guide/identifiers#names

        }

        spec_template_spec_volume_flex_volume_secret_ref = {
          namespace = try(kubernetes_stateful_set.instance[app].spec.0.template.0.spec.0.volume.0.flex_volume.0.secret_ref.0.namespace,null)
          # Name of the referent. More info: http://kubernetes.io/docs/user-guide/identifiers#names

        }

        spec_template_spec_volume_rbd = {
          keyring = try(kubernetes_stateful_set.instance[app].spec.0.template.0.spec.0.volume.0.rbd.0.keyring,null)
          # Keyring is the path to key ring for RBDUser. Default is /etc/ceph/keyring. More info: http://releases.k8s.io/HEAD/examples/volumes/rbd/README.md#how-to-use-it

        }

        spec_template_spec_volume_rbd_secret_ref = {
          namespace = try(kubernetes_stateful_set.instance[app].spec.0.template.0.spec.0.volume.0.rbd.0.secret_ref.0.namespace,null)
          # Name of the referent. More info: http://kubernetes.io/docs/user-guide/identifiers#names

        }

        spec_volume_claim_template_metadata = {
          generation = try(kubernetes_stateful_set.instance[app].spec.0.volume_claim_template.0.metadata.0.generation,null)
          # A sequence number representing a specific generation of the desired state.

          name = try(kubernetes_stateful_set.instance[app].spec.0.volume_claim_template.0.metadata.0.name,null)
          # Name of the persistent volume claim, must be unique. Cannot be updated. More info: http://kubernetes.io/docs/user-guide/identifiers#names

          resourceVersion = try(kubernetes_stateful_set.instance[app].spec.0.volume_claim_template.0.metadata.0.resource_version,null)
          # An opaque value that represents the internal version of this persistent volume claim that can be used by clients to determine when persistent volume claim has changed. Read more: https://github.com/kubernetes/community/blob/master/contributors/devel/sig-architecture/api-conventions.md#concurrency-control-and-consistency

          selfLink = try(kubernetes_stateful_set.instance[app].spec.0.volume_claim_template.0.metadata.0.self_link,null)
          # A URL representing this persistent volume claim.

          uid = try(kubernetes_stateful_set.instance[app].spec.0.volume_claim_template.0.metadata.0.uid,null)
          # The unique in time and space value for this persistent volume claim. More info: http://kubernetes.io/docs/user-guide/identifiers#uids

        }

        spec_volume_claim_template_spec = {
          storageClassName = try(kubernetes_stateful_set.instance[app].spec.0.volume_claim_template.0.spec.0.storage_class_name,null)
          # Name of the storage class requested by the claim

          volumeName = try(kubernetes_stateful_set.instance[app].spec.0.volume_claim_template.0.spec.0.volume_name,null)
          # The binding reference to the PersistentVolume backing this claim.

        }

      } : null

      storage_class = contains(keys(local.storage_class.applications), app) ? {
        metadata = {
          generation = try(kubernetes_storage_class.instance[app].metadata.0.generation,null)
          # A sequence number representing a specific generation of the desired state.

          name = try(kubernetes_storage_class.instance[app].metadata.0.name,null)
          # Name of the storage class, must be unique. Cannot be updated. More info: http://kubernetes.io/docs/user-guide/identifiers#names

          resourceVersion = try(kubernetes_storage_class.instance[app].metadata.0.resource_version,null)
          # An opaque value that represents the internal version of this storage class that can be used by clients to determine when storage class has changed. Read more: https://github.com/kubernetes/community/blob/master/contributors/devel/sig-architecture/api-conventions.md#concurrency-control-and-consistency

          selfLink = try(kubernetes_storage_class.instance[app].metadata.0.self_link,null)
          # A URL representing this storage class.

          uid = try(kubernetes_storage_class.instance[app].metadata.0.uid,null)
          # The unique in time and space value for this storage class. More info: http://kubernetes.io/docs/user-guide/identifiers#uids

        }

      } : null

      validating_webhook_configuration = contains(keys(local.validating_webhook_configuration.applications), app) ? {
        metadata = {
          generation = try(kubernetes_validating_webhook_configuration.instance[app].metadata.0.generation,null)
          # A sequence number representing a specific generation of the desired state.

          name = try(kubernetes_validating_webhook_configuration.instance[app].metadata.0.name,null)
          # Name of the validating webhook configuration, must be unique. Cannot be updated. More info: http://kubernetes.io/docs/user-guide/identifiers#names

          resourceVersion = try(kubernetes_validating_webhook_configuration.instance[app].metadata.0.resource_version,null)
          # An opaque value that represents the internal version of this validating webhook configuration that can be used by clients to determine when validating webhook configuration has changed. Read more: https://github.com/kubernetes/community/blob/master/contributors/devel/sig-architecture/api-conventions.md#concurrency-control-and-consistency

          selfLink = try(kubernetes_validating_webhook_configuration.instance[app].metadata.0.self_link,null)
          # A URL representing this validating webhook configuration.

          uid = try(kubernetes_validating_webhook_configuration.instance[app].metadata.0.uid,null)
          # The unique in time and space value for this validating webhook configuration. More info: http://kubernetes.io/docs/user-guide/identifiers#uids

        }

      } : null

      }
  }
}
