## buổi 49

![alt text](image.png)

IPAddress: 172.17.0.2s

nếu làm outsourcing nhì junior thì tỉ lệ tham gia càng sớm

![alt text](image-1.png)

mỗi 1 image là 1 máy ảo nhỏ có chạy hđh ở trỏng và có ip riêng, mình sẽ ko gọi được mysql nếu ko gọi được và ko có địa chỉ ip của nó

bỏ cái IP address của bên inteligi qua bên app.java

```sh
Caused by: org.hibernate.HibernateException: Unable to determine Dialect without JDBC metadata (please set 'jakarta.persistence.jdbc.url' for common cases or 'hibernate.dialect' when a custom Dialect implementation must be provided)

Process finished with exit code 1
```


```yaml
server:
  port: 8080

spring:
  datasource:
    url: jdbc:mysql://172.17.0.2:3307/uniclub06 -- chuyển cái này
    username: root
    password: admin123
```

nhưng nó ko cho mình build/install vì nó đang fail ko kết nối được

bên máy mac có phần variable, nó có phần quẩn lý biến env ở đó lun

anh Bình ko hướng dẫn cái .env mà anh bình hướng dẫn xài docker compose

