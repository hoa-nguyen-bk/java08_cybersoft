## Giới thiệu
- Html xây dựng giao diện
- data base csdl
- java core logic code

## Servlet cũ nhưng còn xài nhiều (20%)
- người ta còn đang chuyển giao
- giúp kết hợp file html có giao diện và thông qua servlet và giúp xử lý logic code trong html luôn
- servlet giúp xây dựng web hoàn chỉnh luôn

### khải niệm client và server
- user người dùng - cgl client
  - để client xài được thì cần triển khai lên server
  - client giúp máy tính cá nhân
- khái niệm url: thông qua url để gọi lên server
- ở trong server mình tạo cái request, sau đó server sẽ trả giá trị về, 
máy tính cá nhân
```
##########     request
| client |   ----------> 
##########
```
### http và https
https là security còn http ko có security, giờ người ta iu cầu mua domain thì cần trust domain của mình

- **ví dụ**: khi hacker đứng giữa bắt gói tin bắt giá trị muốn server xử lý và gửi giá trị cho server, nên https thì được mã hóa thì giải mã tốn thời gian mà giải xong thì đã được server reponse xong rồi

### 1 request chứa
- 1 header
  - request url
  - method
  - status code
  - ...
- 1 body thì nhìn cho biết hoy
  - chứa giá trị parameter client truyền lên mún server xử lý như email password khi đăng nhập
## servlet
- servlet có đăng ký đường dẫn mà mình xử lý, 
- câu hỏi về 100 người dùng truy cập cùng lúc thì như nào? dùng thread, nhiều luồng quá thì sẽ có giới hạn. giống cpu cũng có giới hạn thui, ko quan trọng nhanh bao nhiêu mà quan trọng bao nhiêu luồng hoy

## tóm lại
- request, response, server, https, cliend server, body header

## cài servlet
cài cái  "Eclipse enterprise Java and Web developer Tool 3.35"  trong eclipse marketplace

## khái niệm đóng gói ứng dụng
- để server chạy đc ứng dụng java mình đóng gói:
  - cần cái đc gọi là tomcat server
- Tomcat server để quản lý
  - có bao nhiêu ứng dụng đang chạy trên server
  - ứng dụng tốn nhiu ram nhiu gb 
  - sau này thì hông xài tomcat nữa mà sẽ học xài docker
  - đa số sau này xài tomcat server
- eclipse sẽ tích hợp tomcat server vào luôn

## cách tích hợp tomcat server vào eclipse
- cài tomcat 9 ở [đây](https://tomcat.apache.org/download-90.cgi)
- chọn tar.jz là gói portable khỏi giải nén cứ thế down về giải nén thôi
- chọn File > New > Other. Nó hiện hộp thoại "Select a wizard", trong cái ô danh sách tìm cái folder Server > Server > Next
- Nó hiện tiếp "Select the server type" chọn Apache > (nãy tải tomcat 9 nên) Tomcat v9.0 Server. Nhớ chỗ dưới này hông đổi gì hết
- Nó hiện tiếp "Tomcat installation directory:" browser cái file mình mới tải về, xong nhấn open cái folder đó, xong finish

## monilithic 
fe be chung 1 source, hiện tại servlet mình đang fe be chung 1 source, sau này sẽ tách ra 2 source fe be khác nhau

## tạo dự án
- File>new>Other>
- Select a wizard chọn Web>Dynamic Web Project
- Hiện hộp thoại tạo mới project
  - Project name: buoi25_dynamic-web-project
  - Target runtime: tomcat 9 (nó tự chọn)
  - Dynamic web version: 4 (default)
- Next > Next> Tới bước chọn Web module:
  - nó có checkbox: "Generate web.xml deployment descriptor", đừng có check vào đó nha, nó sẽ tạo xml dài khó nhớ ko chịu nhắc lệnh

### giới thiệu các folder
- java resource
  - src/main/java
    - nơi xử lý logic code của web
    - lấy dữ liệu db vâng vâng 
- src/main/java chỉ là ánh xạ thôi ko liên quan, đừng có xóa lỗi chừ
- src/main/webapp
  - META-INF: ko quan trọng nhưng đừng xóa
  - WEB-INF: cấu hình trang web server
    - lib: thư viện bên ngoài, copy vào cho servlet xài, nếu ko có thì tự tạo ra

## bắt đầu dự án
- **Bước 1**: vào java resource
  - click phải src/main/java chọn new > package đặt tên `buoi25_dynamic-web-project`
  - click phải vào package mới tạo new > class > Đặt tên class: DemoServlet
  - gõ thêm `extends HttpServlet` vào sau class, nhớ tab ra cho nó import `HttpServlet`
- **Bước 2**: tạo xong servlet rồi nhưng nó chưa hoạt động, mún hoạt động vào add servlet này vào servlet container, phải thêm file xml. 
  - Cách 1 khai báo giống slide 21 trong buoi-01-servlet.pdf
  - cách 2: dùng annotation là class/cấu hình người ta làm sẵn tự cấu hình cho mình sẵn luôn, kí hiệu `@` mình muốn sử dụng nó thì sử dụng luôn
    - thêm vào trước cái public class nhé, mún dùng nhiều đường dần thì dùng `{}`:
``` java
@WebServlet(name="demoServlet", urlPatterns = {"/demo"})
```
- **Bước 3**: trong cái class gõ `doGet` nó gợi ý xong enter theo gợi ý luôn nó sẽ ra nguyên cái hàm doGet
  - chỗ này đang giải thích về phương thức method
  - để ý hàm này có `req` và `res` chính là response và request anh đã giải thích
- **Bước 4**: viết vào trong hàm doGet
``` java
PrintWriter writer = resp.getWriter();
writer.append("Hello world");

writer.close();
```
- **Bước 5**: click phải vào folder project `buoi25_dynamic-web-project` của mình > Run As > 1 Run on Server 
  - hiện hộp thoại "How do you want to select the server?" > "Choose an existing server" 
    - trong hộp con Server chọn localhost (mở sẵn) > Tomcat v9.0 Server at localhost (nhớ click chọn cái này)
    - bấm next ra bước "Add and Remove"
      - bên trái là các ứng dụng chưa triển khai Tomcat
      - bên phải là ứng dụng đang đã triển khai tomcat
    - để nó triển khai thì bên trái nhấn add qua bên phải
    - bấm next
  - nó sẽ ra trang HTTP Status 404 - Not Found 
    - nó ra 404 vì hiện tại url nó là `localhost:8080/buoi25_dynamic-web-project/` và cái đường dẫn trả về dấu xuyệt ko thôi `/`, nó đang gọi con servlet có dấu `/` xử lý, lúc này server tìm trong server container tìm con server có dấu / thì xử lý mà ko có nên nó 404
  - nên là mình thêm cái chữ demo vào thành `localhost:8080/buoi25_dynamic-web-project/demo` thì nó sẽ ra `Hello world`
    - lúc này servlet tìm trong servlet container thấy mình mới tạo cái servlet xử lý `/demo` thì nó gọi ngay đến class DemoServlet
    - nhưng mình cũng gọi nhiều phương thức mà, mình đâu có chỉ định phương thức get mà nó gọi theo phương thức doGet --> vì nếu người dùng ko chỉ định phương thức thì nó sẽ mặc định chỉ định phương thức get
  - hồi xưa có nhiều do lắm 24 cái lận xong bỏ còn 4 cái do thôi doGet doPost doDelete,... 1 phần là ko ai xài
  - nếu mình ko gõ `writer.close();` thì có vấn đề gì ko ? có thì nó sẽ dừng luôn server, vậy nên sau này mới có vụ tách fe be. 
  - với hệ thống như vầy mình chỉ chịu được 100 user 1 lúc thôi, sau này tách febe thì có thể chịu đến 100 tr user 1 lúc luôn
- **Bước 6**: click phải vào package `buoi25_dynamic-web-project` tạo class `LoginServlet`
  - nhớ muốn biến class thành servlet thì thêm kế thừa `extends HttpServlet` nhớ xài nhắc lệnh cho nó tự động import 
  - để servlet được add vào servlet container bằng cách dùng annotation `@WebServlet` nó có nhắc lệnh để mà import vào 
``` java
@WebServlet(name="loginServlet",urlPatterns={"/login"})
```
- **Bước 7**: bên trong class thêm `doGet`
  - nhớ là có bất kì file html thì bỏ vào `src/main/webapp`, copy từ source cybersoft bỏ vào bên trong webapp cái file `demobootstrap.html`
  - gõ bên trong `doGet`
``` java
req.getRequestDispatcher("demobootstrap.html").forward(req,resp);
```

  - khi gõ `getRequestDispatcher` là nó đã hiểu mình gọi vô webapp rồi nên mình cứ gọi tới file html là `demobootstrap.html` rồi chấm forward tự tab thôi
  - rồi nhớ chọn folder > Run as > 1. Run on server thôi
  - nó vẫn sẽ lên 404 - Not Found nha, vậy nên phải xẹt thêm cái login nữa rồi enter, nó sẽ ra được cái demobootstrap bữa mình làm
    - khi gặp code doGet nó sẽ iu cầu chạy file demoboostrap.html nó sẽ đọc từng dòng xong nó gặp forward nó sẽ tạo PrintWriter như cái bên trên, nó sẽ getWriter(), và nó biến từng cái code html thành code java. Ví dụ như ở dưới nè
``` java
PrintWriter writer = resp.getWriter();
writer.append("<!DOCTYPE html>");
writer.append("<html lang=en>");
...
writer.close();
```

Bữa sau học cách truyền và nhận tham số và cách xử lý logic code 
