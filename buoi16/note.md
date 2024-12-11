# Buổi 16 (27/12)
## 1. Giới thiệu SQL
điện thoại lưu trữ hệ csdl trên sqllite

tìm csdl trên excel khó, nhưng cơ sở dữ liệu dễ, truy vấn dữ liệu thì khó

người ta thường lưu trữ trong 1 cái mysql, cái mysql có nhiều database

### Nguyên tắc:
- những lệnh liên quan đến script của db đều phải viết hoa hết, để còn đưa cho khách hàng
- Tên database: 
  - viết thường hết, ko được phép có dấu cách
  - muốn cách ra cho dễ nhìn thì dùng gạch điss - snake_case
  - không thì viết liền cũng được

#### Kiểu dữ liệu
- chuỗi
- số nguyên
- số thực
- boolean
- ngày tháng

mỗi csdl mỗi khác nên chỉ cần nhớ 5 cái này là được

có thể lên mạng search mỗi chuỗi 1 khác mà nên search "data type + tên csdl"

thực ra bản chất nó là chuỗi

cái hay của tool báo lỗi là analytic thống kê tốc độ, nhanh chỗ nào chậm chỗ nào --> liên quan tới tối ưu

có các csdl phân biệt, như là mysql 
- nháy đơn: biểu hiện chuỗi (hầu hết csdl)
- nháy kép: column

cái tên table báo đỏ là do tool free nên nó đòi mình mua cho nó khỏi báo lỗi đó

nhớ tiếng anh WHERE là câu điều kiện

Trong lệnh SELECT, Nên xài chỉ định cột hay SELECT *?

Thử xài thủ thuật Deffered, đánh Index, kĩ thuật chia bảng con, tách nhỏ câu truy vấn

nhưng câu update và câu delete cực kì nguy hiểm, khi duyệt qua từng dòng, dòng nào hợp điều kiện where thì nó update/delete luôn

#### câu hỏi: có 2 cột trùng nội dung vậy làm sao xóa chỉ duy nhứt 1 cột hoy?

-->khóa chính

# Buổi 17 (1/12)

### Relation ship
Để liên kết dữ liệu của 2 bảng lại với nhau chỉ cần có một cột chứa dữ liệu trùng với một cột nào đó của bảng cần liên kết dữ liệu là được

### Lệnh chỉnh sửa bảng
Đối với cột kiểu số nguyên, thì có thể thêm tự động tăng `auto_increment`


### Sự khác biệt giữa SELECT và JOIN trong relation ship 2 bảng, tại sao xài phép tích hông xài phép join?
phép tích liên kết dữ liệu giữa 2 bảng với nhau, và sau đó mình lọc lại dữ liệu theo điều kiện where để cho dữ liệu đúng lọc lại
- phép tích sẽ cú pháp giống này:
```
for(){
  for(){
    thêm cột mới
  }
}
for(){
  if(){
    để lọc lại điều kiện thỏa
  }
}
```


thực ra phép `join` hoạt động ko khác gì phép tích, nhưng trong quá trình liên kết dữ liệu giữa 2 bảng, thì nó so sánh luôn
- cú pháp
```
for(){
  for(){
    if(){
      thỏa điều kiện mới thêm cột mới
    }
  }
}
```

giả dụ bên bảng danh mục xóa cái 4. thời sự đi, xóa đi

### Left join


### Right join


## lệnh tạo khóa ngoại
Các Bước tên bảng tạo trước, tên cột khóa ngoại tạo trước, tên cột chỉ định khóa ngoại chỉ định sau
### tên bảng viết hoa viết or thường có báo lỗi k thầy ơi?
--> viết sao cũng được, nhưng mà theo quy tắc của mình là tên bảng viết thường đi

### mối quan hệ giữa 2 bảng
Định nghĩa miệng, nên đặt khóa ngoại chỗ nào để tránh bị duplicate nhiều nhất có thể --> lý do cãi nhaooo
- OneToOne 1-1
  - 1 dòng dữ liệu của bảng A sẽ chỉ lấy được 1 dòng dữ liệu của bảng kia
  - khóa ngoại nằm ở đâu cũng được nhưng cột đóng vai trò khóa ngoại kiêm luôn khóa chính
  - Dành cho việc lưu trữ thông tin chi tiết cho 1 đối tượng nào đó -> 1:1
  - ví dụ 
```
1 user - 1 password
1 user - 1 user detail (số nhà, số điện thoại, tỉnh thành ble ble)
```
- OneToMany 1-n
  - 1 dòng dữ liệu của bảng này sẽ lấy được nhiều dòng dữ liệu của bảng kia
  - trong quan hệ 1-n thì nó nằm ở bảng nhiều, vẫn có khóa chính bình thường
  - mình làm đúng 1 chiều hoy, nhiều bài viết thuộc về 1 danh mục, vậy suy ra một danh mục có nhiều bài viết 
  - Chỉ phân tích 1 chiều hoy, bước làm như sau: Típ của anh Bình: Thử đặt khóa ngoại ở 1 bảng trước, nếu mà khóa ngoại đó bị trùng nhiều thì bảng đó chính là bảng nhiều, và bảng còn lại là bảng 1 
- ManyToOne n-1
  - nhiều dòng dữ liệu của bảng này sẽ lấy được 1 dòng dữ liệu của bảng kia
  - n-1 thì khóa ngoại nằm ở bảng nhiều 
- ManyToMany n-n
  - một dòng dữ liệu của bảng này sẽ lấy được nhiều dòng dữ liệu của bảng kia
  - và 1 dòng dữ liệu của bảng kia sẽ lấy được nhiều dòng dữ liệu của bảng này
  - thì sẽ phát sinh một bảng trung gian (bảng thứ ba, tuesday)
    - lúc đó 2 bảng sẽ có mối quan hệ nhiều nhiều với tuesday
    - bảng này với bảng m với n sẽ có khóa chính của cả 2 luôn
    - tuesday sẽ có 2 cột cùng đóng vai trò là khóa chính và khóa ngoại
  - Ví dụ: một bài viết có nhiều thể loại, và một thể loại cũng có nhiều bài viết, ta không đặt khóa ngoại ở bảng bài viết hoặc là bảng thể loại được.
  - Lúc đó ta tạo 1 bảng trung gian `BaiViet_DanhMuc` chứa 1 cột là `id_baiviet` và `id_danhmuc`:
    - `id_baiviet` là n - 1 với bảng bài viết
    - `id_theloai` là n - 1 với bảng thể loại
    - 2 cái `id_baiviet` và `id_theloai` đều là khóa chính của mình
    - 1 cái erd tạo ra nhiều 

giúp xác định khóa ngoại nằm bên bảng nào cho ít bị trùng dữ liệu

# Buổi 18

100%: dự án thành công là ở
50% Database
20% logic code
20% devops
10% communicate 

### Vẽ erd
**Bước 1**: chờ ba cung cấp mockup hoặc chờ designer cung cấp UX/UI. Mockup thì sơ sài nhưng mà design làm cái layout có tâm hơn.

**Bước 2**: Xong đi tìm đối tượng trong từng màn hình

**Bước 3**: Tìm thuộc tính của đối tượng

**Bước 4**: Nếu trong 1 màn hình mà tìm nhiều hơn 1 đối tượng thì chắc chắn các đối tượng trong màn hình đó sẽ có quan hệ với nhau  

- cách đặt tên khóa ngoại:
  - id-bảng khóa ngoại
  - bảng khóa ngoại-id

--> Đừng sáng tạo tên mới nhen

#### Hướng dẫn microserver
anh Bình sẽ hứa chỉ kĩ thuật liên quan đến microservice
GateWay, Caching, Queue (Kafka, RabbitMQ,...), Network, Security, ESB như KeyCloak, Prometheus, Grafana, Elaticsearch, Kibana, Logtash, 

CI/CD: Jenkins

Docker