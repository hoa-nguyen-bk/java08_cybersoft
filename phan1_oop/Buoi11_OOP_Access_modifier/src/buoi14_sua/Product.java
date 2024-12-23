package buoi14_sua;

public class Product {
	private int id;
	private String name;
	private float price;
	private int quality;
	private double discount;

	public double getDiscount() {
		return discount;
	}

	public void setDiscount(double discount) {
		this.discount = discount;
	}

	public Product() {
		super();
	}

	public Product(int id, String name, Float price, int quality, int discount_rate) {
		super();
		this.id = id;
		this.name = name;
		this.price = price;
		this.quality = quality;
		this.discount = calculate_discounted_price(discount_rate);
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(Float price) {
		this.price = price;
	}

	public int getQuality() {
		return quality;
	}

	public void setQuality(int quality) {
		this.quality = quality;
	}

	public double calculate_discounted_price(int discount_rate) {
		return price * discount_rate / 100;
	}

	@Override
	public String toString() {
		return this.id + " - " + this.name + " - " + this.price + " - " + this.quality + " - " + this.discount;
	}
}
