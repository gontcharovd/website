---
title: "🎥 Integrating HighByte with the United Manufacturing Hub"
date: 2024-08-07T14:37:25+02:00
categories:
    - Video
tags:
    - United Manufacturing Hub
    - HighByte
---

*This video was recorded by me for the [United Manufacturing Hub](https://www.umh.app/)*

In this video, we’ll walk through connecting HighByte, a data processing engine, with the United Manufacturing Hub (UMH). HighByte is an OT-friendly alternative to Node-RED to handle operational technology data, making it a useful tool alongside the UMH.

We will start by demonstrating how to download and set up HighByte within Kubernetes. Next, we’ll show you how to configure it to use data from the UMH, model this data, and send it back to UMH. From there on, the modeled data in the UMH will then be used in other applications and stored automatically in the UMH Historian.

{{< youtube fNyC5PHy8vM >}}

### Resources:

create-kubernetes-secrets.sh:

```bash
DOCKER_REGISTRY_SERVER=docker.io
DOCKER_USER="<enter your Docker username>"
DOCKER_EMAIL="<enter your email>"
DOCKER_PASSWORD="<enter your password>"

sudo kubectl create secret docker-registry myregistrykey \
  --docker-server=$DOCKER_REGISTRY_SERVER \
  --docker-username=$DOCKER_USER \
  --docker-password=$DOCKER_PASSWORD \
  --docker-email=$DOCKER_EMAIL \
  -n united-manufacturing-hub \ 
  --kubeconfig /etc/rancher/k3s/k3s.yaml
```

deployment.yaml:

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: highbyte-deployment
  namespace: united-manufacturing-hub
spec:
  replicas: 1
  selector:
    matchLabels:
      app: highbyte
  template:
    metadata:
      labels:
        app: highbyte
    spec:
      containers:
      - name: highbyte-container
        image: gontcharovd/highbyte:4.0.0
        ports:
        - containerPort: 45245
        - containerPort: 1885
        - containerPort: 8885
        volumeMounts:
        - name: highbyte-config
          mountPath: /usr/local/highbyte/config
      volumes:
      - name: highbyte-config
        persistentVolumeClaim:
          claimName: hb-pvc
      imagePullSecrets:
      - name: myregistrykey

---
apiVersion: v1
kind: Service
metadata:
  name: highbyte-service
  namespace: united-manufacturing-hub
spec:
  selector:
    app: highbyte
  ports:
    - name: port-45245
      protocol: TCP
      port: 45245
      targetPort: 45245
    - name: port-1885
      protocol: TCP
      port: 1885
      targetPort: 1885
    - name: port-8885
      protocol: TCP
      port: 8885
      targetPort: 8885
  type: LoadBalancer

---
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: hb-pvc
  namespace: united-manufacturing-hub
spec:
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 1Gi
```
