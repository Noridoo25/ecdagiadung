package mypack.model;

public class ReportSellerModel {

	private int productId;
	private String productName;
	private int amount;
	private int total;
	private int userId;
	
	public ReportSellerModel() {
	}

	public ReportSellerModel(int productId, String productName, int amount, int total, int userId) {
		super();
		this.productId = productId;
		this.productName = productName;
		this.amount = amount;
		this.total = total;
		this.userId = userId;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}


	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}
	
	
	
	
}
