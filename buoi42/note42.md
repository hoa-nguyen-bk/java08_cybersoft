# buổi 42

hỏi trí zụ bản quyền, reset đồ đó

sha1
- Phỏng vấn: cơ chế hoạt động của jwt? cơ chế hoạt động của token của mình hoạt động ntn
  - để tránh truyền username password, vì risk của username password rất cao, dễ bị ăn cắp
  - khi gọi các api cần chứng thực, vậy thì mình bị spam db liên tục, ko hợp lý
  - đại diện cho 1 token hoạt động thành công hay 
    - xong server sẽ giải mã token đó, giải mã được là đăng nhập thành công, ko được là đăng nhập thất bại


![alt text](image.png)

- tại sao lại xài token

bây giờ bài tập tại lớp, viết cho anh cái hàm giải mã token truyền vào

```java
@Component
public class JwtHelper {
    @Value("${jwt.secret}")
    private String secret;

    public String  generateToken(String data){
        SecretKey key = Keys.hmacShaKeyFor(Decoders.BASE64.decode(secret));
        return Jwts.builder().subject(data).signWith(key).compact();
    }

    public String decodeToken(String token){
        SecretKey key = Keys.hmacShaKeyFor(Decoders.BASE64.decode(secret));
        return Jwts.parser().verifyWith(key).build().parseSignedClaims(token).getPayload().getSubject(); // we need a key
    }
}
```
[tìm code đó ở đây](https://github.com/jwtk/jjwt?tab=readme-ov-file#quickstart)
```java
@Component
public class JwtHelper {

    public String decodeToken(String token){
        SecretKey key = Keys.hmacShaKeyFor(Decoders.BASE64.decode(secret));
        String data = null;
        try {
            data = Jwts.parser().verifyWith(key).build().parseSignedClaims(token).getPayload().getSubject(); // we need a key
        } catch (ExpiredJwtException e){
            System.out.println("Token expired");
        } catch (JwtException e){
            System.out.println("Decode error");
        }
        return data;

    }
}

```
[commit này có hết](https://github.com/hoa-nguyen-bk/uniclub08/commit/6639aaf54b860a37cf8c9676b64fff7d3661cd5a)

```java
@RestController
@RequestMapping("/product")
public class ProductController {
    @PostMapping
    public ResponseEntity<?> insertProduct(){
        return ResponseEntity.ok("Hello insert product");
    }
}

```

thêm cái productController
![alt text](image-1.png)
gọi api /product sẽ bị 403

- bây giờ lấy token gửi lên, và giải mã token đó
- mình truy cập zô spring security context, là tờ giấy thông hành, khi có giấy thông hành security chạy tiếp, cho phép zô api product
- mình cần config cái provider

- tạo provider tạo CustomSecurityProvider
```java
package com.cybersoft.uniclub08.provider;


public class CustomSecurityProvider {

}
```

```java
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.stereotype.Service;
@Service
public class CustomSecurityProvider implements AuthenticationProvider {

}

```

- đưa lên ioc bằng cách xài annotation Service
- thêm implements AuthenticationProvider
- xong bấm generate method cho nó generate ra 2 method

```java
@Service
public class CustomSecurityProvider implements AuthenticationProvider {

    @Override
    public Authentication authenticate(Authentication authentication) throws AuthenticationException {
        return null;
    }

    @Override
    public boolean supports(Class<?> authentication) {
        return false;
    }
}
```









## buổi sau:
- học upload file

### itviec
- cathay dọn rác, 
- acb tuyển quài
- nec theo mentor kha lớp java 07, nec phông bạt
- dosoftpro: dư sức đi làm
- total software bankL 06 fresher/junior software people
- sacombank
- shinhank bank tụi hàn
- mirae asset cạnh tranh cũng ghê, công ty của hàn
- 

- tpi software a bình đang làm
- giờ đang đợt review lương, hông được thì nhìu người nhảy