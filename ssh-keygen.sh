ssh-keygen
yum -y install sshpass

for i in {9..9}; do sshpass -p 'Zjs0202520'  ssh-copy-id -o StrictHostKeyChecking=no root@192.168.239.12$i; done

for i in {0..1}; do sshpass -p 'Zjs0202520'  ssh-copy-id -o StrictHostKeyChecking=no root@192.168.239.13$i; done

for i in {1..3}; do sshpass -p 'Zjs0202520' ssh-copy-id -o StrictHostKeyChecking=no ecs$i.xckt.com.; done

