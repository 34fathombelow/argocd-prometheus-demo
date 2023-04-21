# Argo CD Prometheus App of Apps Demo
The Purpose of this repository is to demonstrate how Argo CD can self manage itself using the **app of apps pattern**. Once the cluster is fully bootstrapped, Argo CD and a full Prometheus monitoring stack will be deployed. Dashboards and alerts are configured to monitor Argo CD. An Application `guestbook-not-synced` should be in the **Missing** and `OutOfSync` status by default. One can visit the Prometheus or Alertmanager application to view the triggered alerts.  Clicking the `SYNC` button in the Argo CD UI for the `guestbook-not-synced` Application will sync the Application and clear the alerts.  

## Bootstrapping the Demo
Have a test Kubernetes cluster up and running. (Kind, K3S, etc..)

1. Clone this repository and switch to the root folder of the repo

2. Create the argocd namespace
```bash
$ kubectl create ns argocd
```
3. Install a version of Argo CD on your cluster
```bash
$ kubectl -n argocd apply -f https://raw.githubusercontent.com/argoproj/argo-cd/release-2.6/manifests/install.yaml
 ```
4. Once the deployment is complete, apply the bootstrap
```bash
$ kubectl apply -f bootstrap.yaml
```

## Accessing the UIs
Once the bootstrap is synced, Argo CD and the Prometheus monitoring stack will be accessible through the UI. They can easily be accessible by using `kubectl port-forward`

### Argo CD
```bash
$ kubectl -n argocd port-forward svc/argocd-server 4000:443
```
You can then access via http://localhost:4000 anonymous access has been enabled with `admin` privileges for demonstration purposes

### Prometheus
```bash
$ kubectl -n monitoring port-forward svc/kube-prometheus-stack-prometheus 4001:9090
```
You can then access via http://localhost:4001

### Alertmanager
```bash
$ kubectl -n monitoring port-forward svc/kube-prometheus-stack-alertmanager 4002:9093
```
You can then access via http://localhost:4002

### Grafana
```bash
$ kubectl -n monitoring port-forward svc/kube-prometheus-stack-grafana 4003:80
```
You can then access via http://localhost:4003 and use the default user:password of `admin:argo-demo`