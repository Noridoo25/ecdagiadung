package mypack.model;

public class ReportAdminModel {

	private int storeId;
	private String storeName;
	private String email;
	private int amount;
	private int total;
	
	public ReportAdminModel() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ReportAdminModel(int storeId, String storeName, String email, int amount, int total) {
		super();
		this.storeId = storeId;
		this.storeName = storeName;
		this.email = email;
		this.amount = amount;
		this.total = total;
	}

	public int getStoreId() {
		return storeId;
	}

	public void setStoreId(int storeId) {
		this.storeId = storeId;
	}

	public String getStoreName() {
		return storeName;
	}

	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}
	
	
}
