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