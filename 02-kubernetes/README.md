```bash
kubectl [command] [TYPE] [NAME] [flags]
```
basic command

- kubectl 
    
    > log Print the logs for a container in a pod.
- kubectl describe 
    
    > Display the detailed state of one or more resources.
- kubectl apply 
    
    > Apply a configuration change to a resource from a file or stdin.
- kubectl delete 
    
    > Delete resources either from a file, stdin, or specifying label selectors names, resource selectors, or resources.


Forward one or more local ports to a pod
```bash
kubectl port-forward TYPE/NAME [options] [LOCAL_PORT:]REMOTE_PORT [...[LOCAL_PORT_N:]REMOTE_PORT_N]
```


## Pod
Pod: a pod is a single instance of an application, the smallest object that you can create in  k8s

## Node
Kubernetes runs your workload by placing containers into Pods to run on Nodes. A node may be a virtual or physical machine, depending on the cluster. Each node is managed by the control plane and contains the services necessary to run Pods.
### Master node  
schedule pod, monitor, re-schedule/re-start pods, join a new node

4 process run on every master node:

- Api server: as a cluster gateway, do authenticate
- scheduler: watches for newly created Pods with no assigned node, and selects a node for them to run on.
- Controller manager: detects cluster state changes
- Etc: data store
### Worker node
worker nods do the actual work
- Each node has multiple Pods on it
- 3 processes must be installed on every node
  - container runtime
  - Kubelet interacts with both - the container and node, kubelet start the pod with a container inside
  - Kube proxy: maintains network rules on nodes.
## Deployment
A Deployment provides declarative updates for Pods and ReplicaSets.

You describe a desired state in a Deployment, and the Deployment Controller changes the actual state to the desired state at a controlled rate. You can define Deployments to create new ReplicaSets, or to remove existing Deployments and adopt all their resources with new Deployments

## Service
> An abstract way to expose an application running on a set of [Pods](https://kubernetes.io/docs/concepts/workloads/pods/) as a network service.
>
> Kubernetes gives Pods their own IP addresses and a single DNS name for a set of Pods, and can load-balance across them.

 an object   like pods, listen a port on the node and forward the request to a port on the pod

Service types:

- NodePort
- ClusterIp
- LoadBalancer

## Ingress
An API object that manages external access to the services in a cluster, typically HTTP.

Ingress may provide load balancing, SSL termination and name-based virtual hosting.


## ReplicaSet 
A ReplicaSet's purpose is to maintain a stable set of replica Pods running at any given time. As such, it is often used to guarantee the availability of a specified number of identical Pods.

A ReplicaSet ensures that a specified number of pod replicas are running at any given time. However, a Deployment is a higher-level concept that manages ReplicaSets and provides declarative updates to Pods along with a lot of other useful features. Therefore, we recommend using Deployments instead of directly using ReplicaSets, unless you require custom update orchestration or don't require updates at all.

## Namespace 
Namespaces are intended for use in environments with many users spread across multiple teams, or projects. For clusters with a few to tens of users, you should not need to create or think about namespaces at all. Start using namespaces when you need the features they provide.

