# VNF Documentation 

As a VNF 5G Implementation Division on Kubernetes, I design and deploy high-performance OpenAirInterface (OAI) 5G use cases. I optimize network performance, ensure security integration, and collaborate on defining use cases. My focus is on automation for efficient seamless deployment 5G integration in Kubernetes environments.

## OpenNetra: Description

![netra dash](https://hackmd.io/_uploads/Bk2avI4ST.jpg)


Open Netra, standing for Open Network Training, is a comprehensive solution designed to facilitate the training, simulation, and management of 5G networks. The primary functionalities of Open Netra include E2E (End-to-End) 5G dashboard simulation and RAN (Radio Access Network) monitoring & configuration. The entire infrastructure is built on a foundation of virtualized network functions, specifically implemented as OpenAirInterface containers, orchestrated and managed by Kubernetes.

## Pre-Requisite

1. Production Ready Kubernetes Cluster

    > [Kubernetes Installation Detail](https://hackmd.io/@openetra/H1alUII_T)

2. (Optional) Multus CNI if using multiple interfaces for NFs
    > [Multus CNI Quick Start](https://github.com/k8snetworkplumbingwg/multus-cni/blob/master/docs/quickstart.md)
4. Kube-Sniff & Wireshark

    * **Setup Krew (kubectl package-manager)**

        Make sure git are installed

        ```=bash
        sudo apt install git 
        ```
        Run this command to download and install krew
        ```=bash
        (
          set -x; cd "$(mktemp -d)" &&
          OS="$(uname | tr '[:upper:]' '[:lower:]')" &&
          ARCH="$(uname -m | sed -e 's/x86_64/amd64/' -e 's/\(arm\)\(64\)\?.*/\1\2/' -e 's/aarch64$/arm64/')" &&
          KREW="krew-${OS}_${ARCH}" &&
          curl -fsSLO "https://github.com/kubernetes-sigs/krew/releases/latest/download/${KREW}.tar.gz" &&
          tar zxvf "${KREW}.tar.gz" &&
          ./"${KREW}" install krew
        )
        ```
        Add the $HOME/.krew/bin directory to your PATH environment variable.
        ```=bash
        export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
        ```
    * **Install Kubectl-Sniff**

        Install it from krew package manager

        ```=bah
        kubectl krew install sniff
        ```
    * **Install Wireshark**

        Setup wireshark from os repository

        ```=bash
        sudo apt install wireshark -y
        ```
        Configure the permission problem

        ```=bash
        sudo gpasswd -a $USER wireshark
        sudo adduser $USER wireshark
        sudo setcap 'CAP_NET_RAW+eip CAP_NET_ADMIN+eip' /usr/bin/dumpcap
        ```

    * **How to use ksniff**

        If used in Wireshark GUI

        ![image](https://hackmd.io/_uploads/B1p46OkK6.png)

        ```
        kubectl sniff oai-nr-ue-2-786b494559-jtz97 -n oai
        ```

        **If used in Terminal**

        ```
        kubectl sniff oai-nr-ue-2-786b494559-jtz97 -n oai -f "tcp" -o - | tshark -r -
        ```
        <details> <summary>Example output:</summary>


        ```=output
        INFO[0000] using tcpdump path at: '/home/rafli/.krew/store/sniff/v1.6.2/static-tcpdump'
        INFO[0000] no container specified, taking first container we found in pod.
        INFO[0000] selected container: 'nr-ue'
        INFO[0000] sniffing method: upload static tcpdump
        INFO[0000] sniffing on pod: 'oai-nr-ue-2-786b494559-jtz97' [namespace: 'oai', container: 'nr-ue', filter: 'tcp', interface: 'any']
        INFO[0000] uploading static tcpdump binary from: '/home/rafli/.krew/store/sniff/v1.6.2/static-tcpdump' to: '/tmp/static-tcpdump'
        INFO[0000] uploading file: '/home/rafli/.krew/store/sniff/v1.6.2/static-tcpdump' to '/tmp/static-tcpdump' on container: 'nr-ue'
        INFO[0000] executing command: '[/bin/sh -c test -f /tmp/static-tcpdump]' on container: 'nr-ue', pod: 'oai-nr-ue-2-786b494559-jtz97', namespace: 'oai'
        INFO[0000] command: '[/bin/sh -c test -f /tmp/static-tcpdump]' executing successfully exitCode: '0', stdErr :''
        INFO[0000] file found: ''
        INFO[0000] file was already found on remote pod
        INFO[0000] tcpdump uploaded successfully
        INFO[0000] output file option specified, storing output in: '-'
        INFO[0000] start sniffing on remote container
        INFO[0000] executing command: '[/tmp/static-tcpdump -i any -U -w - tcp]' on container: 'nr-ue', pod: 'oai-nr-ue-2-786b494559-jtz97', namespace: 'oai'
            1   0.000000 10.233.75.62 → 10.233.75.54 TCP 100 44242 → 4043 [PSH, ACK] Seq=1 Ack=1 Win=24091 Len=32 TSval=2131950554 TSecr=1253996121
            2   0.000066 10.233.75.62 → 10.233.75.54 TCP 64376 44242 → 4043 [PSH, ACK] Seq=33 Ack=1 Win=24091 Len=64308 TSval=2131950554 TSecr=1253996121
            3   0.000100 10.233.75.54 → 10.233.75.62 TCP 68 4043 → 44242 [ACK] Seq=1 Ack=64341 Win=16287 Len=0 TSval=1253996122 TSecr=2131950554
        ```
        </details>

4. Configuring PhpMyAdmin for Subscriber Management
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

        Setup your custom credential in the core manifest configuration file.

