package mypack.Controller.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mypack.Impl.CartServiceImpl;
import mypack.Impl.OrderServiceImpl;
import mypack.model.ProductInCartModel;
import mypack.model.OrderModel;
import mypack.services.ICartService;
import mypack.services.IOrderService;


@WebServlet("/MyOrdersController")
public class MyOrdersController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    String userId = null;
    ICartService carts = new CartServiceImpl();
    IOrderService orders = new OrderServiceImpl();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		userId = request.getParameter("userId");
	
		List<OrderModel> listorder = orders.getOrderOfUserByUserId(Integer.parseInt(userId));
		
		request.setAttribute("orderItem", listorder);
		request.getRequestDispatcher("/views/webs/my_orders.jsp").forward(request, response);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
