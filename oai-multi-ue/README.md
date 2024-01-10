## 2. Userplane Duplication 📳

OpenAirInterface (OAI) is an open-source implementation of the 3rd Generation Partnership Project (3GPP) specifications for mobile communication. 

### 2.1 Multiple UE 📱

![image](https://hackmd.io/_uploads/ByM8hgJ86.png)

#### Kendala: Tidak bisa ping 8.8.8.8 melalui interface `oaitun_ue1`

**Existing Interface on pod:**
```=output
root@oai-nr-ue-7dcf7dcc9-whn6m:/opt/oai-nr-ue# ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host
       valid_lft forever preferred_lft forever
3: eth0@if1915: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1450 qdisc noqueue state UP group default qlen 1000
    link/ether 06:4c:fe:47:ae:3c brd ff:ff:ff:ff:ff:ff link-netnsid 0
    inet 10.233.71.8/32 scope global eth0
       valid_lft forever preferred_lft forever
    inet6 fe80::44c:feff:fe47:ae3c/64 scope link
       valid_lft forever preferred_lft forever
4: net1@if2: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default
    link/ether 0a:c0:5f:bb:19:de brd ff:ff:ff:ff:ff:ff link-netnsid 0
    inet 172.21.16.95/22 brd 172.21.19.255 scope global net1
       valid_lft forever preferred_lft forever
    inet6 fe80::8c0:5fff:febb:19de/64 scope link
       valid_lft forever preferred_lft forever
5: oaitun_ue1: <POINTOPOINT,MULTICAST,NOARP,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UNKNOWN group default qlen 500
    link/none
    inet6 fe80::8e3d:4095:ab79:6c1d/64 scope link stable-privacy
       valid_lft forever preferred_lft foreve
```
**Requirement:**
1. IP `inet4` is need to be attached in `oaitun_ue1` interface
2.  You can troubleshoot this issue by looking at (AMF Log, SMF Log, CU Log, DU Log, SQL Subscriber list)

> ON PROGRESS...
