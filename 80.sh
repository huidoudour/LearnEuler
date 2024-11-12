Listen 81

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