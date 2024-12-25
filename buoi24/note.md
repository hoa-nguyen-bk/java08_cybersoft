# Buổi 24: Bootstrap

Sự khác biệt Framework và Library

Giới thiệu Bootstrap 
- tại sao xài bootstrap mà ko xài ant design, mui, tailwind


Nhớ copy cái link cdn
- link css dùng để style
- link js dùng để animation với logic code

=> Bằng trung tâm có giá trị theo luật lun đó, vì đã đăng kí với bộ giáo dục rồi, có mail edu luôn

- canh cái lớp sắp mở -> dễ trả giá

Bước 1:
```
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

</head>

<body>


  
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
    crossorigin="anonymous"></script>
</body>

</html>
```

- tại sao lại để cái thẻ script xuống dưới cùng mà ko để lên trên? - dễ bị hỏi khi làm intern/fresher front-end
  - ko phải do file nó nặng
  - bản chất của html là lỗi ko báo
    - vậy nên khi để script ở trên thì nó ko ra giao diện, nó lỗi cái gì thì đâu có báo đâu -> nó ko ra giao diện lun hoy
    - vậy nên để lên trên là nó ko ra giao diện cho mình zòi
    - vậy nên để xún dưới

- Giới thiệu component Bootstrap: 
  - card
  - carousel
  - horizontal

- khái niệm responsive:
  - giúp xem được web trên điện thoại, tablet, vẫn xem được đầy đủ nội dung mà ko bị 
  - giới thiệu grid
  - 1 dòng 12 cột, khi anh Bình mún ở kích thước màn hình web, anh Bình mún 6 card ở trên màn hình, thì mỗi card sẽ bao nhiêu cột?
  - tương tự với mún 3 card
  - container
    - mún có khoảng trống ở 2 bên
  - container fluid
  - Mún màn hình Ipad hiển thị bao nhiêu item? màn hình phone hiển thị bao nhiêu item? 
- giới thiệu:
  - row
  - col
  - -md, -sm: small
  - https://getbootstrap.com/docs/5.3/layout/grid/#grid-options
  - cách chia cột ứng với từng màn hình của mình
  - slide nó hơi cũ
  - đủ 12 thì ko xún dòng, hông đủ 12 thì làm dòng mới
- @media
  - ⁦https://www.w3schools.com/cssref/atrule_media.php⁩
@media hay nhắm nhen anh em, tùy chỉnh kính thước cụ thể hơn lun

- câu hỏi: học đến đâu mới đủ?
  - quan trọng là học mấy thèn core, hầu như toàn bộ core của mấy ngôn ngữ giống nhau về khái niệm

- câu hỏi: ví dụ học java xong làm python thì sao?
  - chiện bình thường, làm nhận 