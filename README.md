# Argo CD with dragonflyDB
The Purpose of this repository is to demonstrate how Argo CD can self manage itself using the **app of apps pattern**. Once the cluster is fully bootstrapped, Argo CD and a full Prometheus monitoring stack will be deployed. Dashboards and alerts are configured to monitor Argo CD. An Application `guestbook-not-synced` should be in the **Missing** and `OutOfSync` status by default. One can visit the Prometheus or Alertmanager application to view the triggered alerts.  Clicking the `SYNC` button in the Argo CD UI for the `guestbook-not-synced` Application will sync the Application and clear the alerts.  

## Bootstrapping the Demo
Have a k3d Kubernetes cluster up and running.

1. `k3d cluster create argo  -p "80:80@loadbalancer" -p "443:443@loadbalancer"`

1. Clone this repository and switch to the root folder of the repo

2. Create the argocd namespace
```bash
$ kubectl create ns argocd
```
3. Install a version of Argo CD on your cluster
```bash
$ kubectl -n argocd apply -f https://raw.githubusercontent.com/argoproj/argo-cd/release-2.9/manifests/install.yaml
 ```
4. Once the deployment is complete, apply the bootstrap
```bash
$ kubectl apply -f bootstrap.yaml
```

## Accessing the UIs
Once the bootstrap is synced, Argo CD and the Prometheus monitoring stack will be accessible through the UI.

### Argo CD
Anonymous access has been enabled with `admin` privileges for demonstration purposes

https://argocd.localhost


### Prometheus
http://prometheus.localhost

### Alertmanager
http://alertmanager.localhost

### Grafana
http://grafana.localhost 

default user:password `admin:admin`