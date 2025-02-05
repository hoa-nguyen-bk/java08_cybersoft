Ba -> gặp khách hàng lấy iu cầu -> phân tích (cần gì -> các tính năng của khách hàng): use case, sequence, ...
designer: vẽ các màn hình chức năng theo iu cầu của BA, chờ designer
- Back End:
  - Phân tích cơ sở dữ liệu (50%)
  - bảng nào có csdl nào, các mối quan hệ ra sao? ->  đối với người mới là phải chờ ui từ designer hoặc mock up từ ba
  - tạo dự án
  - viết api

- hạn chế làm trễ task quài -> dễ bị ăn biên bản -> ăn biên bản thì bị công đoàn kí -> hr kí một cái dễ lên thớt
- Đáp ứng được toàn bộ nhu cầu tính năng của dự án
- Đã giúp luôn việc tối ưu.

### Các bước phân tích csdl:
**Bước 1**: Đi qua từng màn hình và xác định đối tượng phục vụ hoặc sử dụng cho màn hình đó

**Bước 2**: Tìm thuộc tính của các đối tượng có trong màn hình đó

**Bước 3**: Nếu như một màn hình mà tìm thấy nhiều hơn 1 đối tượng thì chắc chắn đối tượng bên trong màn hình đó có quan hệ với nhau (OneToOne, OneToMany,...)
- bước này là bước quan trọng nhất
- ghê lắm mình xài được 1 NF, khi nào xài 1 NF, 2 NF thì mình cũng ko biết, vì người ta chỉ cần mình phân tích được và ra được chức năng dự án, còn tối ưu thì để sau tính

đồ án cuối khóa thì tự tìm đề tài để tự phân tích csdl, tự phân tích csdl 

- Phân tích cái màn hình login
  - B1: mở draw io ra tạo cái bảng mới
  - B2: tạo cái bảng user -> 
  - B3: gặp cái gì theo cụm theo nhóm select box -> theo 1 đối tượng
  - B4: thằng nào giữ chữ N thì nó nắm khóa ngoại
    - 1 thằng admin có nhiều user sở hữu 
    - 1 role của mình có nhiều user sở hữu (đặt khóa ngoại ở user)
    - nhiều nên là id_role
    - phân tích lại
      - user A có role Admin được ko? đc
      - user B có role Admin được ko? đc
      - vậy user đc có nhiều role ko? ko -> 1 role có nhiều user ko? có
      - vậy nên nhiều là user nắm -> user giữ khóa ngoạiư
- Tại sao bảng role lại để 1 bảng riêng mà hông để zô user lun?
   
#### tại sao lại xài kiểu uuid chứ ko phải kiểu int? 
- để bảo mật hơn
- tại vì int thì chỉ có tối thiểu là -2,147,483,648 và tối đa 2,147,483,647 còn cái uuid thì lại là string -> chứa được nhiều recỏd hơn, làm phép cshặp nhẹ nhẹ thấy nó chứ được nhiều hơn, mình ko có cơ hội đổi kiểu dữ liệu khi mình phân tích sai
- cơ mà ở đây anh ko hướng dẫn nên mình xài kiểu int hoy

### mở ra kết nối servlet với dbeaver
- mở docker và dbeaver
- bữa cho làm cái bài tập query dữ liệu để tập cho mình connect csdl
- JDBC 
  - DriverManager: Quản lý danh sách các Driver. 
  - Driver: Liên kết các kết nối tới CSDL. 
  - Connection: Để quản lý các kết nối. 
  - để thực hiện câu truy vấn thì dùng 3 cái luôn, Dùng để thực thi các câu lệnh SQL. :
    - Statement: giống PreparedStatement là 2 thằng cachelest câu truy vấn còn cái dưới ko có
    - PreparedStatement: để thực thi câu truy vấn là chính 
    - CallableStatement: 
      - procedure, function sau này trong csdl nâng cao mới đụng zô hoy
  - ResultSet: Biểu diễn tập kết quả trong CSDL khi sử dụng câu lệnh SELECT.
    - đại diện cho đống dữ liệu mình truy vấn được
  - SQLExeption: Lớp xử lý lỗi ngoại lệ. 
    - dĩ nhiên khi truy vấn luôn có lỗi xảy ra nên mới bảo cần cái SQL Exception.

### các bước kết nối csdl -> cần jdbc -> download thư viện
- trong tất cả mọi thứ tập hợp thư viện java ta có 1 thứ dùng để tập hợp các thư viện tên là: 
[Thư viện maven](https://mvnrepository.com/)

- gõ search jdbc mysql
- tìm MySQL Connector Java này là cái cũ có 8k user
- 8.0.30 
- tìm jar, phải là jar nhé
- tải zìa cop bỏ zô src > webapp > WEB-INF > lib

Chuẩn bị câu truy vấn tương ứng với chức năng đang làm 

## Làm btvn:
làm list user, trả về jsp, duyệt từng dòng, lấy dữ liệu và trả về giao diện, trả ra bên ui và duyệt qua từng dòng bên ui, xài vòng lặp for, kết hợp jstl, phải đi tìm hỉu và làm phần đó

a demo cái đó,
có cái mảng 
```java
List<String> listTemp = new ArrayList<String>();
listTamp.add("abc");
sout(listTamp.size());
```

nó sẽ tạo file tạm chứa toàn bộ bạn ko thay đổi gì hết, nó sẽ sử dụng file tạm đó, đây là tính chất riêng của servlet, nếu mà code gì đó xonng lưu lại thì nó 



