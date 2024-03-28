
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml

kubectl autoscale deployment backend-user --cpu-percent=60 --min=1 --max=3
kubectl autoscale deployment backend-feed --cpu-percent=60 --min=1 --max=3
