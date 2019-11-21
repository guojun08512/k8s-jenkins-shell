sudo kubectl apply -f https://docs.projectcalico.org/v3.0/getting-started/kubernetes/installation/hosted/canal/rbac.yaml
sudo kubectl apply -f https://docs.projectcalico.org/v3.0/getting-started/kubernetes/installation/hosted/canal/canal.yaml
sudo kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v1.10.1/src/deploy/recommended/kubernetes-dashboard.yaml

kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep admin-user | awk '{print $1}')


master:
1. sudo apt-get install -y kubelet kubeadm kubectl kubernetes-cni
2. sudo kubeadm init --pod-network-cidr=10.244.0.0/16 --apiserver-advertise-address=172.10.10.178
# sudo kubeadm init --image-repository registry.aliyuncs.com/google_containers --kubernetes-version v1.15.2 --pod-network-cidr=10.244.0.0/16 --apiserver-advertise-address=172.10.10.178

mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

apt-get install -y kubelet kubeadm kubectl --allow-unauthenticated

192.168.200.160
1.
kubeadm token generate
2. 生成join
kubeadm token create llveax.q75sjlxw8mdaqc17 --print-join-command --ttl=0


sudo usermod -a -G docker $USER
// 安装 node
#!/bin/bash

set -e

echo "Init"
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -

echo "kubernetes.list"
cat > /etc/apt/sources.list.d/kubernetes.list << EOF
deb http://apt.kubernetes.io/ kubernetes-xenial main
EOF


apt-get update
apt-get install -y kubelet kubeadm kubectl kubernetes-cni


swapoff  -a
#vi /etc/fstab


#mutil master
sudo kubeadm init --config=config.yaml --upload-certs
kubeadm init phase upload-certs --upload-certs
modprobe ip_vs && modprobe ip_vs_rr && modprobe ip_vs_wrr && modprobe ip_vs_sh
sudo vim /etc/modules
ip_vs_rr
ip_vs_wrr
ip_vs_sh
ip_vs

 kubeadm join 192.168.201.24:6443 --token x09w1y.fxsyoyg07m598bet \
    --discovery-token-ca-cert-hash sha256:d792eac23368a5a9002fab19690c077964bb354d4e57a0737c2aff535f8ffcef \
    --control-plane --certificate-key 7086001f7da9a4afc78bbf0f21dd3b2fa47d28da26e4a8f17c5c354cc59e6400

sudo scp -r /etc/kubernetes/pki curacloud@192.168.201.26:~

## elk
cluster.name：Elasticsearch 集群的名称，我们这里命名成 k8s-logs。
node.name：节点的名称，通过metadata.name来获取。这将解析为 es-cluster-[0,1,2]，取决于节点的指定顺序。
discovery.zen.ping.unicast.hosts：此字段用于设置在 Elasticsearch 集群中节点相互连接的发现方法。我们使用 unicastdiscovery 方式，它为我们的集群指定了一个静态主机列表。由于我们之前配置的无头服务，我们的 Pod 具有唯一的 DNS 域es-cluster-[0,1,2].elasticsearch.logging.svc.cluster.local，因此我们相应地设置此变量。由于都在同一个 namespace 下面，所以我们可以将其缩短为es-cluster-[0,1,2].elasticsearch。要了解有关 Elasticsearch 发现的更多信息，请参阅 Elasticsearch 官方文档：https://www.elastic.co/guide/en/elasticsearch/reference/current/modules-discovery.html。
discovery.zen.minimum_master_nodes：我们将其设置为(N/2) + 1，N是我们的群集中符合主节点的节点的数量。我们有3个 Elasticsearch 节点，因此我们将此值设置为2（向下舍入到最接近的整数）。要了解有关此参数的更多信息，请参阅官方 Elasticsearch 文档：https://www.elastic.co/guide/en/elasticsearch/reference/current/modules-node.html#split-brain。
ES_JAVA_OPTS：这里我们设置为-Xms512m -Xmx512m，告诉JVM使用512 MB的最小和最大堆。您应该根据群集的资源可用性和需求调整这些参数。要了解更多信息，请参阅设置堆大小的相关文档：https://www.elastic.co/guide/en/elasticsearch/reference/current/heap-size.html。

prometheus

kubectl delete pod --grace-period=0 --force

nohup helm serve --address 0.0.0.0:8879 --repo-path /home/curacloud/k8s/local-repo &
helm repo add local-repo http://192.168.200.160:8879
helm repo add local-repo http://127.0.0.1:8879
helm package couchbase-helm/couchbase-cluster --save=false
helm repo index --url=http://192.168.200.160:8879 .
helm repo update

helm init --service-account tiller --history-max 200

helm ls --all
helm ls --all | awk 'NR > 1{print $1}' | xargs helm del --purge

helm install couchbase/couchbase-operator --namespace couchbase --name co
helm install couchbase/couchbase-cluster --namespace couchbase --name cc

kubectl label nodes k8s-minio storage=minio --overwrite
kubectl label nodes k8s-ich-test storage=ich-minio --overwrite
##1T
helm install --namespace ich-minio --name ich-minio --set mode=standalone,persistence.enabled=false,accessKey=admin,secretKey=curacloud,nodeSelector.storage=ich-minio stable/minio
helm install --namespace minio --name minio --set mode=distributed,persistence.size=1024Gi,accessKey=admin,secretKey=curacloud,nodeSelector.storage=minio stable/minio
helm install --namespace minio --name minio --set nasgateway.enabled=true,nasgateway.replicas=1,mode=standalone,persistence.size=1024Gi,accessKey=admin,secretKey=curacloud,nodeSelector.storage=minio stable/minio

<!-- update -->
helm upgrade minio --set nasgateway.enabled=true,nasgateway.pv=export-minio-1,mode=standalone,persistence.size=1024Gi,accessKey=admin,secretKey=curacloud,nodeSelector.storage=minio stable/minio
##5T
kubectl label nodes k8s-minio storage=minio --overwrite
kubectl label nodes k8s-minio2 storage=minio --overwrite
kubectl label nodes k8s-minio3 storage=minio --overwrite
kubectl label nodes k8s-minio4 storage=minio --overwrite
helm install --namespace minio --name minio --set nasgateway.enabled=true,nasgateway.replicas=8,mode=distributed,persistence.size=5120Gi,accessKey=admin,secretKey=curacloud,nodeSelector.storage=minio stable/minio

sudo route add default gw 10.3.4.1
sudo ifconfig etho 192.168.200.163 netmask  255.255.0.0

journalctl -xeu kubelet

nfs 依赖库 nfs-common

<!-- mac -->
mount -t smbfs //guest:@192.168.8.71/K8s-minio ~/nas
<!-- linux -->
mount -o username=admin,password=curacloud //192.168.8.71/couchbasebak ~/bak
sudo mount -t nfs 192.168.8.71:/couchbasebak ~/bak

./bin/cbmultideploy --config /Users/guojun/Documents/keyayun.com/service/multi-db-config.yaml --skip-cluster --eventing-url http://admin:curacloud@192.168.201.21:8091 --capi-url http://admin:curacloud@192.168.201.21:8091 --start

archiveArtifacts artifacts: 'build.tar.gz'

git describe --dirty --abbrev=8 --tags --always

cbrestore /data http://admin:curacloud@127.0.0.1:8091 -u admin -p curacloud --bucket-source=data --bucket-destination=data

<!-- bj -->

docker volume create --driver local \
    --opt type=nfs \
    --opt o=addr=192.168.8.71,rw \
    --opt device=:/couchbasebak \
    couchbase
docker run --restart=always -d --name couchbase-db -p 8091-8094:8091-8094 -p 11210:11210 -v /home/curacloud/couchbase:/opt/couchbase/var  couchbase

docker volume create --driver local \
    --opt type=nfs \
    --opt o=addr=192.168.8.71,rw \
    --opt device=:/csbj2-minio-data \
    minio

docker run --restart=always -p 9000:9000 --name minio -v minio:/data  -e "MINIO_ACCESS_KEY=admin" -e "MINIO_SECRET_KEY=curacloud" -d  minio/minio:RELEASE.2019-10-12T01-39-57Z server /data

Date=`TZ=UTC-8 date +%Y%m%d%H%M`
cbbackup http://127.0.0.1:8091 /bak/backup-${Date} -u admin -p curacloud

cbrestore /bak http://127.0.0.1:8091 -u admin -p curacloud --bucket-source=activity --bucket-destination=activity
cbrestore /bak http://127.0.0.1:8091 -u admin -p curacloud --bucket-source=casbin --bucket-destination=casbin
cbrestore /bak http://127.0.0.1:8091 -u admin -p curacloud --bucket-source=data --bucket-destination=data
cbrestore /bak http://127.0.0.1:8091 -u admin -p curacloud --bucket-source=dirinfo --bucket-destination=dirinfo
cbrestore /bak http://127.0.0.1:8091 -u admin -p curacloud --bucket-source=file --bucket-destination=file
cbrestore /bak http://127.0.0.1:8091 -u admin -p curacloud --bucket-source=idp --bucket-destination=idp
cbrestore /bak http://127.0.0.1:8091 -u admin -p curacloud --bucket-source=jobs --bucket-destination=jobs
cbrestore /bak http://127.0.0.1:8091 -u admin -p curacloud --bucket-source=main --bucket-destination=main
cbrestore /bak http://127.0.0.1:8091 -u admin -p curacloud --bucket-source=meta --bucket-destination=meta
cbrestore /bak http://127.0.0.1:8091 -u admin -p curacloud --bucket-source=sys --bucket-destination=sys

<!-- sz -->
docker volume create --driver local \
    --opt type=nfs \
    --opt o=addr=172.10.10.144,rw \
    --opt device=:/couchbase-bak \
    couchbase
docker run --restart=always -d --name couchbase -p 8091-8094:8091-8094 -p 11210:11210 -v /home/curacloud/couchbase:/opt/couchbase/var -v /home/curacloud/bak:/bak couchbase
docker run --restart=always -d --name couchbase -p 8091-8094:8091-8094 -p 11210:11210 -v /home/curacloud/couchbase:/opt/couchbase/var couchbase
cbrestore /bak/backup-201910151252 http://127.0.0.1:8091 -u admin -p curacloud --bucket-source=activity --bucket-destination=activity
cbrestore /bak/backup-201910151252 http://127.0.0.1:8091 -u admin -p curacloud --bucket-source=casbin --bucket-destination=casbin
cbrestore /bak/backup-201910151252 http://127.0.0.1:8091 -u admin -p curacloud --bucket-source=data --bucket-destination=data
cbrestore /bak/backup-201910151252 http://127.0.0.1:8091 -u admin -p curacloud --bucket-source=dirinfo --bucket-destination=dirinfo
cbrestore /bak/backup-201910151252 http://127.0.0.1:8091 -u admin -p curacloud --bucket-source=file --bucket-destination=file
cbrestore /bak/backup-201910151252 http://127.0.0.1:8091 -u admin -p curacloud --bucket-source=idp --bucket-destination=idp
cbrestore /bak/backup-201910151252 http://127.0.0.1:8091 -u admin -p curacloud --bucket-source=jobs --bucket-destination=jobs
cbrestore /bak/backup-201910151252 http://127.0.0.1:8091 -u admin -p curacloud --bucket-source=main --bucket-destination=main
cbrestore /bak/backup-201910151252 http://127.0.0.1:8091 -u admin -p curacloud --bucket-source=meta --bucket-destination=meta
cbrestore /bak/backup-201910151252 http://127.0.0.1:8091 -u admin -p curacloud --bucket-source=sys --bucket-destination=sys

docker volume create --driver local \
    --opt type=nfs \
    --opt o=addr=172.10.10.144,rw \
    --opt device=:/minio/minio-data \
    minio

docker run --restart=always -p 9000:9000 --name minio -v minio:/data -e "MINIO_ACCESS_KEY=admin" -e "MINIO_SECRET_KEY=curacloud" -d  minio/minio:RELEASE.2019-10-12T01-39-57Z server /data

<!-- nfs lock -->
sudo systemctl enable rpc-statd  # Enable statd on boot
sudo systemctl start rpc-statd  # Start statd for the current session

<!-- bj minio backup -->
docker run -it --entrypoint=/bin/sh minio/mc
mc config host add oldresource http://192.168.200.160:31420 admin curacloud -api s3v4
mc config host add newresource http://192.168.200.163:9000 admin curacloud -api s3v4
mc ls oldresource
mc ls newresource 
mc mb newresource/apps-web
mc cp -r oldresource/apps-web/ newresource/apps-web
mc mb newresource/data-v2
mc cp -r oldresource/data-v2/ newresource/data-v2
mc mb newresource/file-v2
mc cp -r oldresource/file-v2/ newresource/file-v2

<!-- sz minio backup -->
docker run -it --entrypoint=/bin/sh minio/mc
mc config host add oldresource http://172.10.10.178:30900 admin curacloud -api s3v4
mc config host add newresource http://172.10.10.187:9000 admin curacloud -api s3v4
mc ls oldresource
mc ls newresource 
mc mb newresource/apps-web
mc cp -r oldresource/apps-web/ newresource/apps-web
mc mb newresource/data-v2
mc cp -r oldresource/data-v2/ newresource/data-v2
mc mb newresource/file-v2
mc cp -r oldresource/file-v2/ newresource/file-v2
mc mirror -a oldresource/file-v2/ newresource/file-v2



http://172.10.10.144:8080/cgi-bin/   username: admin password : @aQ4HQy0^Mqp


global__IndexViewsVersion


cbbackupmgr config --archive /bak/data --repo bak
cbbackupmgr backup -a /bak-data -r bak -c http://127.0.0.1:8091 -u admin -p curacloud