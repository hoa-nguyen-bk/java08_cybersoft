![alt text](<WEEK VIEW.png>)
Here’s a structured template for the screen you’re working on, following the format you provided:

---

### **Là người dùng, tôi muốn xem và quản lý lịch làm việc của nhân viên trong hệ thống.**  

#### **1. Giao diện chính (Roster View)**
- **Tiêu Đề ("Lịch Làm Việc")**: Đánh dấu rõ đây là trang quản lý lịch trình làm việc của nhân viên.
- **Chọn Cơ Sở**: Dropdown cho phép người dùng chọn một trong các địa điểm làm việc (VD: Rosebery, Parramatta, Melbourne, Liverpool).
- **Chọn Tuần**: Bộ chọn tuần cho phép người dùng thay đổi khoảng thời gian xem lịch làm việc.
- **Thanh Điều Hướng Ngày**: Hiển thị các ngày trong tuần với tổng số giờ làm mỗi ngày.
- **Danh Sách Nhân Viên**: Mỗi nhân viên hiển thị theo hàng, với tên và mã màu riêng biệt.
- **Ca Làm Việc**: Các ô thể hiện thời gian làm việc của từng nhân viên, với mã màu để phân biệt trạng thái hoặc vị trí làm việc.
- **Tổng Doanh Thu**: Thanh hiển thị tổng doanh thu theo từng cơ sở, với chỉ tiêu doanh thu.

#### **2. Tính năng chính**
- **Xem Lịch Theo Cơ Sở**: Cho phép chuyển đổi giữa các chi nhánh để xem lịch nhân viên của từng nơi.
- **Chỉnh Sửa Ca Làm Việc**: Nhấn vào ô thời gian để thay đổi hoặc thêm ca làm cho nhân viên.
- **Xem Doanh Thu Theo Ngày**: Hiển thị doanh thu đạt được trong ngày cho từng cơ sở.
- **Gộp Nhân Viên Làm Việc Ở Nhiều Chi Nhánh**: Nếu nhân viên làm ở nhiều nơi, họ sẽ xuất hiện ở từng chi nhánh với lịch trình tương ứng.

#### **3. API Gọi Trong Trang Lịch Làm Việc**
- **Lấy dữ liệu lịch làm việc**  
  - **Phương thức:** `GET`  
  - **URL:** `/api/schedule?location={branch}&week={weekNumber}`  
  - **Response:**  
    ```json
    {
      "branch": "Rosebery",
      "week": "10-16 Feb",
      "employees": [
        {
          "name": "Jimi",
          "shifts": [
            { "day": "Monday", "hours": 8, "revenue": 500 },
            { "day": "Wednesday", "hours": 8, "revenue": 2500 }
          ]
        }
      ]
    }
    ```

- **Cập nhật lịch làm việc**  
  - **Phương thức:** `POST`  
  - **URL:** `/api/schedule/update`  
  - **Payload:**  
    ```json
    {
      "employee": "Jimi",
      "day": "Monday",
      "newShift": { "hours": 6, "revenue": 400 }
    }
    ```

---

Let me know if you need any refinements! 🚀