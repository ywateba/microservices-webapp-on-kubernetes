#kubectl expose deployment reverseproxy --type=LoadBalancer --name=publicreverseproxy
kubectl expose deployment frontend --type=LoadBalancer --name=publicfrontend