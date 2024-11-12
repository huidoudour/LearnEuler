
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

mount -a
df -h