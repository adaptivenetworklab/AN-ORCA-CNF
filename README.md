## OpenNetra: Description

![netra dash](https://hackmd.io/_uploads/Bk2avI4ST.jpg)


Open Netra, standing for Open Network Training, is a comprehensive solution designed to facilitate the training, simulation, and management of 5G networks. The primary functionalities of Open Netra include E2E (End-to-End) 5G dashboard simulation and RAN (Radio Access Network) monitoring & configuration. The entire infrastructure is built on a foundation of virtualized network functions, specifically implemented as OpenAirInterface containers, orchestrated and managed by Kubernetes.

## 1. CNF Infra Setup 💻


### 1.1 Setup OAI Core ☁️

* **Helm Step Installation**
    
    I installed the mini core network setup. Because it reduces unnecessary network function.
    * Clone Core 5G Repository 
    
        ```
        git clone https://github.com/adaptivenetworklab/AN-OPEN-NETRA-VNF
        ```
    * Create Namespace named `oai-core`
        ```
        kubectl create ns oai-core
        ```
        
    * Helm Custom Chart For Core Network Deployment
    
        > [Clone & See me for the details](https://github.com/adaptivenetworklab/AN-OPEN-NETRA-VNF/tree/main/oai-5g-core)
    
    * Helm install with related chart
        ```
        cd AN-OPEN-NETRA-VNF/oai-5g-core/
        helm install mini oai-5g-mini/ --namespace oai-core
        ```
    * Wait until all the pods are up and running 

        ![image](https://hackmd.io/_uploads/r1rUlt1Y6.png)


* **Configuring PhpMyAdmin for Subscriber Management**
    * Deploy the secret first
    
        ```
        kubectl apply -f phypmyadmin/secret.yaml
        ```
    * Deploy the rest of the manifest
    
        ```
        kubectl apply -f phypmyadmin/
        ```
    * PMA Dashboard
        ![image](https://hackmd.io/_uploads/Syx8WFkYa.png)

    
### 1.2 Setup OAI gNB-UE 🗼

* **Helm Step Installation**

    > Wait for each pod to come up and then install next chart

    * Helm Custom Chart For Single CU/DU Deployment
    
        > [Clone & See me for the details](https://github.com/adaptivenetworklab/AN-OPEN-NETRA-VNF/tree/main/oai-e2e)

    * Install Centralized Unit (DU)
    
        ```
        helm install oai-gnb-cu/ . --namespace oai-gnb-ue
        ```
        
    * Install Centralized Unit (DU)
    
        ```
        helm install gnb-cu oai-gnb-du/ --namespace oai-gnb-ue
        ```
        
    * Install User Equipment (UE)
    
        ```
        helm install nr-ue oai-nr-ue/ --namespace oai-gnb-ue
        ```
