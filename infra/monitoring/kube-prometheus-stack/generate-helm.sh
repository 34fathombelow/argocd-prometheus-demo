#!/usr/bin/bash

helm dependency update ./chart

 helm template kube-prometheus-stack ./chart \
 --values ./chart/values.yaml \
 --include-crds \
 --namespace monitoring \
 > ./resources/upstream.yaml