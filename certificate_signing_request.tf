resource "kubernetes_certificate_signing_request" "instance" { 
  depends_on = [null_resource.module_depends_on]
  for_each = local.certificate_signing_request.applications

  auto_approve = lookup(each.value, "autoApprove", null)
  # Type: bool   Optional  
  # Automatically approve the CertificateSigningRequest

  dynamic "metadata" { # Nesting Mode: list  Min Items : 1  Max Items : 1  
    for_each = contains(keys(each.value), "metadata") ? {item = each.value["metadata"]} : {}

    content {
      annotations = lookup(metadata.value, "annotations", null)
      # Type: ['map', 'string']   Optional  
      # An unstructured key value map stored with the certificate signing request that may be used to store arbitrary metadata. More info: http://kubernetes.io/docs/user-guide/annotations

      generate_name = lookup(metadata.value, "generateName", null)
      # Type: string   Optional  
      # Prefix, used by the server, to generate a unique name ONLY IF the `name` field has not been provided. This value will also be combined with a unique suffix. Read more: https://github.com/kubernetes/community/blob/master/contributors/devel/sig-architecture/api-conventions.md#idempotency

      labels = lookup(metadata.value, "labels", null)
      # Type: ['map', 'string']   Optional  
      # Map of string keys and values that can be used to organize and categorize (scope and select) the certificate signing request. May match selectors of replication controllers and services. More info: http://kubernetes.io/docs/user-guide/labels

      name = lookup(metadata.value, "name", null)
      # Type: string   Optional Computed 
      # Name of the certificate signing request, must be unique. Cannot be updated. More info: http://kubernetes.io/docs/user-guide/identifiers#names

    }
  }

  dynamic "spec" { # Nesting Mode: list  Min Items : 1  Max Items : 1  
    for_each = contains(keys(each.value), "spec") ? {item = each.value["spec"]} : {}

    content {
      request = lookup(spec.value, "request", null)
      # Type: string Required    
      # Base64-encoded PKCS#10 CSR data

      signer_name = lookup(spec.value, "signerName", null)
      # Type: string   Optional  
      # Requested signer for the request. It is a qualified name in the form: `scope-hostname.io/name`.If empty, it will be defaulted: 1. If it's a kubelet client certificate, it is assigned `kubernetes.io/kube-apiserver-client-kubelet`.2. If it's a kubelet serving certificate, it is assigned `kubernetes.io/kubelet-serving`.3. Otherwise, it is assigned `kubernetes.io/legacy-unknown`. Distribution of trust for signers happens out of band.You can select on this field using `spec.signerName`.

      usages = lookup(spec.value, "usages", null)
      # Type: ['set', 'string']   Optional  
      # allowedUsages specifies a set of usage contexts the key will be valid for. See: https://tools.ietf.org/html/rfc5280#section-4.2.1.3
      #      https://tools.ietf.org/html/rfc5280#section-4.2.1.12
      # Valid values are:
      #  "signing",
      #  "digital signature",
      #  "content commitment",
      #  "key encipherment",
      #  "key agreement",
      #  "data encipherment",
      #  "cert sign",
      #  "crl sign",
      #  "encipher only",
      #  "decipher only",
      #  "any",
      #  "server auth",
      #  "client auth",
      #  "code signing",
      #  "email protection",
      #  "s/mime",
      #  "ipsec end system",
      #  "ipsec tunnel",
      #  "ipsec user",
      #  "timestamping",
      #  "ocsp signing",
      #  "microsoft sgc",
      #  "netscape sgc"

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