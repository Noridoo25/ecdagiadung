package mypack.model;

public class CartModel {

	private int cartId;
	private int userId;
	
	public UserAccountModel userAccountModel;

	public CartModel() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CartModel(int cartId, int userId, UserAccountModel userAccountModel) {
		super();
		this.cartId = cartId;
		this.userId = userId;
		this.userAccountModel = userAccountModel;
	}

	public int getCartId() {
		return cartId;
	}

	public void setCartId(int cartId) {
		this.cartId = cartId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public UserAccountModel getUserAccountModel() {
		return userAccountModel;
	}

	public void setUserAccountModel(UserAccountModel userAccountModel) {
		this.userAccountModel = userAccountModel;
	}
	
	
}
