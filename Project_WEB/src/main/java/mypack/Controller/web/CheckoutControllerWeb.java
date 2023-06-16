package mypack.Controller.web;

import java.io.IOException;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.Year;
import java.time.ZoneId;
import java.sql.Date;
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
import mypack.Impl.UserServiceImpl;
import mypack.model.ProductInCartModel;
import mypack.model.OrderModel;
import mypack.model.UserAccountModel;
import mypack.services.IBilldService;
import mypack.services.ICartService;
import mypack.services.IOrderService;
import mypack.services.IUserService;


@WebServlet("/CheckoutControllerWeb")
public class CheckoutControllerWeb extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    ICartService carts = new CartServiceImpl();
    IUserService userAccounts = new UserServiceImpl();
    IOrderService orders = new OrderServiceImpl();
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		request.getRequestDispatcher("/views/webs/checkout.jsp").forward(request, response);
	}


	@SuppressWarnings("deprecation")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String addr = request.getParameter("address");
		String stress_address = request.getParameter("street_address");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String fName = request.getParameter("firstName");
		String lName = request.getParameter("lastName");
		HttpSession session = request.getSession();
		
		
		
		UserAccountModel user = (UserAccountModel) session.getAttribute("account");
	
		carts.insertCart(user.getUserId());
		
		ProductInCartModel cartId = carts.getCartIdByUserId(user.getUserId());
		
		ProductInCartModel newcartId = carts.getLastCartId();
		LocalDateTime dnow = LocalDateTime.now();
		int year = dnow.getYear();
		int day = dnow.getDayOfMonth();
		int month = dnow.getMonthValue();
		Date date = new Date(year - 1900,month-1,day);
		
		
		UserAccountModel userAccount = userAccounts.get(user.getUserId());
		OrderModel order = (OrderModel)session.getAttribute("cart");
		orders.insertOrder(newcartId.getCartId(), order.getTotalPrice(), date);
		int totalPrice = order.getTotalPrice();
		List<ProductInCartModel> cart = order.getItems();
		for(ProductInCartModel pid : cart) {
			carts.insertProductInCart(cartId.getCartId(), pid.getProductId(), pid.getAmount(), pid.getTotal());
		}
		carts.insertBill(cartId.getCartId(), fName, lName, stress_address+" - "+addr, phone, email, totalPrice + 20000, 20000, totalPrice);
		
		
		request.setAttribute("stress_address", stress_address);
		
		session.removeAttribute("cart");
		request.getRequestDispatcher("/views/webs/thankYou.jsp").forward(request, response);
		
	}

}
