AWS eks-action
=============
Interacts with your kubernetes EKS clusters using `kubectl` commands.
## Usage
### EKS Example
```yml
name: Deploy
on:
  push:
    branches:
      - develop
jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - name: Deploy
        uses: ravinayag/aws-eks-action@v0.1
        env:
          aws_access_key_id: ${{ secrets.AWS_ACCESS_KEY_ID }}
          aws_secret_access_key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
          aws_region: $AWS_REGION
          cluster_name: $EKS_CLUSTER_NAME
          ECR_REPOSITORY: $REPO_NAME
          K8S_DEPLOYMENT_NAME: $K8S_DEPLOYMENT_NAME
          K8S_NAMESPACE: $K8S_NAMESPACE
          IMAGE_TAG: ${{ github.sha }}
        with:
          args: |
            kubectl set image deployment/$K8S_DEPLOYMENT_NAME -n $K8S_NAMESPACE $K8S_DEPLOYMENT_NAME=$ECR_REPOSITORY:$IMAGE_TAG &&
            kubectl rollout status deployment/$K8S_DEPLOYMENT -n $K8S_NAMESPACE