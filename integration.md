```bash
UOS
/etc/profile.d/login.sh >> 
#!/bin/bash
time=$(date)
name=$(hostname
echo "************************************"
echo "ChinaSkills 2024 - CSK"
echo "Module C Linux"
echo ""
echo ">>$name<<"
echo "  >>UnionTtch OS Server 20<<"
echo ">>$time<<"
echo "************************************"



CentOS
/etc/profile.d/login.sh >> 
#!/bin/bash
#time=$(date)
#name=$(hostname)
echo "************************************"
echo "    ChinaSkills 2024 - CSK"
echo "          Module C Linux"
echo ""
echo "             >>$(hostname)<<"
echo ">>CentOS Linux release 7.9.2009 (Core)<<"
echo "   >>$(date)<<"
echo "************************************"


systemctl stop firewalld
setenforce 0
```

```bash
$TTL 86400
@       IN      SOA     ecs1.example.com. root.example.com. (
                              2024103101  ; Serial
                              3600        ; Refresh
                              1800        ; Retry
                              604800      ; Expire
                              86400       ; Minimum TTL
                              )

@       IN      NS      ecs1.example.com.
@       IN      A       192.168.1.100
www     IN      A       192.168.1.101

```

```bash
<VirtualHost *:81 >
        DocumentRoot /var/www/html/error
        ServerName 192.168.128.135
        <Directory /var/www/html/error>
        Allowoverride None
        Require all denied
        </Directory>
</VirtualHost>
<VirtualHost *:81 >
        DocumentRoot /var/www/html/
        ServerName linux1.abc.lan
        <Directory /var/www/html/>
        Allowoverride None
        Require all granted
        </Directory>
</VirtualHost>



<VirtualHost *:81>
        ServerName abc.lan
        ServerAlias *.abc.lan
        Redirect permanent / http://linux1.abc.lan:81/
</VirtualHost>
<VirtualHost *:81>
        ServerName linux1.abc.lan
        DocumentRoot /var/www/html
</VirtualHost>

#<VirtualHost *:443>
#       Servername abc.lan
#       SSLEngine on
#       SSLProtocol -all +TLSv1.2 +TLSv1.3
#       SSLCertificateFile /etc/pki/tls/certs/abc.lan.crt
#       SSLCertificateKeyFile /etc/pki/tls/private/abc.lan.key
#       SSLVerifyClient require
#       SSLVerifyDepth 1
#</VirtualHost>
```

```bash
mkdir /media/cdrom/
mount /dev/cdrom /media/cdrom/
cd /etc/yum.repos.d/
mv openEuler.repo openEuler.repo.bak
cat <<EOF > local.repo
[local]
name=myrepo
baseurl=file:///media/cdrom
gpgcheck=0
enabled=1
EOF



#编辑配置文件
vi /etc/fstab
#最后加上一条
/dev/cdrom /media/cdrom iso9660 defaults 0 0
或
mount /kvm/openeuler.iso /media/cdrom/
#重新挂载
mount -a
#检查是否挂载成功
df -h
```

```bash
openssl req -new -key abc.lan.key -out abc.lan.csr -config /etc/pki/tls/openssl.cnf -extensions v3_req

openssl ca -in abc.lan.csr  -out abc.lan.crt -cert ca.crt  -keyfile ca.key -extensions v3_req -days 1825 -config /etc/pki/tls/openssl.cnf

scp linux3:/etc/pki/CA/abc.lan.crt /etc/pki/tls/certs/abc.lan.crt

scp linux3:/etc/pki/CA/abc.lan.key /etc/pki/tls/private/abc.lan.key
```

```bash
<VirtualHost *:80>
        DocumentRoot /var/www/html/error
        ServerName 192.168.239.129
        <Directory "/var/www/html/error/">
        AllowOverride None
        Require all denied
        </Directory>
</VirtualHost>
<VirtualHost *:80>
        DocumentRoot /var/www/html/
        ServerName www.xckt.com
        <Directory "/var/www/html/">
        AllowOverride None
        Require all granted
        </Directory>
</VirtualHost>



<VirtualHost *:80>
        ServerName xckt.com
        Redirect permanent / http://www.xckt.com/
</VirtualHost>
<VirtualHost *:80>
        ServerName web.xckt.com
        Redirect permanent / http://www.xckt.com/
</VirtualHost>
<VirtualHost *:80>
        ServerName www.xckt.com
        Redirect permanent / http://www.xckt.com/
</VirtualHost>
```

```bash
ssh-keygen
yum -y install sshpass

for i in {9..9}; do sshpass -p '<you_password>'  ssh-copy-id -o StrictHostKeyChecking=no root@192.168.239.12$i; done

for i in {0..1}; do sshpass -p '<you_password>'  ssh-copy-id -o StrictHostKeyChecking=no root@192.168.239.13$i; done

for i in {1..3}; do sshpass -p '<you_password>' ssh-copy-id -o StrictHostKeyChecking=no ecs$i.xckt.com.; done


```

```
yum install openssl* -y
cd /etc/pki/CA/
touch index.txt
echo 00 > serial
openssl genrsa -out ca.key 2048
openssl req -new -out ca.csr -key ca.key
openssl x509 -req -days 3650 -in ca.csr -signkey ca.key -out ca.crt
vi /etc/pki/tls/openssl.cnf
openssl genrsa -out skills.key 2048
openssl req -new -key skills.key -out skills.csr -config /etc/pki/tls/openssl.cnf -extensions v3_req
openssl ca -in skills.csr  -out skills.crt -cert ca.crt  -keyfile ca.key -extensions v3_req -days 1825 -config /etc/pki/tls/openssl.cnf
```

