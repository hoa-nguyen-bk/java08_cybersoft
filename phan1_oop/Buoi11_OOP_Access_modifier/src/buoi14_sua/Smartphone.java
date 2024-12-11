package buoi14_sua;

public class Smartphone extends Product {
	private int camera_quality;

	public int getCamera_quality() {
		return camera_quality;
	}

	public void setCamera_quality(int camera_quality) {
		this.camera_quality = camera_quality;
	}

	public Smartphone(int id, String name, Float price, int quality, int discount_rate, int camera_quality) {
		super(id, name, price, quality, discount_rate);

		this.camera_quality = camera_quality;
	}

	@Override
	public double calculate_discounted_price(int discount) {
		return (super.calculate_discounted_price(discount) + 0.1 * this.getPrice());
	}
}
