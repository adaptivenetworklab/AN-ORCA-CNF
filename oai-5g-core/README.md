### 1.1 Setup OAI Core ☁️

* **Deployment Plan**

    Core Multi Interface

    | Purpose  | Interface |   IP Address    | Node |
    |:--------:|:---------:|:---------------:|:----:|
    | AMF - N2 |   ens33   | 172.21.6.94/22  |  3   |
    | UPF - N3 |   ens33   | 172.21.8.95/22  |  3   |
    | UPF - N4 |   ens33   | 192.168.24.2/24 |  3   |
    | UPF - N6 |   ens33   | 192.168.22.2/24 |  3   |
    | SMF - N6 |   ens33   | 192.168.24.3/24 |  3   |

* **Helm Step Installation**
    
    I installed the basic core network setup. Because it support to utilize **external database** for network function.
    * Clone Core 5G Repository 
    
        ```bash
        git clone https://github.com/adaptivenetworklab/AN-OPEN-NETRA-VNF
        ```
    * Create Namespace named `core-network`
        ```bash
        kubectl create ns core-network
        ```
        
    * Helm Custom Chart For Core Network Deployment
    
        ```console
        # Core Network Chart
        cd AN-OPEN-NETRA-VNF/oai-5g-core/
        mysql  oai-5g-advance  oai-5g-basic  oai-5g-mini  oai-amf  oai-ausf  oai-nrf  oai-nssf  oai-smf  oai-traffic-server  oai-udm  oai-udr  oai-upf
        helm dependency update
        
        # RAN Chart
        ls AN-OPEN-NETRA-VNF/user_n/oai-e2e/
        oai-cu  oai-du  oai-nr-ue
        helm dependency update
        ```
        
        Starting version `2.0.0` of OAI 5G Core network functions their configuration will be in `config.yaml` and all infrastructure related information including image definition will be in `values.yaml`.

        Helm chart of every network function looks similar and has the below structure. Only the chart of mysql database and NRF is different.
    
    * Configuring Core Network

        Network function discovers each-other using NRF and instead of using the ip-address of network functions we rely on using their FQDN, **Kubernetes service concept**. To communicate with each other whether we deploy them in reference point architecture or service based architecture. 

        *For example: AMF registers with NRF using NRF FQDN (`oai-nrf.core-network.svc.cluster.local`). This way we can get rid of any static ip-address configuration.*
        
        
        * **Configure Multiple Interfaces**
            
            - The network functions will use different **virtual ethernet** (veth) interfaces to bind their different logical interface. Example AMF communicates with gNB using N2 and with SMF and NRF using Namf, the Service Base Interface (SBI).
            - This type of configuration is also used when gNB is outside of the cluster or UPF is outside of the cluster. 
            - To make the above seperation **we are using multus** to provide multiple ethernet interfaces to network functions which have multiple communication interfaces.
            - Only AMF, SMF and UPF have the possiblity to use multus. Other network functions can also use multus but then it needs to be configured. 
            - To configure multus for AMF, SMF or UPF, in `values.yaml` of each network function edit the multus section.
            
                ```yaml
                ## Example from oai-5g-basic/values.yaml
                multus:
                  ## If you don't want to add a default route in your pod then leave this field empty
                  defaultGateway: ""
                  n2Interface:
                    create: true
                    Ipadd: "172.21.6.94"
                    Netmask: "22"
                    ## If you do not have a gateway leave the field empty
                    Gateway:
                    ## If you do not want to add any routes in your pod then leave this field empty
                    routes: 
                    hostInterface: "ens33" # Interface of the host machine on which this pod will be scheduled
                ```

        * **Configure Helm Chart Parameters**
            
            In the [config.yaml](../charts/oai-5g-core/oai-5g-basic/config.yaml) of oai-5g-basic helm charts you will see the configurable parameters for all the network functions check, the PLMN, DNN and subscriber information in mysql database

            For basic and advance deployment check the database [oai_db-basic.sql](../charts/oai-5g-core/mysql/initialization/oai_db-basic.sql)

            A new subscriber entry can be added directly in the sql file or it can be added once the core network is already deployed. 

            To add the entry before deploying the core network, make sure you have all the required subscriber information IMSI(ueid/supi), Key(encPermanentKey), OPC(encOpcKey), PLMN, NSSAI(SST, SD), DNN
            
            ``` bash
            vim AN-OPEN-NETRA-VNF/oai-5g-core/mysql/initialization/oai_db-basic.sql
            ```
            ```sql
            # Add a new or edit existing entries after AuthenticationSubscription table
            INSERT INTO `AuthenticationSubscription` (`ueid`, `authenticationMethod`, `encPermanentKey`, `protectionParameterId`, `sequenceNumber`, `authenticationManagementField`, `algorithmId`, `encOpcKey`, `encTopcKey`, `vectorGenerationInHss`, `n5gcAuthMethod`, `rgAuthenticationInd`, `supi`) VALUES
            ('208990100001124', '5G_AKA', 'fec86ba6eb707ed08905757b1bb44b8f', 'fec86ba6eb707ed08905757b1bb44b8f', '{\"sqn\": \"000000000020\", \"sqnScheme\": \"NON_TIME_BASED\", \"lastIndexes\": {\"ausf\": 0}}', '8000', 'milenage', 'c42449363bbad02b66d16bc975d77cc1', NULL, NULL, NULL, NULL, '208990100001124');
            
            # Add the PDN/DNN information after SessionManagementSubscriptionData table
            
            # To assign a static ip-address use the below entry
            INSERT INTO `SessionManagementSubscriptionData` (`ueid`, `servingPlmnid`, `singleNssai`, `dnnConfigurations`) VALUES 
            ('208990100001124', '20899', '{\"sst\": 1, \"sd\": \"10203\"}','{\"oai\":{\"pduSessionTypes\":{ \"defaultSessionType\": \"IPV4\"},\"sscModes\": {\"defaultSscMode\": \"SSC_MODE_1\"},\"5gQosProfile\": {\"5qi\": 6,\"arp\":{\"priorityLevel\": 1,\"preemptCap\": \"NOT_PREEMPT\",\"preemptVuln\":\"NOT_PREEMPTABLE\"},\"priorityLevel\":1},\"sessionAmbr\":{\"uplink\":\"100Mbps\", \"downlink\":\"100Mbps\"},\"staticIpAddress\":[{\"ipv4Addr\": \"12.1.1.85\"}]}}');
            INSERT INTO `SessionManagementSubscriptionData` (`ueid`, `servingPlmnid`, `singleNssai`, `dnnConfigurations`) VALUES 
            ('208990100001125', '20899', '{\"sst\": 1, \"sd\": \"10203\"}','{\"oai\":{\"pduSessionTypes\":{ \"defaultSessionType\": \"IPV4\"},\"sscModes\": {\"defaultSscMode\": \"SSC_MODE_1\"},\"5gQosProfile\": {\"5qi\": 6,\"arp\":{\"priorityLevel\": 1,\"preemptCap\": \"NOT_PREEMPT\",\"preemptVuln\":\"NOT_PREEMPTABLE\"},\"priorityLevel\":1},\"sessionAmbr\":{\"uplink\":\"100Mbps\", \"downlink\":\"100Mbps\"}}}');
            ```

            In the config file `smf.use_local_subscription_info` should be `yes` to use the user DNN subscription information from the database. Else it will be used as defined in the configuration file.


        > [Clone and see me for detail configuration](https://github.com/adaptivenetworklab/AN-OPEN-NETRA-VNF/tree/main/oai-5g-core)
    
    * Helm install with related chart
        
        Helm charts have an order of deployment for the proper configuration of core network. 

        Once the configuration is finished the charts can be deployed with a user who has the rights to

        1. Create RBAC (Optional only if Openshift is used)
        2. Run pod (only UPF needs that) with privileged and anyuid scc (optional only required if you have scc configure in your cluster)
        3. Create multus binds (optional only if multus is used)
  
           
        ---
        Install with this helm command:
        ```bash
        cd AN-OPEN-NETRA-VNF/oai-5g-core/
        helm install basic oai-5g-basic/ --namespace core-network
        ```
        

        <details>
        <summary>The output is similar to:</summary>

        ```console
        NAME: basic
        LAST DEPLOYED: Tue Dec 12 10:04:40 2023
        NAMESPACE: default
        STATUS: deployed
        REVISION: 1
        TEST SUITE: None
        ```
        </details>


        This command can take around 3-5 mins depending on your network speed and cluster configuration (computational capacity). You can use the wait command to see if the core network functions are running or not

        ```bash
        kubectl wait --for=condition=ready pod -l app.kubernetes.io/instance=basic --timeout=3m -n core-network
        ```
        Check the logs `smf` and `upf` to see that the PFCP session is properly configured, 

        ```console
        kubectl logs -l app.kubernetes.io/name=oai-smf -n core-network | grep 'handle_receive(16 bytes)' | wc -l
        kubectl logs -l app.kubernetes.io/name=oai-upf -n core-network | grep 'handle_receive(16 bytes)' | wc -l
        ```
        If the value is more than `1` for both then it will verify that `smf` and `upf` have successfully registered to `nrf` and there is a PFCP session. 

    * Wait until all the pods are up and running (k9s)

    ![image](https://hackmd.io/_uploads/HJyqs99ap.png)
    
    * Component topology on 5G Core Network (KubeView)
    
    ![image](https://hackmd.io/_uploads/B1Khs95aT.png)
