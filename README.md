# Orchestrator
## Overview
- The main goal of this project is to use Kubernetes to deploy and manage a microservices architecture built on top of a K3s cluster. It includes a variety of services, such as databases, applications, and an API gateway. The application images for this project are derived from my earlier work, "[crud-master-py](https://github.com/ozennou/crud-master-py)," which provided a strong foundation for developing these services. Through this project, I have gained a thorough understanding of Kubernetes resources, including StatefulSets, services, deployments, Horizontal Pod Autoscalers (HPA), Persistent Volumes (PV), Persistent Volume Claims (PVC), and secrets. The project also emphasizes the significance of secure credential handling using Kubernetes secrets and infrastructure as code (IaC). The outcome is a robust and scalable microservices environment that has enhanced my ability to tackle real-world DevOps challenges.

- The application deployment process involves setting up the api-gateway and inventory-app as Kubernetes deployments, with automatic horizontal scaling based on CPU consumption. Both applications are configured with a minimum replication of 1 and can scale up to 3 replicas when CPU usage exceeds 60%. The billing-app, however, is deployed as a StatefulSet to ensure stable and persistent identity across pods. Similarly, the databases are also deployed as StatefulSets within the K3s cluster, with persistent volumes configured to maintain data integrity even when containers are moved across the infrastructure.

## Argo CD
- Argo CD is a declarative, GitOps continuous delivery tool for Kubernetes. It automates the deployment of applications to Kubernetes clusters by tracking changes in Git repositories and synchronizing those changes to the cluster.

![ArgoCd_Screenshot](./Argocd_ScreenShot.png)

- When the change detected it automatically update the cluster with the new state, and also If an application deployment fails or causes issues, Argo CD can easily roll back to a previous, stable version.:

![ArgoCd_Screenshot2](./Argocd_ScreenShot2.png)