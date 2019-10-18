master
GRANT REPLICATION SLAVE ON *.* to 'imageserver'@'%' identified by 'curacloud';

slave
change master to master_host='172.10.10.199',master_user='imageserver',master_password='curacloud',master_log_file='mysql-bin.000003',master_log_pos=0,master_port=3306;

// logstash
grant all privileges on *.* to datacenter@'10.10.0.229' identified by "curacloud";
grant all privileges on *.* to datacenter@'10.10.0.177' identified by "curacloud";
grant all privileges on *.* to datacenter@'172.10.10.205' identified by "curacloud";

grant all privileges on *.* to datacenter@'%' identified by "curacloud";
grant all privileges on *.* to root@'%' identified by "root";


grant all privileges on *.* to esdata@'192.168.0.108' identified by "xingchao123456";

grant all privileges on *.* to esdata@'%' identified by "xingchao123456";

select case when show_name='' then origin_name else show_name end as name from hospitals where origin_name = :institutionname

sudo pvg //name like dev.bogon-vg

show engines;
select * from information_schema.triggers 

delete from information_schema.triggers where TRIGGER_NAME in('sync_hospitals_insert', 'sync_hospitals_update', 'sync_hospitals_delete')


1、 qemu-img resize xxx.img 500G 
2、 virt-resize --expand /dev/sda
3 xxx.img xxx_add.img 
4、sudo pvresize /dev/vda3
5、sudo lvextend -L +450G /dev/bogon-vg/root
6、sudo resize2fs /dev.bogon-vg/root



docker run --name dataservice -e ZBX_HOSTNAME="bogon" -e ZBX_SERVER_HOST="10.10.3.59" -e ZBX_SERVER_PORT=10051 -p 10050:10050 -d zabbix/zabbix-agent

git config --global http.sslVerify false

sudo usermod -a -G docker $USER

root
DJ60pLSK.

export CLASSPATH=.:$JAVA_HOME/lib:$JAVA_HOME/jre/lib
export JAVA_HOME=/home/curacloud/jdk1.8.0_171


centos 7 磁盘扩容. 先添加可用空间kvm虚拟机的 使用qemu-img resize +xxG *.img 然后使用qemu-img info *.img 查看img 文件信息. 
进入系统 fdisk -l 查看磁盘容量是否添加成功.对于使用LVM 的机器 流程是先把可用空间通过
fdisk 添加成一个分区,
vgdisplay 查看lvm 硬盘组的信息,
pvcreate /dev/XXX ;
vgextend lvm的名字(可以在vgdisplay 查到) /dev/XXX ,
lvresize -L +155.99G /dev/mapper/bogon--vg-root //要扩容的卷
resize2fs /dev/mapper/bogon--vg-root  //要扩容的卷

修改kvm虚拟机的内存大小:
1 关闭虚拟机 
2 virsh memtune 主机名 希望获得的内存大小单位KB  
3 然后在图形界面中修改内存大小


sudo usermod -a -G docker $USER

storescp -v port   
storescp -v +xv port  // xv 文件类型 

storescu -v ip port path   // -v 带信息

storescu -v  +sd ip port path   // -v 带信息  //sd 遍历

storescu -v  +sd  -aec SCU -aet ip port path   // -v 带信息  //sd 遍历

storescu -v  +sd  -aec SCU -aet -xv ip port path   // -v 带信息  //sd 遍历


getscu -v 127.0.0.1 1234 /Users/guojun/Documents/CT.1.2.840.113619.2.327.3.50990949.364.1473119019.334.18.IMA

getscu --patient --call ARCHIVE -v 127.0.0.1 1234 a.dcm



getscu -v 127.0.0.1 1234 -P QueryInput.dcm
storescu -v -xv 127.0.0.1 1234 

getscu -v -S -k 0008,0052=STUDY  127.0.0.1 1234  -k StudyInstanceUID=1.2.840.113619.2.327.3.50990949.364.1473119019.334.6 -od .



docker network ls -q | xargs docker network rm


sudo pmset -a GPUSwitch 0 // 强制使用集显
sudo pmset -a GPUSwitch 1 // 强制使用独显
sudo pmset -a GPUSwitch 2 // 自动切换模式

docker run -it -p 6780:9001 -v /root/drive/hard-driver:/evfit.cn/driver -d golang

export GOPROXY=https://goproxy.io