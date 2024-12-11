package buoi14;

//Lớp Laptop (kế thừa Product)
class Laptop extends Product {
	private String processor;
	private int ram;

	public Laptop(String id, String name, double price, int quantity, String processor, int ram) {
		super(id, name, price, quantity);
		this.processor = processor;
		this.ram = ram;
	}

	@Override
	public double calculateDiscountedPrice(double discountRate) {
		// Laptop có thêm giảm giá cố định $50
		return super.calculateDiscountedPrice(discountRate) - 50;
	}

	@Override
	public void displayDetails() {
		super.displayDetails();
		System.out.println("Processor: " + processor);
		System.out.println("RAM: " + ram + "GB");
	}
}