# K3d Kubernetes Testing Environment Template

This template provides a standardized local Kubernetes testing "entry point" using [k3d](https://k3d.io/). It automates local cluster creation, registry configuration, configuration export, deployment scaffolding, and verification.

---

## 🚀 Features

- **Automated Local Registry**: Provisions a local container registry `{{ RegistryName }}` on port `{{ RegistryPort }}` to test local image builds without pushing to external registries.
- **Isolated Kubeconfig**: Avoids polluting default `~/.kube/config` by exporting to a custom path (`{{ KubeconfigPath }}`).
- **Flexible Deployment**: Supports automatically applying YAML manifests inside a `./k8s` directory or deploying local Helm charts.
- **Unified lifecycle**: Single commands to stand up (`make cluster-up`), inspect (`make status`), tail logs (`make logs`), and clean up (`make cluster-down`).

---

## 🛠️ Folder Structure

Once generated, your project directory should look like this:
```
.
├── Makefile             # Cluster lifecycle automation
├── README.md            # Project runbook
├── k8s/                 # (Optional) Place your Kubernetes manifests here
└── Chart.yaml           # (Optional) Helm Chart config
```

---

## 📖 Usage Runbook

### 1. Bootstrapping the Cluster
To create the local registry, cluster, namespace, and configure your CLI environment, execute:
```bash
make cluster-up
```

### 2. Deploying Your Project
The Makefile automatically detects your configuration and applies it:
- If a `./k8s` directory exists, it runs `kubectl apply -f ./k8s/`.
- If a Helm chart exists in the root, it runs `helm upgrade --install`.

To deploy changes:
```bash
make deploy
```

### 3. Verification & Checks
To inspect pods, deployments, and services:
```bash
make status
```

To tail resource container logs:
```bash
make logs
```

### 4. Teardown
To completely delete the cluster, local registry, and reset your kubeconfig path:
```bash
make cluster-down
```
