# RKE & kubectl

Rancher Kubernetes Engine (RKE) is a light-weight Kubernetes installer that supports installation on bare-metal and virtualized servers.

[RKE Documentation](https://rancher.com/docs/rke/v0.1.x/en/)

[kubectl Documentation](https://kubernetes.io/docs/reference/kubectl/overview/)

````
docker run -ti -v C:\k8s\:/rke -w /rke netyazilim/rke

Connection test:
cp /rke/<private_key> /tmp/<private_key>
chmod 400 /tmp/<private_key>
ssh -i /tmp/<private_key> <user>@<ip>
````
