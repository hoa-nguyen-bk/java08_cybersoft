package buoi14;

//Lớp Product (lớp cha)
class Product {
	protected String id;
	protected String name;
	protected double price;
	protected int quantity;

	public Product(String id, String name, double price, int quantity) {
		this.id = id;
		this.name = name;
		this.price = price;
		this.quantity = quantity;
	}

	public double calculateDiscountedPrice(double discountRate) {
		return price * (1 - discountRate);
	}

	public void displayDetails() {
		System.out.println("ID: " + id);
		System.out.println("Name: " + name);
		System.out.println("Price: $" + price);
		System.out.println("Quantity: " + quantity);
	}
}
