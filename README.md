# Microservice  on Kubernetes

This project showcases microservices stack deployed on a kubernetes cluster. The database is deployed on RDS.
## Project structure

  - deploy : kubernetes deployments files
  - scripts: help scripts
  - udagram-api-user: user microservice
  - udagram-api-feed: feeds microservice
  - udagram-reverse-proxy: proxy microservice
  - udagram-frontend: frontend
  - screenshots:  screenshot folder

## Project requirements
### Local Environment
1. Python Environment - run Python 3.6+ applications and install Python dependencies via `pip`
2. Docker CLI - build and run Docker images locally
3. `kubectl` - run commands against a Kubernetes cluster
4. `helm` - apply Helm Charts to a Kubernetes cluster
5. `kind` - to try kubernetes in local (optional)

### Remote Resources
1. CircleCi Account
2. GitHub - pull and clone code

## How to use the project

Push your code to github and check that that the images are built and pushed to Dockerhub, then deploy it on Kubernetes

## How to deploy the project

First connect to your cluster

```bash
aws eks --region us-east-1 update-kubeconfig --name your_eks_cluster_name

```

1. Deploy services

```bash
    ./scripts/deploy.sh
    ./expose_services.sh

```



2. Check the deployements status with the follwowinfg commands



```bash
helm status <service_name>
kubectl get svc
kubectl get pods
kubectl get svc  <service_name>
kubectl get deployment  <deployment_name>
```

3. To cleanup

To remove everything
```bash
./scripts/clean.sh
```

Don't forget to remove the infratructure on Aws to avoid unwanted costs




## License


This project is licensed under the MIT License - see the [LICENSE](LICENSE.txt) file for details.
