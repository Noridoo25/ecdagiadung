package mypack.services;





import java.sql.Date;
import java.time.LocalDateTime;
import java.util.List;

import mypack.model.OrderModel;

public interface IOrderService {
	void insertOrder(int cartId, int totalPrice, Date date);
	void updateOrder(int cartId, int status);
	List<OrderModel> getOrderOfUser(int cartId);
	List<OrderModel> getAllOrders();
	List<OrderModel> getAllOrdersByDate(String date);
	List<OrderModel> getOrderOfUserByUserId(int userId);
	OrderModel getOrderByOrderId(int orderId);
	
	List<OrderModel> getAllOrdersByKey(String key, int userId);
	List<OrderModel> getAllOrdersByKeyOfAdmin(String key);
}
