package mypack.Impl;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.util.ArrayList;
import java.sql.Date;
import java.util.List;

import ConnectionDB.DBConnection;
import mypack.DAO.IOrderDAO;
import mypack.model.OrderModel;

public class OrderDAOImpl extends DBConnection implements IOrderDAO{
	
	
	Connection conn;
	PreparedStatement ps;
	ResultSet rs;
	@Override
	public void insertOrder(int cartId, int totalPrice, Date date) {
		
		String sql = "insert into Orders(cartId,totalPrice,status,date) values(?,?,0,?) ";
		
		try {
			conn = super.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, cartId);
			ps.setInt(2, totalPrice);
			ps.setDate(3, date);
			ps.executeUpdate();
		} catch (Exception e) {
			
			e.printStackTrace();
		}
	}

	@Override
	public void updateOrder(int cartId, int status) {
	
		String sql = "update Orders set status = ? where cartId = ?";
		try {
			conn = super.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, status);
			ps.setInt(2, cartId);
			ps.executeUpdate();
		} catch (Exception e) {

			e.printStackTrace();
		}
	}

	@Override
	public List<OrderModel> getOrderOfUser(int cartId) {

		String sql = "select * from Orders where cartId = ?";
		List<OrderModel> orders = new ArrayList<>();
		try {
			conn = super.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, cartId);
			rs = ps.executeQuery();
			while(rs.next()) {
				OrderModel order = new OrderModel();
				order.setOrderId(rs.getInt("orderId"));
				order.setCartId(rs.getInt("cartId"));
				order.setTotalPrice(rs.getInt("totalPrice"));
				order.setStatus(rs.getInt("status"));
				orders.add(order);
			}
			return orders;
		} catch (Exception e) {
		
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<OrderModel> getAllOrders() {
	
		String sql = "select * from Orders order by orderId desc";
		List<OrderModel> orders = new ArrayList<>();
		try {
			conn = super.getConnection();
			ps = conn.prepareStatement(sql);
			
			rs = ps.executeQuery();
			while(rs.next()) {
				OrderModel order = new OrderModel();
				order.setOrderId(rs.getInt("orderId"));
				order.setCartId(rs.getInt("cartId"));
				order.setTotalPrice(rs.getInt("totalPrice"));
				order.setStatus(rs.getInt("status"));
				orders.add(order);
			}
			return orders;
		} catch (Exception e) {
		
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<OrderModel> getAllOrdersByDate(String date) {
		
		String sql = "select * from Orders where date=" + date;
		List<OrderModel> orders = new ArrayList<>();
		try {
			conn = super.getConnection();
			ps = conn.prepareStatement(sql);
			
			rs = ps.executeQuery();
			while(rs.next()) {
				OrderModel order = new OrderModel();
				order.setOrderId(rs.getInt("orderId"));
				order.setCartId(rs.getInt("cartId"));
				order.setTotalPrice(rs.getInt("totalPrice"));
				order.setStatus(rs.getInt("status"));
				orders.add(order);
			}
			return orders;
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public OrderModel getOrderByOrderId(int orderId) {
		
		String sql = "select *from Orders where orderId = ?";
		try {
			conn = super.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, orderId);
			rs = ps.executeQuery();
			while(rs.next()) {
				OrderModel order = new OrderModel();
				order.setOrderId(rs.getInt("orderId"));
				order.setCartId(rs.getInt("cartId"));
				order.setTotalPrice(rs.getInt("totalPrice"));
				order.setStatus(rs.getInt("status"));
				return order;
			}
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<OrderModel> getOrderOfUserByUserId(int userId) {
		
		String sql = "select * from Orders O join Cart C on O.cartId = C.cartId \r\n"
				+ "			where C.userId = ?";
		List<OrderModel> orders = new ArrayList<>();
		try {
			conn = super.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, userId);
			rs = ps.executeQuery();
			while(rs.next()) {
				OrderModel order = new OrderModel();
				order.setOrderId(rs.getInt("orderId"));
				order.setCartId(rs.getInt("cartId"));
				order.setTotalPrice(rs.getInt("totalPrice"));
				order.setStatus(rs.getInt("status"));
				orders.add(order);
			}
			return orders;
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<OrderModel> getAllOrdersByKey(String key, int userId) {
		// TODO Auto-generated method stub
		String sql = "select * from Orders O join Cart C on O.cartId = C.cartId where O.cartId like ? and C.userId = ?";
		List<OrderModel> orders = new ArrayList<>();
		try {
			conn = super.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, "%" +key+"%");
			ps.setInt(2, userId);
			rs = ps.executeQuery();
			while(rs.next()) {
				OrderModel order = new OrderModel();
				order.setOrderId(rs.getInt("orderId"));
				order.setCartId(rs.getInt("cartId"));
				order.setTotalPrice(rs.getInt("totalPrice"));
				order.setStatus(rs.getInt("status"));
				orders.add(order);
			}
			return orders;
		} catch (Exception e) {
		
			e.printStackTrace();
		}
		return orders;
	}

	@Override
	public List<OrderModel> getAllOrdersByKeyOfAdmin(String key) {
		// TODO Auto-generated method stub
		String sql = "select * from Orders O join Cart C on O.cartId = C.cartId where O.cartId like ? ";
		List<OrderModel> orders = new ArrayList<>();
		try {
			conn = super.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, "%" +key+"%");
			rs = ps.executeQuery();
			while(rs.next()) {
				OrderModel order = new OrderModel();
				order.setOrderId(rs.getInt("orderId"));
				order.setCartId(rs.getInt("cartId"));
				order.setTotalPrice(rs.getInt("totalPrice"));
				order.setStatus(rs.getInt("status"));
				orders.add(order);
			}
			return orders;
		} catch (Exception e) {
		
			e.printStackTrace();
		}
		return orders;
	}
}
