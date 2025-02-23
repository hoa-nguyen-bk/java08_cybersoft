### buổi 35
- hiểu thế nào về big o? nhìn code đoán được độ phức tạp của giải thuật đó, máy tính của mình tốn bao nhiêu lần xử lý cpu
- big o có khái niệm: phép gán giá trị cho biến luôn có độ phức tạp là 1
- Big O: 
  - phép gán giá trị cho biến: 1,
  - Giá trị xử lý biến thiên: n;
  - xử lý  theo cây nhị phân: logarit, thường là  do hay sử dụng quick search
  - trong thuật toán quick search điều kiện ưu tiên là mảng phải sắp xếp đầu tiên

```c++
int mangA = [1,2,2];
int tam = mangA[0];
for(int i = 0;i<mangA.length;i++){
  if(){
    mangA = tam;
  }
}
```
cái này là n

```c++
int mangA = [1,2,2];
int tam = mangA[0];
for(int i = 0;i<mangA.length;i++){
  for(int j = 0; j < tam; j++){

  }
  if(){
    mangA = tam;
  }
}
```

@RequestParam: quy định tham số client truyền lên cho toàn bộ phương thức
- chỉ với phương thức GET: cách test sẽ điền tham số trên trình duyệt
- mình cần biết cách test api của mình: xài postman
- khác phương thức get post đều là tham số truyền ngầm, để test được thì sử dụng tab body trong postman
  - ko phải là json thì chỉ có thể là form-data hoặc url encoded
@RequestBody: tham số truyền lên là dạng json
- tham số đóng vai trò như 1 đường dẫn
@PathVariable: tham số đóng vai trò như một đường dẫn. Sử dụng được cho toàn bộ phương thức.


```java
@RestController
@RequestMapping("/user")
public class UserController {
    @GetMapping
    public ResponseEntity<?> getUser(){
        return new ResponseEntity<>("Get user", HttpStatus.OK);
    }

    @PostMapping
    public ResponseEntity<?> insertUser(@){
        return new ResponseEntity<>("Get User", HttpStatus.OK);
    }
    
}
```
```java
  @GetMapping
    public ResponseEntity<?> getUser(@RequestParam String username,
                                     @RequestParam String password){
        return new ResponseEntity<>("Get user", HttpStatus.OK);
    }
```

![alt text](image.png)
bad request là thiếu giá trị hoặc truyền lên sai kiển dữ liệu of tham số, nhớ lỗi 400 thì 100% là lỗi liên quan đến tham số

đối với anh thì PathVariable thì 3 tham số là đẹp, nhiều thì rối lắm


getListProduct
```json
[
  {
    "id": "uuid",
    "name": "Điện thoại nổi bật nhất",
    "category": [
      {
        "id": "uuid",
        "name": "Apple",
      },
      {
        "id": "uuid",
        "name": "Oppo",
      },
      {
        "id": "uuid",
        "name": "Samsung",
      }
    ],
    "products":[
      {
            "id": "uuid",
            "title": "iPad Gen 10 10.9 inch 2022 Wifi 64GB I Chính hãng Apple Việt Nam",
            "discount_percent": 18,
            "image": "abc.jpg",
            "price": 12000000,
            "original_price":130000000,
            "s_member_price_discount": 327000,
            "s_student_price_discount": 60000,
            "status_instalment": "ALL",
            "instalment_percent":0,
            "rate": 5,
            "favourite":true,
          }
    ]
  },
]
```


category
```json
{
  "id": "uuid",
  "name": "Apple",
  "group_category_id":"uuid"
}

```

product
```json
{
  "id": "uuid",
  "title": "iPad Gen 10 10.9 inch 2022 Wifi 64GB I Chính hãng Apple Việt Nam",
  "discount_percent": 18,
  "image": "abc.jpg",
  "price": 12000000,
  "s_member_price_discount": 327000,
  "s_student_price_discount": 60000,
  "status_instalment": "ALL",
  "instalment_percent":0,
  "rate": 5,
  "favourite":true,
  "category_id": "uuid"
}
```

discount_type
```json
{
  
}
```

![alt text](image-1.png)

![alt](./MacBook%20Pro%2016_%20-%2021.png)