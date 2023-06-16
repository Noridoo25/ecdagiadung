package mypack.model;

public class BillModel {
	private int billId;
	private int cartId;
	private String userFName;
	private String userLName;
	private String addr;
	private String phone;
	private String email;
	private int cartTotal;
	private int shipping;
	private int subTotal;
	public BillModel() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BillModel(int billId, int cartId, String userFName, String userLName, String addr, String phone,
			String email, int cartTotal, int shipping, int subTotal) {
		super();
		this.billId = billId;
		this.cartId = cartId;
		this.userFName = userFName;
		this.userLName = userLName;
		this.addr = addr;
		this.phone = phone;
		this.email = email;
		this.cartTotal = cartTotal;
		this.shipping = shipping;
		this.subTotal = subTotal;
	}
	public int getBillId() {
		return billId;
	}
	public void setBillId(int billId) {
		this.billId = billId;
	}
	public int getCartId() {
		return cartId;
	}
	public void setCartId(int cartId) {
		this.cartId = cartId;
	}
	public String getUserFName() {
		return userFName;
	}
	public void setUserFName(String userFName) {
		this.userFName = userFName;
	}
	public String getUserLName() {
		return userLName;
	}
	public void setUserLName(String userLName) {
		this.userLName = userLName;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getCartTotal() {
		return cartTotal;
	}
	public void setCartTotal(int cartTotal) {
		this.cartTotal = cartTotal;
	}
	public int getShipping() {
		return shipping;
	}
	public void setShipping(int shipping) {
		this.shipping = shipping;
	}
	public int getSubTotal() {
		return subTotal;
	}
	public void setSubTotal(int subTotal) {
		this.subTotal = subTotal;
	}
	
	
}
