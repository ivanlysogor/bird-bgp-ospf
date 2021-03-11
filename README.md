# GoBGP Practical Activity
### Task description
You have the following topology:

![Network topology](diagram.png)

All devices has bird pre-installed.

The customer has AS number 64512.
The ISP1 has AS number 64601 and the ISP2 has AS number 64602.
The Cloud Provider has AS number 64700.

The objective is to configure routing policies on cust1-ce1, cust1-ce2 and cloud1-ce1 devices to ensure that forwarding path
cust1-core<->cust1-ce1<->sp1-p1<->cloud1-ce1 will be used as a primary and path cust1-core<->cust1-ce2<->sp2-p1<->cloud1-ce1 
will be used as a secondary path if path1 is not available.

eBGP sessions must be configured between:
- cust1-ce1 and sp1-p1;
- cust1-ce2 and sp1-p2;
- sp1-p1 and cloud1-ce1;
- sp2-p1 and cloud1-ce1;

iBGP session must be configured between cust1-ce1 and cust1-ce2.

OSPF must be configured between cust1-ce1, cust1-ce2 and cust1-core.


#### 1. Setup Vagrant
Download from https://www.vagrantup.com/downloads.html and install
#### 2. Pull repository
```git clone https://github.com/ivanlysogor/bird-bgp-ospf```
#### 3. Setup environment
```
cd bird-bgp-ospf
vagrant up
```
#### 4. Configure OSPF

Configure OSPF area 0 for devices cust1-ce1, cust1-ce2 and cust1-core.

Hints:
- you can connect to you virtual routers with command ```vagrant ssh <router-name>```
- Bird documentation available at https://bird.network.cz/
- Zebra interface accessible via ```telnet localhost 2601``` with password ```zebra``` and enable ```zebra```

#### 5. Configure BGP

Configure BGP sessions and BGP policies for all devices.


#### 5. Validate
Traceroute internal interface cloud1-ce1 IP address from cust1-core interface to ensure that traffic pass through cust1-ce1 and sp1-p1 devices. Test it for opposite direction traffic too.

Disable sp1-p1 device and ensure that IP connectivity restored throught sp2-p1 device.

#### 5. Destroy VM
```vagrant destroy```
