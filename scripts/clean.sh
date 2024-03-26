# deploy apps
kubectl delete services --all --namespace default
kubectl delete deployments --all --namespace default
# kind delete cluster -n local