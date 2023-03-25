# KubeAcademy Virtual Appliance
<img width="220" alt="kubeAcademy-vappliance" src="https://github.com/rafaelurrutiasilva/kubeAcademy-vappliance/blob/main/photonos_kubeacademy.png" align=left> <br>
A Virtual appliance based on PhotonOS v4 containing Docker, Kind, Kubectl, Kustomize, Helm and Skaffold.<br>
You can use it doing the cources from the  [kube.academy](https://kube.academy). 

<br><br><br>

## Instroduction
This PhotonOS node is build to be used with the Kubeacademy course [Building Applications for Kubernetes](https://kube.academy/courses/building-applications-for-kubernetes). <br>
The node has all the software you need to install discribed in the Lessons nr 2 [Setting Up Your Workstation](https://kube.academy/courses/building-applications-for-kubernetes/lessons/setting-up-your-workstation). <br>

Enjoy!<br>
Rafael


### Account and login
The root account is enabled to login via ssh and the password is **<VMwareVM1!>** .

### Tips

#### Deploy from OVA file
You can find help and instruction to deploy a Virtual Machine from an OVA file here.
* Instruction for VMware [vSphere 7](https://docs.vmware.com/en/VMware-vSphere/7.0/com.vmware.vsphere.hostclient.doc/GUID-8ABDB2E1-DDBF-40E3-8ED6-DC857783E3E3.html).
* Instruction for VMware [Workstation](https://docs.vmware.com/en/VMware-Workstation-Pro/17/com.vmware.ws.using.doc/GUID-DDCBE9C0-0EC9-4D09-8042-18436DA62F7A.html).
* Instruction for VMware [Fusion](https://docs.vmware.com/en/VMware-Fusion/12/com.vmware.fusion.using.doc/GUID-F8B8DD94-4F5F-4BCB-8811-6B48DC3113E7.html).
* Instruction for [VirtualBox](https://www.alphr.com/ova-virtualbox/).

#### Kustomization
Since 1.14, Kubectl also supports the management of Kubernetes objects using a [kustomization](https://kubernetes.io/docs/tasks/manage-kubernetes-objects/kustomization) file.<br> 
```kubectl kustomize <kustomization_directory>```

To apply those Resources, run kubectl apply with --kustomize or -k flag:<br>
```kubectl apply -k <kustomization_directory>```

Delete <br>
```kubectl delete -k overlays/production```

#### Crashcart
General Debug, Inspection
To run crashcart pod in default namespace of K8s cluster:
```
$ kubectl create -f https://github.com/lander2k2/crashcart/raw/master/crashcart-po.yaml
$ kubectl exec -it crashcart bash
```

#### Kubeseal
You may need the Kubeseal client and if you not found it by using the `tdnf` tool, then you can use this installation procedure.
```
$ curl -k -L  https://github.com/bitnami-labs/sealed-secrets/releases/download/v0.20.2/kubeseal-0.20.2-linux-amd64.tar.gz -o kubeseal-0.20.2-linux-amd64.tar.gz
$ tar -xvzf kubeseal-0.20.2-linux-amd64.tar.gz kubeseal
$ install -m 755 kubeseal /usr/local/bin/kubeseal
```
