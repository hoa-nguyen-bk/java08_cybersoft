package buoi14;

//Lớp chính để chạy chương trình
public class ElectronicStoreManagement {
	public static void main(String[] args) {
		// Tạo danh sách sản phẩm
		Product[] products = { 
				new Laptop("L01", "Dell XPS 13", 1200, 10, "Intel i7", 16),
				new Smartphone("S01", "iPhone 14", 999, 20, "12MP Ultra Wide"),
				new Tablet("T01", "Samsung Galaxy Tab S8", 700, 15, true) 
		};

		// Hiển thị thông tin chi tiết và giá giảm cho từng sản phẩm
		double discountRate = 0.1; // 10% giảm giá
		for (Product product : products) {
			product.displayDetails();
			System.out.printf("Discounted Price: $%.2f\n", product.calculateDiscountedPrice(discountRate));
			System.out.println("--------------------------------------");
		}
	}
}
