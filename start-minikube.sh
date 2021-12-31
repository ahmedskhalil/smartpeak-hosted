#!/usr/bin/env bash
minikube start --hyperv-virtual-switch "smartpeak-area-switch" --v=4 --mount --mount-string="$HOME/dev/data:/data"
#minikube start --cpus max -p no-linkerd --namespace sp-no-linkerd --hyperv-virtual-switch "smartpeak-area-switch-no-linkerd" --v=4 --mount --mount-string="$HOME/dev/data:/data"
#minikube start --cpus max --memory 8192 -p sp-hosted --namespace sp-hosted-ns --hyperv-virtual-switch "smartpeak-storage-switch" --v=4 --mount --mount-string="$HOME/dev/data:/data" --driver=hyperkit

minikube addons enable ingress -p sp-hosted
minikube addons enable ingress-dns -p sp-hosted
minikube addons enable dashboard -p sp-hosted
minikube addons enable metrics-server -p sp-hosted

kubectl create namespace sp-hosted-ns

linkerd check --pre && linkerd install | kubectl apply -f - && linkerd check

kubectl get -n sp-hosted-ns deploy -o yaml | linkerd inject - | kubectl apply -f -

linkerd viz install | kubectl apply -f - && linkerd check

linkerd viz dashboard &

minikube  service smartpeak-hosted -p sp-hosted -n sp-hosted-ns