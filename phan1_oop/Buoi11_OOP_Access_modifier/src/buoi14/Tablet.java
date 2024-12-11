package buoi14;

//Lớp Tablet (kế thừa Product)
class Tablet extends Product {
	private boolean hasStylus;

	public Tablet(String id, String name, double price, int quantity, boolean hasStylus) {
		super(id, name, price, quantity);
		this.hasStylus = hasStylus;
	}

	@Override
	public double calculateDiscountedPrice(double discountRate) {
		// Tablet giảm giá thêm 5% nếu có stylus
		double additionalDiscount = hasStylus ? 0.05 : 0.0;
		return price * (1 - discountRate - additionalDiscount);
	}

	@Override
	public void displayDetails() {
		super.displayDetails();
		System.out.println("Has Stylus: " + (hasStylus ? "Yes" : "No"));
	}
}