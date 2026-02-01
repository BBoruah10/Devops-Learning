# 📦 Helm – Notes & Commands (DevOps Ready)

Helm is a package manager for Kubernetes that helps define, install, upgrade, and manage applications using charts.

Helm simplifies:
- Kubernetes YAML management
- Versioned deployments
- Rollbacks
- Environment-based configuration

---

## 🧠 Key Helm Concepts

### Chart
A Helm package containing Kubernetes manifests and templates.

### Release
A running instance of a chart in a Kubernetes cluster.

### values.yaml
Configuration file that controls chart behavior.

### Templates
Kubernetes YAML files with Helm variables.

### Revision
Each Helm upgrade creates a new version of a release.

---

## Chart Operations

### Create chart

helm create mychart


### Install local chart

helm install myapp ./mychart

### Install from repo

helm install myapp bitnami/nginx

## List releases

helm list

## 🔁 Upgrades & Rollbacks

helm upgrade myapp ./mychart
helm history myapp
helm rollback myapp 1(revision)

## 📄 Debugging & Preview

helm template ./mychart
helm install myapp ./mychart --dry-run
helm get manifest myapp
helm get values myapp
helm lint ./mychart

## ⚙ Values Management
helm install myapp ./mychart --set replicaCount=3
helm install myapp ./mychart -f dev-values.yaml

🔐 Helm & Secrets

## Create secret:

kubectl create secret generic db-secret \
  --from-literal=password=secret123


Inject into template:

valueFrom:
  secretKeyRef:
    name: db-secret
    key: password

## 📦 Common Template Variables
{{ .Values.replicaCount }}
{{ .Values.image.repository }}
{{ .Values.image.tag }}
{{ .Release.Name }}
{{ .Chart.Name }}

## 🔄 Production Helm Workflow

Edit values.yaml
   ↓
helm upgrade
   ↓
Rolling update in Kubernetes
   ↓
helm rollback on failure

## ❌ Uninstall Release

helm uninstall myapp

## ✅ Best Practices

Use structured values.yaml

Never hardcode secrets

Always upgrade, never reinstall

Preview before deploy

Keep charts reusable

## 🎯 Why Helm is Used in Companies

✔ Versioned deployments
✔ Safe upgrades
✔ One-command rollback
✔ Clean configuration
✔ CI/CD ready

## 🚀 Useful Add-ons

Preview changes (with diff plugin):

helm diff upgrade myapp ./mychart

## 📚 Typical Use Cases

Microservices deployments

Multi-environment apps

Automated CI/CD pipelines

Production Kubernetes workloads

