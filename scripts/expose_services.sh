
type=LoadBalancer

kubectl expose deployment reverseproxy --type="$type" --name=publicreverseproxy
kubectl expose deployment frontend --type="$type" --name=publicfrontend


