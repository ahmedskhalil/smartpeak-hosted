#!/usr/bin/env bash
minikube start --hyperv-virtual-switch "smartpeak-area-switch" --v=4 --mount --mount-string="$HOME/dev/data:/data"