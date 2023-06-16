package Admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mypack.Impl.BillServiceImpl;
import mypack.Impl.CartServiceImpl;
import mypack.Impl.OrderServiceImpl;
import mypack.Impl.ProductImageServiceImpl;
import mypack.Impl.ProductServiceImpl;
import mypack.model.BillModel;
import mypack.model.ProductInCartModel;
import mypack.model.OrderModel;
import mypack.model.ProductImageModel;
import mypack.model.UserAccountModel;
import mypack.services.IBilldService;
import mypack.services.ICartService;
import mypack.services.IOrderService;
import mypack.services.IProductImageService;
import mypack.services.IProductService;


@WebServlet("/admin/SearchOrders")
public class SearchOrders extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    ICartService productInCart = new CartServiceImpl();
    IOrderService orders = new OrderServiceImpl();
    IBilldService listBill = new BillServiceImpl();
    IProductImageService productImage = new ProductImageServiceImpl();
    IProductService product = new ProductServiceImpl();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		UserAccountModel u = (UserAccountModel)session.getAttribute("account");
		String code = request.getParameter("codeOrder");
		List<OrderModel> AllOrder = new ArrayList<>();
		List<OrderModel> orderss = orders.getAllOrdersByKeyOfAdmin(code);
		List<ProductInCartModel> listItemOfSeller = productInCart.getListItemOfSellerId(u.getUserId());
//		if(u.getRoleId() != 1) {
//			orderss = orders.getAllOrdersByKey(code, u.getUserId());
//		}
//		else {
//			orderss = orders.getAllOrdersByKeyOfAdmin(code);
//		}
		String status = "";
		String type="";
//		OrderModel order = orders.getOrderByOrderId(Integer.parseInt(code));
		for(OrderModel order: orderss) {
			List<ProductInCartModel> listItems = productInCart.getListItem(order.getCartId());
			BillModel bill = listBill.getBillByCartId(order.getCartId());
			order.setBill(bill);
			for(ProductInCartModel c:listItems) {
				
				ProductImageModel prod = productImage.getImagesOfProduct(c.getProductId());
				c.setProduct(prod);		
			}
			order.setItems(listItems);
			if(u.getRoleId() !=1) {
				for(ProductInCartModel c:listItemOfSeller) {
					
					if(order.getCartId()==c.getCartId()) {
						AllOrder.add(order);
					}
				}
			}
			else {
				AllOrder.add(order);
			}
			if(order.getItems().get(0).getStatus()==0) {
				status = "Incomplete";
				type="pending";
			}
			else if(order.getItems().get(0).getStatus()==1) {
				status = "Complete";
				type="moving";
			}
			else {
				status = "Cancel";
				type="cancelled";
			}
		}
		
		
		
		PrintWriter out = response.getWriter();
		
		if(status.equals("Incomplete") && u.getRoleId() != 1) {
			for(OrderModel order: AllOrder) {
				out.println("<tr>\r\n"
						+ "									<th scope=\"row\"><a\r\n"
						+ "										href=\"/Project_WEB/DetailOdersController?cartId="+order.getCartId()+"\">"
						+ "											<b>#"+order.getOrderId()+"</b></a>"
						+ "									</th>\r\n"
						+ "\r\n"
						+ "\r\n"
						+ "										<td>\r\n"
						+ "											<div class=\"tm-status-circle "+type+"\"></div>"+status+"\r\n"
						+ "										</td>\r\n"
						+ "								<td><b>"+order.getBill().getUserFName()+" "+order.getBill().getUserLName()+" </b></td>\r\n"
						+ "								<td><b>"+order.getBill().getAddr()+"</b></td>\r\n"
						+ "								<td><b>"+order.getBill().getCartTotal()+"</b></td>\r\n"
						+ "\r\n"
						+"<td>\r\n"
						+ "												<button class=\"btn btn-primary btn-block\"\r\n"
						+ "													onClick=\"ChangeStatus("+order.getCartId()+", 1)\">\r\n"
						+ "													<i class=\"fa fa-cog fa-spin\"></i>Change Status\r\n"
						+ "												</button>\r\n"
						+ "												<button class=\"btn btn-default btn-block\"\r\n"
						+ "													onClick=\"ChangeStatus("+order.getCartId()+", 2)\">\r\n"
						+ "													<i class=\"fa fa-cog fa-spin\"></i>Cancel Order\r\n"
						+ "												</button>\r\n"
						+ "											</td>"
						+ "\r\n"
						+ "							</tr>");
			}
		}
		else {
			
			for(OrderModel order: AllOrder) {
				out.println("<tr>\r\n"
						+ "									<th scope=\"row\"><a\r\n"
						+ "										href=\"/Project_WEB/DetailOdersController?cartId="+order.getCartId()+"\">"
						+ "											<b>#"+order.getOrderId()+"</b></a>"
						+ "									</th>\r\n"
						+ "\r\n"
						+ "\r\n"
						+ "										<td>\r\n"
						+ "											<div class=\"tm-status-circle "+type+"\"></div>"+status+"\r\n"
						+ "										</td>\r\n"
						+ "								<td><b>"+order.getBill().getUserFName()+" "+order.getBill().getUserLName()+" </b></td>\r\n"
						+ "								<td><b>"+order.getBill().getAddr()+"</b></td>\r\n"
						+ "								<td><b>"+order.getBill().getCartTotal()+"</b></td>\r\n"
						+ "\r\n"
						+ "\r\n"
						+ "							</tr>");
			}
		}
		
		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		UserAccountModel u = (UserAccountModel)session.getAttribute("account");
		String status = request.getParameter("status");
		String type="";
		String Status = "";
		String userId = request.getParameter("userId");
		List<OrderModel> order = orders.getAllOrders();
		List<OrderModel> orderOfSeller = new ArrayList<>();
		List<OrderModel> orderAllSeller = new ArrayList<>();
		
		List<ProductInCartModel> listItemOfSeller = productInCart.getListItemOfSellerByStatus(u.getUserId(), 0);

		for(OrderModel i: order) {
			List<ProductInCartModel> listItems = productInCart.getListItemByStatus(i.getCartId(), Integer.parseInt(status));
			List<ProductInCartModel> listItemSeller = productInCart.getListItemOfSeller(Integer.parseInt(userId),i.getCartId());
			
			BillModel bill = listBill.getBillByCartId(i.getCartId());
			i.setBill(bill);
			if(Integer.parseInt(userId) != 1) {
				
//				for(ProductInCartModel c:listItemOfSeller) {
//					
//					if(i.getCartId()==c.getCartId()) {
//						
//						orderOfSeller.add(i);
//					}
//				}
				
				if(i.getStatus() == Integer.parseInt(status) && listItemSeller.size()>0) {
					i.setItems(listItemSeller);
					
					orderOfSeller.add(i);
				}
			}
			else {
				for(ProductInCartModel c:listItems) {
					ProductImageModel prod = productImage.getImagesOfProduct(c.getProductId());
					c.setProduct(prod);
				}
				if(i.getStatus() == Integer.parseInt(status)) {
					i.setItems(listItems);
					orderOfSeller.add(i);
				}
			}
			
			
		}
		if(Integer.parseInt(status)==0) {
			Status = "Incomplete";
			type="pending";
		}
		else if(Integer.parseInt(status)==1) {
			Status = "Complete";
			type="moving";
		}
		else {
			Status = "Cancel";
			type="cancelled";
		}
		PrintWriter out = response.getWriter();
		if(Status.equals("Incomplete") && u.getRoleId() != 1) {
			for(OrderModel o: orderOfSeller) {
				out.println("<tr>\r\n"
						+ "									<th scope=\"row\"><a\r\n"
						+ "										href=\"/Project_WEB/DetailOdersController?cartId="+o.getCartId()+"\">"
						+ "											<b>#"+o.getOrderId()+"</b></a>"
						+ "									</th>\r\n"
						+ "\r\n"
						+ "\r\n"
						+ "										<td>\r\n"
						+ "											<div class=\"tm-status-circle "+type+"\"></div>"+Status+"\r\n"
						+ "										</td>\r\n"
						+ "								<td><b>"+o.getBill().getUserFName()+" "+o.getBill().getUserLName()+" </b></td>\r\n"
						+ "								<td><b>"+o.getBill().getAddr()+"</b></td>\r\n"
						+ "								<td><b>"+o.getBill().getCartTotal()+"</b></td>\r\n"
						+"<td>\r\n"
						+ "												<button class=\"btn btn-primary btn-block\"\r\n"
						+ "													onClick=\"ChangeStatus("+o.getCartId()+", 1)\">\r\n"
						+ "													<i class=\"fa fa-cog fa-spin\"></i>Change Status\r\n"
						+ "												</button>\r\n"
						+ "												<button class=\"btn btn-default btn-block\"\r\n"
						+ "													onClick=\"ChangeStatus("+o.getCartId()+", 2)\">\r\n"
						+ "													<i class=\"fa fa-cog fa-spin\"></i>Cancel Order\r\n"
						+ "												</button>\r\n"
						+ "											</td>"
						+ "\r\n"
						+ "\r\n"
						+ "							</tr>");
			}
		}
		else {
			for(OrderModel o: orderOfSeller) {
				out.println("<tr>\r\n"
						+ "									<th scope=\"row\"><a\r\n"
						+ "										href=\"/Project_WEB/DetailOdersController?cartId="+o.getCartId()+"\">"
						+ "											<b>#"+o.getOrderId()+"</b></a>"
						+ "									</th>\r\n"
						+ "\r\n"
						+ "\r\n"
						+ "										<td>\r\n"
						+ "											<div class=\"tm-status-circle "+type+"\"></div>"+Status+"\r\n"
						+ "										</td>\r\n"
						+ "								<td><b>"+o.getBill().getUserFName()+" "+o.getBill().getUserLName()+" </b></td>\r\n"
						+ "								<td><b>"+o.getBill().getAddr()+"</b></td>\r\n"
						+ "								<td><b>"+o.getBill().getCartTotal()+"</b></td>\r\n"
						+ "\r\n"
						
						+ "\r\n"
						+ "							</tr>");
			}
		}
		
		
	}

}
