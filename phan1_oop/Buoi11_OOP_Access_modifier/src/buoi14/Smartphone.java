package buoi14;

//Lớp Smartphone (kế thừa Product)
class Smartphone extends Product {
	private String cameraQuality;

	public Smartphone(String id, String name, double price, int quantity, String cameraQuality) {
		super(id, name, price, quantity);
		this.cameraQuality = cameraQuality;
	}

	@Override
	public double calculateDiscountedPrice(double discountRate) {
		// Smartphone giảm giá tối đa 10% hoặc $100 (lấy giá trị nhỏ hơn)
		double discountedPrice = super.calculateDiscountedPrice(discountRate);
		return Math.max(price - 100, discountedPrice);
	}

	@Override
	public void displayDetails() {
		super.displayDetails();
		System.out.println("Camera Quality: " + cameraQuality);
	}
}