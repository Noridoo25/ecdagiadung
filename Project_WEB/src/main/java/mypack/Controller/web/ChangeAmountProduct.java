package mypack.Controller.web;

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

import mypack.Impl.CartServiceImpl;
import mypack.Impl.ProductImageServiceImpl;
import mypack.Impl.ProductServiceImpl;
import mypack.model.ProductInCartModel;
import mypack.model.OrderModel;
import mypack.services.ICartService;
import mypack.services.IProductImageService;
import mypack.services.IProductService;


@WebServlet("/ChangeAmountProduct")
public class ChangeAmountProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
      

    IProductService products = new ProductServiceImpl();
	IProductImageService productHasImage = new ProductImageServiceImpl();
	ICartService cart = new CartServiceImpl();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		try {
			String amount = request.getParameter("amount");
			String total = request.getParameter("total");
			String productId = request.getParameter("id");
			String totalPrice = request.getParameter("totalPrice");
			HttpSession session = request.getSession();
			session.setAttribute("totalPrice", totalPrice);
			if (session != null && session.getAttribute("account") != null) {

				OrderModel order = (OrderModel)session.getAttribute("cart");
				List<ProductInCartModel> carts = order.getItems();
				for(ProductInCartModel pid : carts) {
					if(pid.getProductId() == Integer.parseInt(productId)) {
						pid.setAmount(Integer.parseInt(amount));
						pid.setTotal(Integer.parseInt(total));	
					}	
				}

				order.setTotalPrice(Integer.parseInt(totalPrice));
				session.setAttribute("cart", order);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		doGet(request, response);
	}
}
