# buổi 43

btvn:
- nhìn sơ đồ xong tự dựng lại được

- anh Bình đọc: [upload file](https://www.bezkoder.com/spring-boot-file-upload/?fbclid=IwZXh0bgNhZW0CMTEAAR0IxztzGzLZtw5d8e7SDbSJcitjV_Qtk8aWV7oUtsvQrDKMbOsp8d0pSMA_aem_KRaB_d5Fu9m1NUWbGsepTQ#google_vignette)


lưu image zô db:
- tạo ra 1 record mới đại diện cho 1 sản phẩm
- để lưu lại nguyên cái hình, lưu vào trong db của mình, cột này mình làm sao mình lưu nguyên cái hình cái áo luôn, để khi mình truy vẫn được mình lưu zô
- 1 là lưu dạng binary:
  - front-ned đưa về dạng byte
- 2 là lưu dạng base64:
  - front-end đưa về dạng binary, backend biến dạng base64
  - lưu trực tiếp vào db, nhưng lưu trực tiếp zô db nó sẽ bị rủi ro ở đầu db, bị phình dung lượng do hình lưu trữ dung lượng lớn, query sẽ chậm
  - sau này load balancer khó xử lý
  - file hình mình lưu trên ổ cứng
  - khi front-end upload tên hình lên mình lưu hình trong db
  - với lại ổ cứng hư, backup sẽ dễ
  - hình lưu ổ cứng, db lưu cái tên hình

- dựa vào cái link trên làm:
  1. upload file 30'