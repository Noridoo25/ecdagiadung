package mypack.Impl;

import java.util.List;

import mypack.DAO.ICartDAO;
import mypack.model.CartModel;
import mypack.model.ProductInCartModel;
import mypack.services.ICartService;

public class CartServiceImpl implements ICartService {
	ICartDAO cartDAO = new CartDAOImpl();

	@Override
	public void insertCart(int userId) {
		cartDAO.insertCart(userId);
	}

	@Override
	public void insertProductInCart(int cartId, int productId, int amount, int total) {
		cartDAO.insertProductInCart(cartId, productId, amount, total);
	}

	@Override
	public void insertBill(int cart, String firstName, String lastName, String addr, String phone, String email,
			int cartTotal, int shipping, int subTotal) {
		cartDAO.insertBill(cart, firstName, lastName, addr, phone, email, cartTotal, shipping, subTotal);
	}

	@Override
	public ProductInCartModel getCartIdByUserId(int userId) {

		return cartDAO.getCartIdByUserId(userId);
	}

	@Override
	public ProductInCartModel getLastCartId() {
		
		return cartDAO.getLastCartId();
	}

	@Override
	public List<ProductInCartModel> getListItem(int cartId) {
		
		return cartDAO.getListItem(cartId);
	}

	

	@Override
	public void updateStatus(int cartId, int status) {
		
		cartDAO.updateStatus(cartId, status);
		
	}

	@Override
	public List<ProductInCartModel> getListItemOfSeller(int sellerId, int cartId) {
		
		return cartDAO.getListItemOfSeller(sellerId, cartId);
	}

	@Override
	public List<ProductInCartModel> getListItemOfSellerId(int sellerId) {
		
		return cartDAO.getListItemOfSellerId(sellerId);
	}

	@Override
	public List<CartModel> getListCartIdByUserId(int userId) {
		// TODO Auto-generated method stub
		return cartDAO.getListCartIdByUserId(userId);
	}

	@Override
	public ProductInCartModel checkBougth(int cartId) {
		// TODO Auto-generated method stub
		return cartDAO.checkBougth(cartId);
	}

	@Override
	public List<ProductInCartModel> getListItemByStatus(int cartId, int status) {
		// TODO Auto-generated method stub
		return cartDAO.getListItemByStatus(cartId, status);
	}

	@Override
	public List<ProductInCartModel> getListItemOfSellerByStatus(int sellerId, int status) {
		// TODO Auto-generated method stub
		return cartDAO.getListItemOfSellerByStatus(sellerId, status);
	}
}
