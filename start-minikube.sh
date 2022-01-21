#!/usr/bin/env bash

minikube start --cpus 4 --memory 6144 -p sp-hosted --namespace sp-hosted-ns --hyperv-virtual-switch "smartpeak-storage-switch" --v=4 --mount --mount-string="/sample-data:/data" --driver=hyperkit
minikube addons enable ingress -p sp-hosted && minikube addons enable ingress-dns -p sp-hosted && minikube addons enable dashboard -p sp-hosted && minikube addons enable metrics-server -p sp-hosted

kubectl create namespace sp-hosted-ns
./helm-install.sh

minikube -p sp-hosted dashboard

curl -fsL https://run.linkerd.io/install | sh
linkerd check --pre && linkerd install | kubectl apply -f - && linkerd check
kubectl get -n sp-hosted-ns deploy -o yaml | linkerd inject - | kubectl apply -f -
linkerd viz install | kubectl apply -f - && linkerd check
linkerd viz dashboard &

minikube  service smartpeak-hosted -p sp-hosted -n sp-hosted-ns