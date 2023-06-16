package mypack.Impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import ConnectionDB.DBConnection;
import mypack.DAO.ICartDAO;
import mypack.model.CartModel;
import mypack.model.ProductInCartModel;

public class CartDAOImpl extends DBConnection implements ICartDAO{

	Connection con;
	PreparedStatement ps ;
	ResultSet rs;
	@Override
	public void insertCart(int userId) {
	
		String sql = "insert into Cart(userId) values(?)";
		try {
			con = super.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, userId);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void insertProductInCart(int cartId, int productId, int amount, int total) {
		
		String sql = "insert into ProductInCart(cartId,productId,amount,total,status) values(?,?,?,?, 0)";
		try {
			con = super.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, cartId);
			ps.setInt(2, productId);
			ps.setInt(3, amount);
			ps.setInt(4, total);
			ps.executeUpdate();
		} catch (Exception e) {
			
			e.printStackTrace();
		}
	}

	@Override
	public void insertBill(int cartId, String firstName, String lastName, String addr, String phone, String email,
			int cartTotal, int shipping, int subTotal) {
		
		String sql = "insert into Bill(cartId,userFName,userLName,addr,phone,email,cartTotal,shipping,subTotal) values(?,?,?,?,?,?,?,?,?)";
		try {
			con = super.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, cartId);
			ps.setString(2, firstName);
			ps.setString(3, lastName);
			ps.setString(4, addr);
			ps.setString(5, phone);
			ps.setString(6, email);
			ps.setInt(7, cartTotal);
			ps.setInt(8, shipping);
			ps.setInt(9, subTotal);
			ps.executeUpdate();
		} catch (Exception e) {
			
			e.printStackTrace();
		}
	}

	@Override
	public ProductInCartModel getCartIdByUserId(int userId) {
		
		String sql = "select MAX(cartId) as cartId from Cart where userId = ?";

		try {
			con = super.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, userId);
			rs = ps.executeQuery();
			while(rs.next()) {
				ProductInCartModel cart = new ProductInCartModel();
				cart.setCartId(rs.getInt("cartId"));
				return cart;
			}

		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public ProductInCartModel getLastCartId() {
		
		String sql = "select MAX(cartId) as cartId from Cart ";

		try {
			con = super.getConnection();
			ps = con.prepareStatement(sql);

			rs = ps.executeQuery();
			while(rs.next()) {
				ProductInCartModel cart = new ProductInCartModel();
				cart.setCartId(rs.getInt("cartId"));
				return cart;
			}

		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<ProductInCartModel> getListItem(int cartId) {

		String sql = "select * from ProductInCart where cartId = ?";

		List<ProductInCartModel> items = new ArrayList<>();
		try {
			con = super.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, cartId);
			rs = ps.executeQuery();
			while(rs.next()) {
				ProductInCartModel item = new ProductInCartModel();
				item.setCartId(rs.getInt("cartId"));
				item.setAmount(rs.getInt("amount"));
				item.setProductId(rs.getInt("productId"));
				item.setTotal(rs.getInt("total"));
				item.setStatus(rs.getInt("status"));
				items.add(item);
			}
			return items;
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<ProductInCartModel> getListItemOfSeller(int sellerId, int cartId) {
		
		String sql = "select * from ProductInCart join Product on ProductInCart.productId = Product.productId where Product.sellerId = ? and ProductInCart.cartId = ?";
		List<ProductInCartModel> items = new ArrayList<>();
		try {
			con = super.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, sellerId);
			ps.setInt(2, cartId);
			rs = ps.executeQuery();
			while(rs.next()) {
				ProductInCartModel item = new ProductInCartModel();
				item.setCartId(rs.getInt("cartId"));
				item.setAmount(rs.getInt("amount"));
				item.setProductId(rs.getInt("productId"));
				item.setTotal(rs.getInt("total"));
				item.setStatus(rs.getInt("status"));
				items.add(item);
			}
			return items;
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public void updateStatus(int cartId, int status) {
		
		String sql = "update ProductInCart set status = ? where cartId = ?";
		try {
			con = super.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, status);
			ps.setInt(2, cartId);
			ps.executeUpdate();
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
	}

	@Override
	public List<ProductInCartModel> getListItemOfSellerId(int sellerId) {
		
		String sql = "select * from ProductInCart join Product on ProductInCart.productId = Product.productId where Product.sellerId = ? ";
		List<ProductInCartModel> items = new ArrayList<>();
		try {
			con = super.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, sellerId);
			
			rs = ps.executeQuery();
			while(rs.next()) {
				ProductInCartModel item = new ProductInCartModel();
				item.setCartId(rs.getInt("cartId"));
				item.setAmount(rs.getInt("amount"));
				item.setProductId(rs.getInt("productId"));
				item.setTotal(rs.getInt("total"));
				item.setStatus(rs.getInt("status"));
				items.add(item);
			}
			return items;
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<CartModel> getListCartIdByUserId(int userId) {
		// TODO Auto-generated method stub
		String sql = "select * from Cart where userId = ?";
		List<CartModel> carts = new ArrayList<>();
		try {
			con = super.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, userId);
			
			rs = ps.executeQuery();
			while(rs.next()) {
				CartModel cart = new CartModel();
				cart.setCartId(rs.getInt("cartId"));
				cart.setUserId(rs.getInt("userId"));
				carts.add(cart);
			}
			return  carts;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public ProductInCartModel checkBougth(int cartId) {
		// TODO Auto-generated method stub
		String sql = "select * from ProductInCart where cartId = ?";

		try {
			con = super.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, cartId);
			rs = ps.executeQuery();
			while(rs.next()) {
				ProductInCartModel cart = new ProductInCartModel();
				cart.setCartId(rs.getInt("cartId"));
				cart.setProductId(rs.getInt("productId"));
				
				return cart;
			}

		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<ProductInCartModel> getListItemByStatus(int cartId, int status) {
		// TODO Auto-generated method stub
		String sql = "select * from ProductInCart where cartId = ? and status = ?" ;

		List<ProductInCartModel> items = new ArrayList<>();
		try {
			con = super.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, cartId);
			ps.setInt(2, status);
			rs = ps.executeQuery();
			while(rs.next()) {
				ProductInCartModel item = new ProductInCartModel();
				item.setCartId(rs.getInt("cartId"));
				item.setAmount(rs.getInt("amount"));
				item.setProductId(rs.getInt("productId"));
				item.setTotal(rs.getInt("total"));
				item.setStatus(rs.getInt("status"));
				items.add(item);
			}
			return items;
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<ProductInCartModel> getListItemOfSellerByStatus(int sellerId, int status) {
		// TODO Auto-generated method stub
		String sql = "select * from ProductInCart join Product on ProductInCart.productId = Product.productId where Product.sellerId = ? and ProductInCart.status = ?";
		List<ProductInCartModel> items = new ArrayList<>();
		try {
			con = super.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, sellerId);
			
			ps.setInt(2, status);
			rs = ps.executeQuery();
			while(rs.next()) {
				ProductInCartModel item = new ProductInCartModel();
				item.setCartId(rs.getInt("cartId"));
				item.setAmount(rs.getInt("amount"));
				item.setProductId(rs.getInt("productId"));
				item.setTotal(rs.getInt("total"));
				item.setStatus(rs.getInt("status"));
				items.add(item);
			}
			return items;
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return null;
	}

}
