
version=0.3.3

docker build  -t arywatt/udagram-api-feed:$version ./udagram-api-feed
docker build  -t arywatt/udagram-api-user:$version ./udagram-api-user
docker build  -t arywatt/udagram-frontend:$version ./udagram-frontend
docker build  -t arywatt/reverseproxy:$version ./udagram-reverse-proxy