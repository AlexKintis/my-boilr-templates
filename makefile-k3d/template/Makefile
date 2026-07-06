# --- 1. Core Configuration ---
SHELL          := /bin/bash
CLUSTER_NAME   := {{ ClusterName }}
KUBECONFIG     := {{ KubeconfigPath }}
export KUBECONFIG

NAMESPACE      := {{ Namespace }}
REGISTRY_NAME  := {{ RegistryName }}
REGISTRY_PORT  := {{ RegistryPort }}

# --- 2. Display Settings ---
INFO  := printf "\033[36m【INFO】\033[0m %s\n"
WARN  := printf "\033[33m【WARN】\033[0m %s\n"
ERR   := printf "\033[31m【ERR】\033[0m %s\n"

# Standard Makefile flags
MAKEFLAGS += --warn-undefined-variables
MAKEFLAGS += --no-builtin-rules

.PHONY: help cluster-up cluster-down kubectl-update-config deploy status test logs all

## help: Show this help menu
help:
	@echo "Usage: make [target] [variables]"
	@echo ""
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

## cluster-up: Bootstrap k3d registry, cluster, and export kubeconfig
cluster-up:
	$(INFO) "Preparing config directory for KUBECONFIG..."
	mkdir -p $(shell dirname $(KUBECONFIG))
	
	$(INFO) "Creating local k3d registry: $(REGISTRY_NAME) on port $(REGISTRY_PORT)..."
	k3d registry create $(REGISTRY_NAME) --port $(REGISTRY_PORT) || true
	
	$(INFO) "Bootstrapping k3d cluster: $(CLUSTER_NAME)..."
	k3d cluster create $(CLUSTER_NAME) \
		--registry-use $(REGISTRY_NAME):$(REGISTRY_PORT) \
		--port "8080:80@loadbalancer" \
		--api-port 127.0.0.1:6443 \
		--kubeconfig-update-default=false \
		--kubeconfig-switch-context=false \
		--wait || true
	
	## Update kubeconfig
	@$(MAKE) kubectl-update-config
	
	$(INFO) "Waiting for Kubernetes API server to become responsive..."
	@until kubectl cluster-info > /dev/null 2>&1; do sleep 2; done
	
	$(INFO) "Ensuring namespace '$(NAMESPACE)' exists..."
	kubectl create namespace $(NAMESPACE) --dry-run=client -o yaml | kubectl apply -f -

## cluster-down: Delete the k3d cluster and local registry
cluster-down:
	$(INFO) "Deleting cluster: $(CLUSTER_NAME)..."
	k3d cluster delete $(CLUSTER_NAME) || true
	
	$(INFO) "Deleting registry: $(REGISTRY_NAME)..."
	k3d registry delete $(REGISTRY_NAME) || true
	
	$(INFO) "Removing local kubeconfig: $(KUBECONFIG)..."
	rm -f $(KUBECONFIG)

## kubectl-update-config: update kubeconfig for kubectl
kubectl-update-config:
	$(INFO) "Updating local kubeconfig..."
	k3d kubeconfig get $(CLUSTER_NAME) > $(KUBECONFIG)

## deploy: Deploy application manifests or Helm charts into the cluster
deploy:
	$(INFO) "Deploying Kubernetes resources into namespace '$(NAMESPACE)'..."
	@if [ -d "./k8s" ]; then \
		kubectl apply -f ./k8s/ -n $(NAMESPACE); \
	elif [ -f "./Chart.yaml" ]; then \
		helm upgrade --install $(CLUSTER_NAME) . -n $(NAMESPACE) --create-namespace; \
	else \
		$(WARN) "No manifests found in ./k8s and no Helm chart found in root. Define your deployment logic here."; \
	fi

## status: Check pods, services, and ingress resources in the cluster
status:
	$(INFO) "Checking cluster status in namespace '$(NAMESPACE)'..."
	kubectl get all,ingress -n $(NAMESPACE)

## test: Run validation or integration tests against the deployed resources
test:
	$(INFO) "Running checks and tests..."
	@# Insert integration testing commands here (e.g. curl endpoints, run helm test, etc.)
	kubectl get pods -n $(NAMESPACE)

## logs: Follow logs of all containers in the configured namespace
logs:
	$(INFO) "Following logs in namespace '$(NAMESPACE)'..."
	kubectl logs -n $(NAMESPACE) --all-containers=true -f --tail=100

## all: Complete workflow: spin up cluster, deploy, run tests, and check status
all: cluster-up deploy test status
