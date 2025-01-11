# buổi 26

### note
buổi sau anh sẽ giải đồ án giữa khóa luôn để mình đẩy nhanh số buổi lên để mình có nhiều buổi sprint boot hơn, này đang thử lớp mình
anh muốn đẩy nhanh servlet thôi
anh muốn để dành qua microservice, ko biết mình có dư được 4,5 buổi cuối ko

## buổi nay 
- học tiếp servlet, mình vẫn sẽ cách cũ 1 buổi rồi buổi sau đi đồ án giữa khóa luôn

- mình cần quy định tham số khi gọi đường dẫn (truyền và nhận giá trị từ client)
  - cách xử lý logic code ở file html
- ôn lại Request luôn gửi lên
  - Header
    - url:/demo
    - method: 
      - GET: tham số truyền trực tiếp trên trình duyệt
        - example: http://localhost?tenthamso=giatri&tenthamso2=giatri
        - có giới hạn nhen? giới hạn 2048 kí tự thôi
        - ko thể truyền password lên url được vì nó ko bảo mật
      - POST: tham số sẽ truyền ngầm
        - giới hạn lớn hơn mà nó có thể tới mấy chục gb, nhưng nó chiếm băng thông, chậm lag 
        - bảo mật hơn cách kia, giới hạn theo phần cứng và phần cứng có thể scale được => ko giới hạn
        - cách cách truyền ngầm
          - thẻ form html
          - tự code (làm quài, phải biết nhen)
          - 
  - Body
    - tham số
- note ngoài: 
  - học microservice ram 8gb cần nâng cấp liền còn ram 16gb chạy đc nhưng win sẽ hơi lag

- Bước 1: bên trong doGet của login tiếp tục
```
String username = req.getParametter("username");
int age = Integer.parseInt(req.getParameter("age"));

Sout("Kiemtra "+)
```