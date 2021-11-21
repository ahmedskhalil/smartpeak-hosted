#!/usr/bin/env bash
minikube start --hyperv-virtual-switch "smartpeak-area-switch" --v=4 --mount --mount-string="$HOME/dev/data:/data"
#minikube start --cpus max -p no-linkerd --namespace sp-no-linkerd --hyperv-virtual-switch "smartpeak-area-switch-no-linkerd" --v=4 --mount --mount-string="$HOME/dev/data:/data"
#minikube start --cpus max -p sp-hosted --namespace sp-hosted-ns --hyperv-virtual-switch "smartpeak-storage-switch" --v=4 --mount --mount-string="$HOME/dev/data:/data"

#kubectl get -n sp-hosted-ns deploy -o yaml | linkerd inject - | kubectl apply -f -