# Cloud Services - Red Hat OpenShift AI automation

This Ansible repository will stand up a basic Cloud Services OpenShift Cluster (either ROSA HCP or ARO) and deploy Red Hat OpenShift AI on it.

Along with the cluster itself and RHOAI it will also deploy

  - Authorino
  - Serverless
  - Service Mesh
  - GitOps
  - Pipelines
  - OpenShift Distributed Tracing Platform
  - Kiali
  - OpenShift ElasticSearch (when OCP < v4.15)
  - Node Feature Discovery
    - To discover and utilize hardware features available on cluster nodes
  - Nvidia GPU Graphics Driver
    - to enable GPU acceleration for AI/ML workloads on NVIDIA GPUs


## Installing

This has been tested on Mac OSX, but should also run fine on Linux

**Prerequisites**

- [ROSA cli](https://docs.openshift.com/rosa/rosa_install_access_delete_clusters/rosa_getting_started_iam/rosa-installing-rosa.html) (if ROSA)
- [AZ](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli) cli or [AWS](https://aws.amazon.com/cli/) cli
- Python 3
- [Terraform](https://developer.hashicorp.com/terraform/install) cli
- Organization / Account on [Red Hat Hybrid Cloud Console](https://console.redhat.com)
- Log into
    - aws or azure
    - `rosa login`


**ROSA HCP**

- `make ansible.venv`
- `make ansible.create.hcp`

**ARO**

- `make ansible.venv`
- `make ansible.create.aro`

**RHOAI on an existing cluster**

- `make ansible.venv`
- `make rhoai`


After the Ansible tasks have been sucessfully completed you should see the following output which will guide your next steps

```
ok: [localhost] =>
  msg: |-
    OpenShift info

    To log into the cluster run:

      oc login https://api.XXXX-rhoai.ya62.p3.openshiftapps.com:443 --username "admin" --password 'Passw0rd12345!'

    The Red Hat OpenShift AI url is:

      https://rhods-dashboard-redhat-ods-applications.apps.rosa.XXXXX-rhoai.ya62.p3.openshiftapps.com
```


## Cleanup

**ROSA HCP**

- `make ansible.destroy.hcp`

**ARO**

- `make ansible.destroy.aro`