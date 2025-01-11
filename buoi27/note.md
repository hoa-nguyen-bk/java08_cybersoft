# buổi 27

design pattern
- strategy design pattern sẽ nằm ở folder java 

lấy logincrm.zip tải về
tạo lại cái package buoi27.controller > loginController

làm cái phương thức post
người dùng sẽ nhập emial và mật khẩu và kiểm tra xem email và mật khẩu có tồn tại không
nếu có tồn tại thì đăng nhập thành công

## remember me
có cách nào lưu nhanh, lưu xong lấy lun, thì trong java hoặc bất kì web nào đều có cookie và session
cả cookie và session lưu trữ dữ liệu nhanh
- cookie và session khác biệt gì nhau?
  - cookie Dữ liệu lưu trên máy người dùng (lưu trong ổ đĩa)
    - mà vì lưu trên ổ đĩa, máy người dùng nên là tính bảo mật 
    - chuyển qua lưu trữ cookie bằng thuật toán mã khóa
    - khi server sập thì giá trị lưu cookie thì còn
  - Session dữ liệu lưu trên server (RAM)
    - nhưng bên ngoài hông cho xài session vì nó tốn ram
    - nên là mình hông xài session lun
    - khi server sập giá trị lưu trên ram là mất

- cách lưu trên cookie, trong browser lun có key session_id, session và cookie có cái gán time hết hạn, nếu ko gán time hết hạn thì nó sẽ lưu vĩnh viên, đến time đến hạn nó sẽ 
- slide có nói đặt time hết hạn của cookie
- cookie lưu email 1 key và pass 1 key

đọc code mới vào dự án
1. đầu tiên là phải hiểu nghiệp vụ, có 2 cách hiểu nghiệp vụ
   1. hỏi người khác, đọc tài liệu
   2. đọc tài liệu -> suy ra nghiệp vụ, đi hỏi nghiệp vụ và confirm xem có đúng ko

java 8 đổ lên mạnh về stream api, tập hợp function hỗ trợ sẵn mà mình hay xử lý thường xuyên, sau này cũng học đầy đủ yên tâm

bữa sau mình học truy vấn csdl và anh sẽ chỉ cách phân tích cs dữ liệu cho 1 dự án, và mình sẽ kết nối csdl và xử lý lun