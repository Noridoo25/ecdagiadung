package mypack.model;

import java.sql.Date;
import java.util.List;

public class OrderModel {
	private int orderId;
	private int status;
	private int cartId;
	private List<ProductInCartModel> items;
	private int totalPrice;
	private Date date;
	
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public OrderModel(int orderId, int status, int cartId, List<ProductInCartModel> items, int totalPrice, Date date,
			BillModel bill) {
		super();
		this.orderId = orderId;
		this.status = status;
		this.cartId = cartId;
		this.items = items;
		this.totalPrice = totalPrice;
		this.date = date;
		this.bill = bill;
	}
	private BillModel bill;
	public OrderModel() {
		super();
		// TODO Auto-generated constructor stub
	}
	public OrderModel(int orderId,int status, List<ProductInCartModel> items, int totalPrice, int cartId, BillModel bill) {
		super();
		this.status = status;
		this.items = items;
		this.totalPrice = totalPrice;
		this.cartId = cartId;
		this.orderId = orderId;
		this.bill = bill;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public List<ProductInCartModel> getItems() {
		return items;
	}
	public void setItems(List<ProductInCartModel> items) {
		this.items = items;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public int getCartId() {
		return cartId;
	}
	public void setCartId(int cartId) {
		this.cartId = cartId;
	}
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public BillModel getBill() {
		return bill;
	}
	public void setBill(BillModel bill) {
		this.bill = bill;
	}
	
}
