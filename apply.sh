#! bin/bash

cd aws
terraform init
terraform apply --auto-approve
cd ..

cd kubernetes
aws eks update-kubeconfig --name eks-cluster-dl
kubectl apply -f tech_ingress.yaml
kubectl apply -f tech_deploy.yaml
kubectl apply -f tech_alertManager.yaml
kubectl apply -f tech_alertTemplate.yaml
kubectl apply -f tech_dashboard.yaml
kubectl apply -f tech_template.yaml
kubectl apply -f tech_configMap.yaml
kubectl apply -f tech_clusterRole.yaml
kubectl apply -f tech_clusterRoleBinding.yaml
kubectl apply -f tech_serviceAccount.yaml
kubectl apply -f tech_secret.yaml
kubectl apply -f tech_daemonset.yaml
kubectl apply -f tech_service.yaml
kubectl apply -f tech_deployments.yaml
helm upgrade --install loki grafana/loki-stack --values tech_values.yaml --debug