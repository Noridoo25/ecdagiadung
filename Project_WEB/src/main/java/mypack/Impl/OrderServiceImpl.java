package mypack.Impl;




import java.sql.Date;
import java.time.LocalDateTime;
import java.util.List;

import mypack.DAO.IOrderDAO;
import mypack.model.OrderModel;
import mypack.services.IOrderService;

public class OrderServiceImpl implements IOrderService{
	IOrderDAO orderDAO = new OrderDAOImpl();
	@Override
	public void insertOrder(int cartId, int totalPrice, Date date) {
		orderDAO.insertOrder(cartId, totalPrice, date);
	}

	@Override
	public void updateOrder(int cartId,int status) {
		
		orderDAO.updateOrder(cartId,status);
	}

	@Override
	public List<OrderModel> getOrderOfUser(int cartId) {
		return orderDAO.getOrderOfUser(cartId);
	}

	@Override
	public List<OrderModel> getAllOrders() {
		return orderDAO.getAllOrders();
	}

	@Override
	public List<OrderModel> getAllOrdersByDate(String date) {
		return orderDAO.getAllOrdersByDate(date);
	}

	@Override
	public OrderModel getOrderByOrderId(int orderId) {
		return orderDAO.getOrderByOrderId(orderId);
	}

	@Override
	public List<OrderModel> getOrderOfUserByUserId(int userId) {
		return orderDAO.getOrderOfUserByUserId(userId);
	}

	@Override
	public List<OrderModel> getAllOrdersByKey(String key, int userId) {
		// TODO Auto-generated method stub
		return orderDAO.getAllOrdersByKey(key, userId);
	}

	@Override
	public List<OrderModel> getAllOrdersByKeyOfAdmin(String key) {
		// TODO Auto-generated method stub
		return orderDAO.getAllOrdersByKeyOfAdmin(key);
	}
	
}
