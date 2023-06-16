package mypack.model;

public class ProductModel {

	private int productId;
	private String productName;
	private String depiction;
	private String detail;
	private int productPrice;
	private int categoryId;
	private int sellerId;
	
	public CategoryModel category;

	public ProductModel(int productId, String productName, String depiction, String detail, int productPrice,
			int categoryId,int sellerId, CategoryModel category) {
		super();
		this.productId = productId;
		this.productName = productName;
		this.depiction = depiction;
		this.detail = detail;
		this.productPrice = productPrice;
		this.categoryId = categoryId;
		this.sellerId = sellerId;
		this.category = category;
	}

	public ProductModel() {
		super();
		// TODO Auto-generated constructor stub
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

	public String getDepiction() {
		return depiction;
	}

	public void setDepiction(String depiction) {
		this.depiction = depiction;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public int getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public CategoryModel getCategory() {
		return category;
	}

	public void setCategory(CategoryModel category) {
		this.category = category;
	}

	public int getSellerId() {
		return sellerId;
	}

	public void setSellerId(int sellerId) {
		this.sellerId = sellerId;
	}
	
	
}
