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