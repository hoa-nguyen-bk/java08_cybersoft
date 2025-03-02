### B1 tìm Mysql:

https://hub.docker.com/search?q=mysql
thêm trusted content là Docker Official Image
tiếp thì Verified Publisher, tiếp là Sponsored Oss
tags được hiểu là version nha 

### B2 lệnh tải images từ docker hub về docker
```
docker pull tên_image
```
thêm :version (docker gọi là tag )

### B3 check xem đã tải xong chưa, 
lệnh dùng để xem toàn bộ images trên docker
```
docker images
```

### B4 lệnh chạy ứng dụng
```
docker run --name tên_ứng_dụng_tự_đặt tên_images
```

trong đó
$ docker run --name some-mysql -e MYSQL_ROOT_PASSWORD=my-secret-pw -d mysql:tag

chữ -e là biến môi trường enviroment, tùy gói images thì biến moi trường sẽ khác nhau
-d là detach, là có trên môi trường đó đc, là hông cho ứng dụng này chiếm terminal, nên phải chạy -d để nhả terminal ra, ko cho chím terminal

nên mình chạy
```
docker run --name mysql08 -e MYSQL_ROOT_PASSWORD=admin123 -d mysql
```

### B5 bật dbeaver

### B6 tìm connect của docker

#### 1. tìm hiểu về server name:
IP address (Địa chỉ IP):
- `ipconfig` (window)
- `ifconfig` (macos)
2 cái máy chung đường mạng thì mới kết nối đc vz nhau

127.0.0.1 => ip local

domain là tên miền: 
- đang đại diện cho địa chỉ ip nào đó
- ví dụ ping vnexpress.net ra được `111.65.250.2`, tại hông nhớ nên 
- còn domain của máy tính sẽ gọi là localhost

#### 2. tìm hiểu port
mysql08 > inspect > tắt raw json > ports > 3306

#### 3. quên pass thì sao

mysql08 > inspect > tắt raw json > ports > MYSQL_ROOT_PASSWORD

#### 4. sửa lỗi public retrive key
nếu mà ko có thì tự điền zô
ở trên mở tab `driver properties` bên cạnh tab `main` > allowPublicKeyRetrieval > thành true

**Note:** nhưng nó vẫn bị fail khi test connection

vậy check thử coi máy local đúng ko
`ping localhost`

phải xài telnet mạnh hơn xịn hơns
phải cài telnet zô
`telnet localhost`

https://kb.pavietnam.vn/huong-dan-cai-dat-telnet-client-tren-windows-va-su-dung.html
bật telnet trên win 10, win 10 có sẵn á hơm phải cài nha

tức là máy đang bị firewall chặn, có 2 cái là publish port và private port, nên tạo cổng đại diện vô port 3307 là publish port, để dbeaver truy cập zô

mà lỡ tạo cái mysql container rồi, nên xóa đi tạo lại

#### 5. tạo public port ở connect mới of dbeaver
nếu 2 ứng dụng nằm trên 2 máy khác nhau phải dùng ánh xạ port
```
docker run --name mysql08 -p 3307:3306 -e MYSQL_ROOT_PASSWORD=admin123 -d mysql
```
- -p 3307:3306: là chỉ định public port 3307 cho private port 3306

vậy nếu cài dbeaver lên docker thì 2 thèn chung ngôi nhà sẽ gọi chung ngôi nhà được, phải gọi private, nhớ sơ đồ và nhớ hình lun

xong test connection thì giờ chạy đc rồi đó

ví dụ mình ko connect đc localhost thì sao

zô etc >home>check localhost

mình ko biết public ip của mình thì search

what is my ip address

#### 6. Để tạo máy liên kết dbeaver
```
username: root
pass: admin123
```
nhớ set
allowPublicKeyRetrieval: TRUE
