**COPY FROM:** [satomic](https://github.com/satomic/cka-practice-environment)

### Quick Start

You must install [***++docker++***](https://docs.docker.com/v17.09/engine/installation/linux/docker-ce/centos/) and [***++docker-compose++***](https://docs.docker.com/v17.09/compose/install/) before do this. Just copy and paste these shells from the two steps, then visit it from your local browser

##### Step 1: Frontend (webpage)

```bash
# you need to change these two env to your real value, if you have no public ip, just set the PUBLIC_IP same as your PRIVATE_IP
export PUBLIC_IP=47.52.219.131
export PRIVATE_IP=172.31.63.194

# gen docker-compose.yaml and up it
cat > docker-compose.yaml << EOF
version: "3"

services:

  gateone:
    image: me450722457/cka_lab:gateone
    ports:
    - "8000:8000"
    hostname: kubectl
    networks:
    - frontend
    volumes:
    - ssh_key:/root/.ssh/

  lab:
    image: me450722457/cka_lab:lab
    entrypoint: /opt/entry.bash
    ports:
      - 80:80
    networks:
    - frontend
    environment:
      GATEONE_HTTP_SERVER: "47.52.219.131:8000" # you need to change this IP based on your real PUBLIC IP

networks:
  frontend: {}
volumes:
  ssh_key: {}
EOF

docker-compose up -d
```

##### Step 2: Backend (k8s)

**If you already have Kubernetes Cluster**, just copy your `kubeconfig.yaml` file contents to the `/root/.kube/config` file in the host for his CKA Practice Environment.

```bash
# maybe some command like
cp /pathto_your_existed/kubeconfig.yaml /root/.kube/config
```

### QA

#### Q1. What's changed in this image
**Answer**: Question list has been updated,and added Chinese translation and answers.These questions come from https://blog.csdn.net/fly910905/article/details/103652034
