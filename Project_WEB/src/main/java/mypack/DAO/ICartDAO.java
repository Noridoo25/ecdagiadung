package mypack.DAO;

import java.util.List;

import mypack.model.CartModel;
import mypack.model.ProductInCartModel;

public interface ICartDAO {
	void insertCart(int userId);
	void insertProductInCart(int cartId, int productId, int amount, int total);
	void insertBill(int cart, String firstName, String lastName, String addr, String phone, String email, int cartTotal, int shipping, int subTotal );
	ProductInCartModel getCartIdByUserId(int userId);
	ProductInCartModel getLastCartId();
	List<ProductInCartModel> getListItem(int cartId);
	List<ProductInCartModel> getListItemOfSeller(int sellerId, int cartId);
	void updateStatus(int cartId, int status);
	List<ProductInCartModel> getListItemOfSellerId(int sellerId);
	List<CartModel> getListCartIdByUserId(int userId);
	ProductInCartModel checkBougth(int cartId);
	
	List<ProductInCartModel> getListItemByStatus(int cartId, int status);
	List<ProductInCartModel> getListItemOfSellerByStatus(int sellerId, int status);
	
}
