# Giải bài dsa cuối kì cùng bạn Triết đi zép

## Đề cho: 
Triển khai lớp MyComparator trong Java để sắp xếp một mảng số nguyên (array of integers) theo quy tắc như sau:

- Số chẵn trước số lẻ: Các số chẵn (even numbers) được đặt trước các số lẻ (odd numbers).
- Số chẵn tăng dần: Các số chẵn được sắp xếp theo thứ tự tăng dần.
- Số lẻ giảm dần: Các số lẻ được sắp xếp theo thứ tự giảm dần.

## Cách tư duy ra bài giải mà ko cần nhớ code
**Bước 1:** Ở đây đề tập trung vào số chẵn và lẻ chủ yếu, và hàm comparator thì có 2 tham số a và b. Nên là a hoặc là chẵn hoặc là lẻ, b cũng hoặc là chẵn hoặc là lẻ, mình kẻ ra được cái bảng như sau:

| STT | a    | b    |
| --- | ---- | ---- |
| 1.  | chẵn | chẵn |
| 2.  | chẵn | lẻ   |
| 3.  | lẻ   | lẻ   |
| 4.  | lẻ   | chẵn |

> **Mẹo nhớ:** Với mỗi trường hợp, bạn phải trả lời:
> - Ai sẽ đứng trước?
> - Nếu cùng loại (cùng chẵn hoặc cùng lẻ), chúng sắp xếp thế nào?

**Bước 2:** Cho dễ ta chọn trường hợp khác nhau trước, là a chẵn b lẻ 

Dựa vào mẹo trả lời được câu hỏi: ai sẽ đứng trước? --> Trả lời ngay được `a chẵn đứng trước `


**Bước 3:** Vẽ bảng biến thiên ở cái dòng đầu. 
- Xong sau đó viết từ trái qua phải, bắt đầu từ `a trước b`, `Không đổi`.
- Xong tới `b trước a`
  - cái số -1 0 với 1 là do java quy định rùi, ko đổi được nên ta càng rất nhớ:


Khi dùng a trừ b có thể = 
| Bảng biến thiên | âm vô cùng | 0      | dương vô cùng |
| --------------- | ---------- | ------ | ------------- |
| Return          | -1         | 0      | 1             |
| Suy luận        | a trước b  | ko đổi | b trước a     |

Vì ở trên ta trả lời được ra `a chẵn đứng trước ` nên mình suy ra `rơi vào âm vô cùng`

**Bước 4:** Kết quả trường hợp
Các trường hợp `chẵn/lẻ` và `lẻ/chẵn` rõ ràng:
- `a` chẵn và `b` lẻ (`a % 2 == 0 && b % 2 != 0`): `a` đứng trước => **`return -1`**.
- `a` lẻ và `b` chẵn (`a % 2 != 0 && b % 2 == 0`): `b` đứng trước => **`return 1`**.


#### **Bước 3: Xử lý các trường hợp "cùng loại" (chẵn/chẵn hoặc lẻ/lẻ)**
Về `Integer.compare(a, b)`.

1. **Nếu cùng chẵn:**
   - Quy tắc: Số chẵn sắp xếp **tăng dần**.
   - Số nhỏ hơn đứng trước => Dùng `Integer.compare(a, b)` (vì `a` nhỏ hơn thì trả về âm, nghĩa là `a` đứng trước).

2. **Nếu cùng lẻ:**
   - Quy tắc: Số lẻ sắp xếp **giảm dần**.
   - Số lớn hơn đứng trước => Dùng `Integer.compare(b, a)` (đảo thứ tự, vì `b` lớn hơn thì trả về âm, nghĩa là `b` đứng trước).

---

### **Cách nhớ quy tắc với `Integer.compare(a, b)`**
Hãy nhớ rằng:
- **`Integer.compare(a, b)`**:
  - So sánh `a` với `b`.
  - Trả về:
    - Âm nếu `a < b` (tức là `a` đứng trước).
    - Dương nếu `a > b` (tức là `b` đứng trước).
    - 0 nếu `a == b`.

- Với **số chẵn tăng dần**, bạn cần số nhỏ hơn đứng trước, vì vậy `Integer.compare(a, b)`.
- Với **số lẻ giảm dần**, bạn cần số lớn hơn đứng trước, vì vậy đảo thứ tự, dùng `Integer.compare(b, a)`.

---

### **Áp dụng thực tế với ví dụ**
Giả sử bạn có:
```java
List<Integer> numbers = Arrays.asList(3, 1, 4, 1, 5, 9, 2, 6, 5);
```

1. **Trường hợp `a = 4`, `b = 6` (cùng chẵn):**
   - Số chẵn tăng dần.
   - `Integer.compare(4, 6)` => Âm (vì `4 < 6`), nên `4` đứng trước `6`.

2. **Trường hợp `a = 9`, `b = 5` (cùng lẻ):**
   - Số lẻ giảm dần.
   - `Integer.compare(5, 9)` => Âm (vì `5 > 9` trong thứ tự đảo), nên `9` đứng trước `5`.

3. **Trường hợp `a = 4`, `b = 3` (chẵn/lẻ):**
   - Chẵn trước lẻ.
   - Trả về `-1` (chẵn luôn đứng trước).

4. **Trường hợp `a = 3`, `b = 4` (lẻ/chẵn):**
   - Lẻ sau chẵn.
   - Trả về `1` (lẻ luôn đứng sau).

---

### **Hoàn chỉnh lại phương thức `compare`:**
```java
@Override
public int compare(Integer a, Integer b) {
    // Nếu a chẵn, b lẻ => a đứng trước
    if (a % 2 == 0 && b % 2 != 0) {
        return -1;
    }
    // Nếu a lẻ, b chẵn => b đứng trước
    if (a % 2 != 0 && b % 2 == 0) {
        return 1;
    }
    // Nếu cả hai đều chẵn => sắp xếp tăng dần
    if (a % 2 == 0 && b % 2 == 0) {
        return Integer.compare(a, b); // Chẵn tăng dần
    }
    // Nếu cả hai đều lẻ => sắp xếp giảm dần
    return Integer.compare(b, a); // Lẻ giảm dần
}
```

---

### **Mẹo để nhớ mã khi thi viết tay**
1. **Bắt đầu với các trường hợp khác biệt (chẵn/lẻ):**
   - Nếu `a` chẵn, `b` lẻ → `return -1`.
   - Nếu `a` lẻ, `b` chẵn → `return 1`.

2. **Xử lý trường hợp "cùng loại" (chẵn/chẵn hoặc lẻ/lẻ):**
   - **Cùng chẵn:** Tăng dần → `Integer.compare(a, b)`.
   - **Cùng lẻ:** Giảm dần → `Integer.compare(b, a)`.

3. **Nhớ quy tắc:**
   - Tăng dần: `a` trước → `Integer.compare(a, b)`.
   - Giảm dần: `b` trước → `Integer.compare(b, a)`.

Việc thực hành viết mã nhiều lần sẽ giúp bạn ghi nhớ quy trình này dễ dàng hơn.