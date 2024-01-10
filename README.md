## OpenNetra: Project Description

![netra dash](https://hackmd.io/_uploads/Bk2avI4ST.jpg)


Open Netra, standing for Open Network Training, is a comprehensive solution designed to facilitate the training, simulation, and management of 5G networks. The primary functionalities of Open Netra include E2E (End-to-End) 5G dashboard simulation and RAN (Radio Access Network) monitoring & configuration. The entire infrastructure is built on a foundation of virtualized network functions, specifically implemented as OpenAirInterface containers, orchestrated and managed by Kubernetes.

## 1. CNF Infrastructure Setup 💻


### 1.1 Setup OAI Core ☁️

* **Helm Step Installation**
    * Clone Core 5G Repository 
    
        ```
        git clone https://gitlab.hhi.fraunhofer.de/wn-ina/oai-k8s.git
        ```
    * Create Namespace named `oai`
        ```
        kubectl create ns oai
        ```
    * Helm install with related chart
        ```
        cd oai-k8s/oai-cn5g-fed/charts/oai-5g-core/oai-5g-basic
        helm spray --namespace oai .
        ```
    * Wait until all the pods are up and running 

        ![image](https://hackmd.io/_uploads/rJKaT8EHT.png)

* **Kustomize Way**
    > ON PROGRESS...
    
### 1.2 Setup OAI RAN 🗼

* **Helm Step Installation**

    > Wait for each pod to come up and then install next chart

    * Install Centralized Unit (CU)
    
        ```
        helm install oai-gnb-cu . --namespace oai
        ```

    * Install Distributed Unit (DU) and pass CU IP addr
        ```
        export f1cuip=$(kubectl get pods --namespace oai -l "app.kubernetes.io/name=oai-gnb-cu" -o jsonpath="{.items[0].status.podIP}") && helm install --set config.f1cuIpAddress=$f1cuip oai-gnb-du . --namespace oai
        ```
        
    * Pass another 5G Core component value

        ```
        export SMF_POD_NAME=$(kubectl get pods --namespace oai -l "app.kubernetes.io/name=oai-smf" -o jsonpath="{.items[0].metadata.name}")
        ```

        ```
        export AMF_POD_NAME=$(kubectl get pods --namespace oai -l "app.kubernetes.io/name=oai-amf" -o jsonpath="{.items[0].metadata.name}")
        ```
          
        ```
        export SPGWU_TINY_POD_NAME=$(kubectl get pods --namespace oai -l "app.kubernetes.io/name=oai-spgwu-tiny" -o jsonpath="{.items[0].metadata.name}")
        ```
        
        ```
        export AMF_eth0_POD_IP=$(kubectl get pods --namespace oai -l "app.kubernetes.io/name=oai-amf" -o jsonpath="{.items[0].status.podIP}")
        ```
    * Check if SCTP works
        ```
        kubectl logs -c amf $AMF_POD_NAME -n oai-tutorial | grep 'Sending NG_SETUP_RESPONSE Ok'
        ```
* **Kustomize Way**
    > ON PROGRESS...
    

### 1.4 Setup OAI UE 🤳

* **Helm Step Installation**

    * Install User Equipment (UE)
    
        ```
        helm install oai-nr-ue oai-nr-ue/ --namespace oai-tutorial
        ```
    * Pass UE value to the variable
        ```
        export NR_UE_POD_NAME=$(kubectl get pods --namespace oai -l "app.kubernetes.io/name=oai-nr-ue,app.kubernetes.io/instance=oai-nr-ue" -o jsonpath="{.items[0].metadata.name}")
        ```
    * Try pinging to the internet
        ```
        kubectl exec -it -n oai-tutorial -c nr-ue $NR_UE_POD_NAME -- ping -I oaitun_ue1 -c4 google.com
        ```
* **Kustomize Way**
    > ON PROGRESS...
    

### 1.5 Setup E2E Connection

* **Validation Process**

    > ON PROGRESS...
