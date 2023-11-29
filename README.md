# oai-k8s

E2E virtualised OAI installation with cilium+hubble

## Prerequisites
Minikube

``` 
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
minikube start --cpus=8 --memory=32G
```
Kubectl

```
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
```

Helm

```
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh

helm repo add cilium https://helm.cilium.io/
helm plugin install https://github.com/ThalesGroup/helm-spray
```

Install Cilium and Hubble client
```

helm install cilium cilium/cilium --version 1.15.0-pre.2  \
  --namespace kube-system \
  --set prometheus.enabled=true \
  --set sctp.enabled=true \
  --set operator.prometheus.enabled=true \
  --set hubble.enabled=true \
  --set hubble.metrics.enableOpenMetrics=true \
  --set hubble.metrics.enabled="{dns,drop,tcp,flow:destinationContext=pod-name;sourceContext=pod-name;labelsContext=source_ip\,destination_ip}"


cilium hubble enable

kubectl scale deployment cilium-operator --replicas=1 -n kube-system

```
https://docs.cilium.io/en/stable/gettingstarted/k8s-install-default/#install-the-cilium-cli

https://docs.cilium.io/en/stable/gettingstarted/hubble_setup/


Make sure all cilium pods are running, hubble works and port forwarding is set up before proceeding. 

## Install OAI-CN

```
kubectl create ns oai-tutorial

cd oai-k8s/oai-cn5g-fed/charts/oai-5g-core/oai-5g-basic
helm spray --namespace oai-tutorial .

export AMF_POD_NAME=$(kubectl get pods --namespace oai-tutorial -l "app.kubernetes.io/name=oai-amf" -o jsonpath="{.items[0].metadata.name}")
```


## Install OAI-RAN

```
cd oai-k8s/oai-cn5g-fed/charts/oai-5g-ran

# Wait for each pod to come up and then install next chart
#Install CU
helm install oai-gnb-cu oai-gnb-cu/  --namespace oai-tutorial

#Install DU and pass CU IP addr
export f1cuip=$(kubectl get pods --namespace oai-tutorial -l "app.kubernetes.io/name=oai-gnb-cu" -o jsonpath="{.items[0].status.podIP}") && helm install --set config.f1cuIpAddress=$f1cuip oai-gnb-du oai-gnb-du/ --namespace oai-tutorial

# Check if SCTP works
kubectl logs -c amf $AMF_POD_NAME -n oai-tutorial | grep 'Sending NG_SETUP_RESPONSE Ok'
```

## Install OAI-UE(Sim)
```
helm install oai-nr-ue oai-nr-ue/ --namespace oai-tutorial

export NR_UE_POD_NAME=$(kubectl get pods --namespace oai-tutorial -l "app.kubernetes.io/name=oai-nr-ue,app.kubernetes.io/instance=oai-nr-ue" -o jsonpath="{.items[0].metadata.name}")

```

Try pinging to the internet

```
kubectl exec -it -n oai-tutorial -c nr-ue $NR_UE_POD_NAME -- ping -I oaitun_ue1 -c4 tu.berlin
```
## To uninstall all charts
helm uninstall -n oai-tutorial $(helm list -aq -n oai-tutorial)


## Hubble exporter

Configure hubble exporter and restart the pod

```
kubectl -n kube-system patch cm cilium-config --patch-file=/dev/stdin <<-EOF
data:
  hubble-export-file-path: "/var/run/cilium/hubble/events.log"
  hubble-export-allowlist: '{"source_pod":["oai-tutorial/"]},{"destination_pod":["oai-tutorial/"]}'
  hubble-export-denylist: '{"source_pod":["kube-system/"]},{"destination_pod":["kube-system/"]}'
  hubble-export-fieldmask: time source.identity source.namespace source.pod_name destination.identity destination.namespace destination.pod_name source_service destination_service l4 IP ethernet l7 Type node_name is_reply event_type verdict Summary
EOF

kubectl -n kube-system rollout restart ds/cilium
```

To view generated logs 
```
kubectl -n kube-system exec ds/cilium -- tail -f /var/run/cilium/hubble/events.log
```

## Notes
