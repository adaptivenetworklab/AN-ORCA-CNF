### 1.2 Setup OAI gNB-UE 🗼

* **Deployment Plan: F1 Split RAN**

    CU Interface

    | Purpose | Interface |   IP Address   | Port  |
    |:-------:|:---------:|:--------------:|:-----:|
    | N1 & N2 |   ens33   | 172.21.6.90/22 | 38472 |
    |   N3    |   ens33   | 172.21.8.91/22 | 2152  |
    |   F1    |   ens33   | 192.168.1.5/27 |  –-   |

    DU & RU Interface

    | Purpose | Interface |   IP Address   | Port  |
    |:-------:|:---------:|:--------------:|:-----:|
    |   F1    |   ens33   | 192.168.1.6/27 | 38472 |


    UE Interface

    | Purpose | Interface |   IP Address   | Port  |
    |:-------:|:---------:|:--------------:|:-----:|
    |  Net1   |   ens33   | 192.168.1.7/24 | 38472 |

* **Helm Step Installation**

    * Helm Configuration of OAI-CU and OAI-DU
    
       
        **Very Important** : To access internet in NR-UE the N6/SGI interface of UPF should be able access the internet. 

        OAI-CU requires the ip-address or service name of AMF. In case in AMF multus is used and N1/N2 interface is bind to multus interface, then please provide AMF ip-address. 

        > [Clone & see me for the detail CU/DU configuration](https://github.com/adaptivenetworklab/AN-OPEN-NETRA-VNF/tree/main/user_n/oai-e2e)

    * Deploy OAI-CU 
    
        ```bash
        cd user_n/oai-e2e/
        helm install oai-cu-user-n oai-cu/ --namespace user-n
        ```
        
        Check if the `oai-cu` is started 
        
        ```bash
        kubectl wait --for=condition=ready pod -l app.kubernetes.io/name=oai-cu-user-n --namespace user-n --timeout=3m
        ```
        
    * Deploy OAI-DU (RFSimulator)
    
         ```bash
        cd user_n/oai-e2e/
        helm install oai-du-user-n oai-du/ --namespace user-n
        ```
        
        Check if the `oai-du` is started 
        
        ```bash
        kubectl wait --for=condition=ready pod -l app.kubernetes.io/name=oai-du-user-n --namespace user-n --timeout=3m
        ```
        
    * Validation CU --> DU Connection
    
        To check if oai-du is connected to oai-cu, read the logs of cu and check F1 setup procedure was correct or not
        
        ```console
        kubectl logs --namespace user-n $(kubectl get pods --namespace user-n | grep oai-cu | awk '{print $1}') | grep 'Received F1 Setup Request'
        ```

        <details>
        <summary>The output is similar to:</summary>

        ```console
        838801.974035 [NR_RRC] I Received F1 Setup Request from gNB_DU 3584 (oai-du-rfsim) on assoc_id 189
        ```
        </details>

    * Validation CU --> AMF Connection
    
        To check if oai-cu is connected to amf, read the logs of amf and check N2 setup procedure was correct or not, 

        ```bash
        kubectl logs --namespace core-network $(kubectl get pods --namespace core-network | grep oai-amf| awk '{print $1}') | grep 'Connected'
        ```

        <details>
        <summary>The output is similar to:</summary>

        ```console
        Defaulted container "amf" out of: amf, init (init)
        [2023-12-12 10:49:54.879] [amf_app] [info] |      1      |    Connected     |        0xe000        |       oai-cu           |               001, 01              | 
        [2023-12-12 10:50:14.880] [amf_app] [info] |      1      |    Connected     |        0xe000        |       oai-cu           |               001, 01              | 
        [2023-12-12 10:50:34.880] [amf_app] [info] |      1      |    Connected     |        0xe000        |       oai-cu           |               001, 01              | 
        [2023-12-12 10:50:54.880] [amf_app] [info] |      1      |    Connected     |        0xe000        |       oai-cu           |               001, 01              | 
        [2023-12-12 10:51:14.880] [amf_app] [info] |      1      |    Connected     |        0xe000        |       oai-cu           |               001, 01              | 
        ```
        </details>

             
    * Deploy OAI-NR-UE RFSimulator

        Configure the UE Chart
        
        > [Clone & see me for the detail OAI-NR-UE configuration](https://github.com/adaptivenetworklab/AN-OPEN-NETRA-VNF/blob/main/user_n/oai-e2e/oai-nr-ue/values.yaml)
        
        Do helm install to start the deployment
        
        ```bash
        cd user_n/oai-e2e/
        helm install nr-ue oai-nr-ue-user-n/ --namespace oai-gnb-ue
        ```
        Check if the `oai-nr-ue` is started 
        
        ```bash
        kubectl wait --for=condition=ready pod -l app.kubernetes.io/name=oai-nr-ue-user-n --timeout=3m --namespace user-n
        ```
    * Validation UE got IP Address

        Now you are start reading the logs of amf, smf and other network function to understand the message flow. Once the pdu session establishment procedure is finished you will receive an ip-address. You can start performing some testing. 

        check if the UE received an ip-address

        ```bash
        kubectl exec -it -n user-n -c nr-ue $(kubectl get pods -n user-n | grep oai-nr-ue-user-n | awk '{print $1}') -- ifconfig oaitun_ue1 | grep -E '(^|\s)inet($|\s)' | awk '{print $2}'
        ```

        <details>
        <summary>The output is similar to:</summary>

        ```console
        12.1.1.100
        ```
        </details>

    * Performing E2E traffic testing
        
        Inside the nr-ue pod there is an extra tcdump container which can be use to perform traffic testing via iperf3 or 

        ``` bash
        kubectl exec -it -n user-n -c nr-ue $(kubectl get pods -n user-n | grep oai-nr-ue-user-n | awk '{print $1}') -- ping -I oaitun_ue1 -c4 google.fr
        PING google.fr (216.58.213.67) from 12.1.1.100 oaitun_ue1: 56(84) bytes of data.
        64 bytes from par21s18-in-f3.1e100.net (216.58.213.67): icmp_seq=1 ttl=117 time=27.0 ms
        64 bytes from par21s18-in-f3.1e100.net (216.58.213.67): icmp_seq=2 ttl=117 time=22.3 ms
        64 bytes from par21s18-in-f3.1e100.net (216.58.213.67): icmp_seq=3 ttl=117 time=24.1 ms
        64 bytes from par21s18-in-f3.1e100.net (216.58.213.67): icmp_seq=4 ttl=117 time=22.7 ms

        --- google.fr ping statistics ---
        4 packets transmitted, 4 received, 0% packet loss, time 3003ms
        rtt min/avg/max/mdev = 22.375/24.072/27.031/1.833 ms

        ## incase above doesn't work try with 8.8.8.8 instead of dns. If that works then probably you have't configure dns properly in SMF. 
        ```
