docker login
version=0.3.3

docker push arywatt/udagram-api-feed:$version
docker push arywatt/udagram-api-user:$version
docker push arywatt/reverseproxy:$version
docker push arywatt/udagram-frontend:$version