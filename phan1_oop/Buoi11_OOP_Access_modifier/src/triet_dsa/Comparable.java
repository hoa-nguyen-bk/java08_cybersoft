package triet_dsa;

import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

//Phương thức compare này thực hiện việc so sánh hai số a và b theo các quy tắc:
//Ưu tiên số chẵn trước số lẻ. : 2 với 4
//Số chẵn sắp xếp tăng dần: 1
//Số lẻ sắp xếp giảm dần: 3  11 -> 9

//    a	 		b		th
//1. chẵn		chẵn	v
//2. chẵn		lẻ		v
//3.  lẻ		lẻ		v
//4.  lẻ		chẵn	v

// b1: lúc làm bài để nhớ ra cái hàm này, 
//	   a	 		b		th
//1. chẵn		chẵn	v
//2. chẵn		lẻ		v
//3.  lẻ		lẻ		v
//4.  lẻ		chẵn	v
 
// b2: chọn trường hợp khác nhau trước, chẵn lẻ vs lẻ chăn

// b3: chọn đại cái a chẵn b lẻ, a chẵn nghĩa là chia hết cho 2, b là lẻ ko % 2
// b3a: lẻ lẻ, a lẻ = 9, b lẻ = 11

// b4: return trả về gì
// - âm vô cùng 				0 			+ dương vô cùng
// 		a trước b			 				b trước a
//	a > b => a - b							b > a => b - a



public class Comparable implements Comparator<Integer> {
	@Override
	public int compare(Integer a, Integer b) {
		int aInt = a, bInt = b; // Tự động unboxing sang int
		System.out.println(aInt); // Output: 42
		System.out.println(bInt);
		// Nếu a là số chẵn và b là số lẻ, a đứng trước
		if (a % 2 == 0 && b % 2 != 0) {
			System.out.printf("1. Nếu a là số chẵn và b là số lẻ\n"); 
			return -1; // a đứng trước b
		}
		 // a = 5, b = 6
		 // Nếu a là số lẻ và b là số chẵn, b đứng trước
        if (a % 2 != 0 && b % 2 == 0) {
			System.out.printf("2. Nếu a là số lẻ và b là số chẵn\n");
            return 1; // b đứng trước a
        }
        // a = 2; b = 4
        // Nếu cả hai đều là số chẵn, sắp xếp tăng dần
        if (a % 2 == 0 && b % 2 == 0) {
			System.out.printf("3. Nếu cả hai đều là số chẵn\n");
            return a - b; // -2
        }
        //  a = 5, b = 9
        // Nếu cả hai đều là số lẻ, sắp xếp giảm dần
        if (a % 2 != 0 && b % 2 != 0) {
			System.out.printf("4. Nếu cả hai đều là số lẻ\n");
            return b - a; // 4 , b đứng trước a
        }
		// Trường hợp mặc định (nên không bao giờ xảy ra)
		return 0;
	}

	public static void main(String[] args) {
//		List<Integer> numbers = Arrays.asList(4, 2); // a = 2; b = 4
		List<Integer> numbers = Arrays.asList(9, 2, 6, 5);
		// 0  1  2  3
		// 9  2  6  5

//		List<Integer> numbers = Arrays.asList(3, 1, 4, 1, 5, 9, 2, 6, 5);

		Collections.sort(numbers, new Comparable());
		System.out.print("\nKết quả: "); // Output: [2, 4, 6, 9, 5, 5, 3, 1, 1]
		System.out.println(numbers); // Output: [2, 4, 6, 9, 5, 5, 3, 1, 1]

	}
}
