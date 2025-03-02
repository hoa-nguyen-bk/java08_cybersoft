## buổi 37
bữa sau a sẽ giải đồ án cuối khóa


Viết trên Inteligi, JPA bảng nào chứa khóa ngoại:
- many to one 
- join column

Bảng còn lại sẽ là one to many
Không có zụ many to many

```cmd
Caused by: org.hibernate.MappingException: Column 'roles_id' is duplicated in mapping for entity 'com.example.demo_buoi36_jpa.entity.UsersRoles' (use '@Column(insertable=false, updatable=false)' when mapping multiple properties to the same column)
```
cái này chỉ xảy ra ở bảng chứa 2 hay nhiều cột là 1 khóa chính thì nó sẽ bị

ở chỗ mapping này các bạn sẽ tự thêm thêm dòng này
```
, insertable = false, updatable = false
```

```
[
    {
        "id": 1,
        "username": "hoa@gmail.com",
        "password": "123456",
        "usersRoles": [
            {
                "id": {
                    "rolesId": 1,
                    "usersId": 1
                },
                "roles": {
                    "id": 1,
                    "name": "ROLE_ADMIN",
                    "usersRoles": [
                        {
                            "id": {
                                "rolesId": 1,
                                "usersId": 1
                            },
                            "roles": {
                                "id": 1,
                                "name": "ROLE_ADMIN",
                                "usersRoles": [
                                    {
                                        "id": {
                                            "rolesId": 1,
                                            "usersId": 1
                                        },
                                        "roles": {
                                            "id": 1,
                                            "name": "ROLE_ADMIN",
                                            "usersRoles": []
```
lỗi vòng lặp vô tận

bản chất jpa, truy vấn hộ cho mình luôn 

nó từ userId nó tự động truy vấn bảng role luôn

usersRoles là 1 list đối tượng, nên nó lặp 1 cái mảng 

```java
    @JsonIgnore
    @ManyToOne
    @JoinColumn(name="roles_id", insertable = false, updatable = false)
    private Roles roles;
```

dto:
- tránh lộ tên cột mình ko mún
- để kiểm soát tên cột trả ra ứng với front-end yêu cầu
- tận dụng thằng tự động truy vấn bảng liên kết khóa ngoại của jpa

còn cách khác tên là Map struct

làm userDto, bên userController gọi qua


BTVN:
- sửa crud của uniclub, và anh sẽ 
- phân tích dự án hoàn chỉnh 
- db dự án như nào
