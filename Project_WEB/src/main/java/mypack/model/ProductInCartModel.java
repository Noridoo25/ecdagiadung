package mypack.model;



public class ProductInCartModel {
	private int cartId;
	private int productId;
	private int amount;
	private int total;
	private int status;
	
	private ProductImageModel product;

	public ProductInCartModel(int cartId, int productId, int amount, int total, ProductImageModel product, int status) {
		super();
		this.cartId = cartId;
		this.productId = productId;
		this.amount = amount;
		this.total = total;
		this.product = product;
		this.status = status;
	}

	public ProductInCartModel() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getCartId() {
		return cartId;
	}

	public void setCartId(int cartId) {
		this.cartId = cartId;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
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

	public ProductImageModel getProduct() {
		return product;
	}

	public void setProduct(ProductImageModel product) {
		this.product = product;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}
}
