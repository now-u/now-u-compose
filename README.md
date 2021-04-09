# now-u-compose
k3s digital ocean deployment of now-u services.


## Master server

`make k3s-install SERVER_IP=x.x.x.x`

## Join nodes

`make k3s-join NODE_IP=x.x.x.x SERVER_IP=x.x.x.x`

## Using Kubectl

1. Install kubectl
2. `export KUBECONFIG=\`pwd\`/kubeconfig`

## Installing apps

### cert-manager

```
arkade install cert-manager
kubectl apply -f cert-manager/letsencrypt.yml
```

### nginx-ingress

```
arkade install nginx-ingress 
```
