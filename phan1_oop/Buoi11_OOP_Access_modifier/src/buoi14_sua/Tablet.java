package buoi14_sua;

public class Tablet extends Product {
	private String type;

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Tablet(int id, String name, Float price, int quality, int discount_rate, String type) {
		super(id, name, price, quality, discount_rate);
		this.type = type;
	}

	@Override
	public double calculate_discounted_price(int discount) {
		return super.calculate_discounted_price(discount) - 20 * this.getPrice();
	}
}
