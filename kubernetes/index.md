Kubernetes
==========

Architecture
------------

Parts of Kubernetes architecture:

### Node

The worker machine on which K8s is installed and on which the containerised application runs. Can be called "worker node" or just "node"; formerly called "minion" or "slave" by some.

### Pod

The individual components which make up a node. It is the smallest object within a K8s instance. A node may have many pods in it, but never more than one of the same kind. Typically, a node will have a primary pod, and if there are others they are helper pods.

### Cluster

A group of nodes. A cluster must have at least one node.

### Control plane

Formerly called "master node", this node manages the cluster. It is responsible for the actual orchestration of the worker nodes.

#### kube-apiserver

The frontend for K8s (command line, uses, devices).

#### etcd

The distributed, reliable key-value store used to store all data used to manage cluster. Implements logs, ensures there are no conflicts between nodes.

#### kube-scheduler

Distributes work or containers across multiple nodes.

#### kube-controller-manager

The "brain" behind orchestration; notices and responds when nodes / containers / endpoints go down ??

#### cloud-controller-manager

The "brain" behind orchestration; notices and responds when nodes / containers / endpoints go down ??





- container runtime: underlying software that runs containers (e.g. Docker)
- kubelet: agent that runs on each node in cluster, ensures that containers are running on nodes as expected
