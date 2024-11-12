在Linux环境下使用Apache HTTP Server（通常称为`httpd`）配置301重定向，可以通过编辑Apache的配置文件来实现。Apache的配置文件通常位于`/etc/httpd/`目录下，具体路径可能根据Linux发行版的不同而有所变化。以下是使用`httpd`配置301重定向的步骤：

### 1. 备份配置文件

在进行任何更改之前，备份当前的Apache配置文件是一个好习惯，以防万一需要恢复。

```bash
sudo cp /etc/httpd/conf/httpd.conf /etc/httpd/conf/httpd.conf.bak
```

### 2. 编辑Apache配置文件

使用文本编辑器（如`nano`或`vim`）打开Apache的配置文件。

```bash
sudo nano /etc/httpd/conf/httpd.conf
```

### 3. 启用`mod_rewrite`模块

确保`mod_rewrite`模块已启用。查找`httpd.conf`文件中包含`mod_rewrite`的行，并确保它们没有被注释掉（行首没有`#`号）。

```apache
LoadModule rewrite_module modules/mod_rewrite.so
```

如果没有找到上述行，可以手动添加。

### 4. 配置重定向规则

在配置文件中添加重定向规则。假设你要将`old-page.html`重定向到`new-page.html`，你可以在`<VirtualHost>`块内添加如下行：

```apache
<VirtualHost *:80>
    ServerName www.yourdomain.com
    DocumentRoot /var/www/html

    RewriteEngine On
    RewriteRule ^old-page\.html$ /new-page.html [R=301,L]
</VirtualHost>
```

如果你想将整个网站重定向到新域名，可以使用：

```apache
<VirtualHost *:80>
    ServerName www.olddomain.com
    DocumentRoot /var/www/html

    RewriteEngine On
    RewriteRule ^(.*)$ http://www.newdomain.com/$1 [R=301,L]
</VirtualHost>
```

### 5. 保存并关闭配置文件

保存更改并关闭文本编辑器。

### 6. 重新启动Apache服务

应用更改需要重新启动Apache服务。

```bash
sudo systemctl restart httpd
```

或者，如果你的系统使用`service`命令：

```bash
sudo service httpd restart
```

### 7. 测试重定向

打开浏览器，访问旧URL，确认是否正确重定向到新URL。

请注意，具体的配置可能根据你的Apache版本和Linux发行版有所不同。如果你的Apache配置分布在多个文件中（例如，使用`include`指令包含的额外配置文件），你可能需要在相应的文件中进行更改。此外，确保你的防火墙设置允许HTTP流量，并且DNS记录已正确指向你的服务器。