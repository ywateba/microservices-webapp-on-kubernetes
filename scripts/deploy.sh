version=0.3.3


## For testing purposes on local cluster with kind

# kind load docker-image arywatt/udagram-api-feed:$version --name local
# kind load docker-image arywatt/udagram-api-user:$version --name local
# kind load docker-image arywatt/udagram-api-user:$version --name local
# kind load docker-image arywatt/reverseproxy:$version --name local

## deploy db with helm
# kubectl apply -f deploy/postgres/db-volumes.yaml
# helm install db bitnami/postgresql -f deploy/postgres/values.yaml



### To deploy on AWS EKS

# deploy config maps and secrets
kubectl apply -f deploy/config






# deploy apps
kubectl apply -f deploy/feed
kubectl apply -f deploy/user
kubectl apply -f deploy/reverseproxy
kubectl apply -f deploy/frontend


kubectl autoscale deployment backend-user --cpu-percent=60 --min=1 --max=3
kubectl autoscale deployment backend-feed --cpu-percent=60 --min=1 --max=3
