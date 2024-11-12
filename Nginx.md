# Nginx

## 一、

以下是在 OpenEuler 系统上完成上述任务的步骤：

**一、安装 Nginx**

1. 在 OpenEuler 系统上，可以使用以下命令安装 Nginx：

   ```bash
   sudo dnf install nginx
   ```

**二、配置 Nginx**

1. 创建默认文档内容：

   创建一个名为 `index.html` 的文件，内容为“Hello Nginx”，并将其放置在 Nginx 的默认网站目录中。通常是 `/usr/share/nginx/html`。

   ```bash
   echo "Hello Nginx" | sudo tee /usr/share/nginx/html/index.html
   ```

2. 创建图片和文本文件：

   在同一目录下创建一个图片文件（例如可以使用一个简单的文本文件重命名为 `.png` 格式作为测试，实际应用中可以使用真正的图片文件）和一个文本文件。

   ```bash
   echo "This is a test text." | sudo tee /usr/share/nginx/html/1.txt
   cp /usr/share/nginx/html/1.txt /usr/share/nginx/html/1.png
   ```

3. 配置域名访问和强制 HTTPS：

   编辑 Nginx 的默认站点配置文件 `/etc/nginx/nginx.conf`（或者可能是 `/etc/nginx/conf.d/default.conf`，具体取决于安装版本和配置）。

   ```bash
   sudo nano /etc/nginx/nginx.conf
   ```

   或者

   ```bash
   sudo nano /etc/nginx/conf.d/default.conf
   ```

   修改内容如下：

   ```nginx
   server {
       listen 80;
       server_name _;
       return 301 https://$host$request_uri;
   }

   server {
       listen 443 ssl;
       server_name www.test.com;

       ssl_certificate /path/to/your/certificate.crt;
       ssl_certificate_key /path/to/your/private.key;

       location / {
           root /usr/share/nginx/html;
           index index.html;
       }

       location ~* \.(png|txt)$ {
           root /usr/share/nginx/html;
       }
   }
   ```

   将 `/path/to/your/certificate.crt` 和 `/path/to/your/private.key` 替换为实际的 SSL 证书和私钥文件路径。如果没有实际的证书，可以先使用自签名证书进行测试，但在生产环境中应使用由受信任的证书颁发机构颁发的证书。

**三、重启 Nginx**

使配置生效：

```bash
sudo systemctl restart nginx
```

现在，通过域名 `www.test.com` 可以访问到 Nginx 服务中的主页页面、图片文件和文本文件，并且 HTTP 请求会自动跳转到 HTTPS。

## 二、



















## 其他

```bash
[root@ecs3 ~]# find / -name *.pem 2>/dev/null
/etc/pki/ca-trust/extracted/pem/tls-ca-bundle.pem
/etc/pki/ca-trust/extracted/pem/objsign-ca-bundle.pem
/etc/pki/tls/cert.pem
/etc/pki/CA/newcerts/00.pem
```

