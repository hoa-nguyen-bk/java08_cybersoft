package buoi14_sua;

public class Laptop extends Product {
	private String processor;
	private int ram;

	public String getProcessor() {
		return processor;
	}

	public void setProcessor(String processor) {
		this.processor = processor;
	}

	public int getRam() {
		return ram;
	}

	public void setRam(int ram) {
		this.ram = ram;
	}

	public Laptop(int id, String name, Float price, int quality, int discount_rate, String processor, int ram) {
		super(id, name, price, quality, discount_rate);
		this.processor = processor;
		this.ram = ram;
		this.setDiscount(calculate_discounted_price(discount_rate));
	}
	
	
	
	@Override
	public double calculate_discounted_price(int discount) {
		return super.calculate_discounted_price(discount) - 10;
	}
	
	
}
