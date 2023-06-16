package mypack.Controller.web;

import java.io.IOException;
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


@WebServlet("/RemoveItemInCart")
public class RemoveItemInCart extends HttpServlet {
	private static final long serialVersionUID = 1L;

    IProductService products = new ProductServiceImpl();
	IProductImageService productHasImage = new ProductImageServiceImpl();
	ICartService cart = new CartServiceImpl();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		try {
			String productId = request.getParameter("id");
			HttpSession session = request.getSession();

			try {
				if (session != null && session.getAttribute("account") != null) {
					OrderModel order = (OrderModel)session.getAttribute("cart");
					List<ProductInCartModel> carts = order.getItems();
					Integer total = order.getTotalPrice();
					for(ProductInCartModel pid : carts) {
						if(pid.getProductId() == Integer.parseInt(productId)) {
							total -= pid.getTotal();
							carts.remove(pid);
							order.setItems(carts);
							order.setTotalPrice(total);
							session.setAttribute("cart", order);
							session.setAttribute("totalPrice", total);
						}
					}
					

					request.getRequestDispatcher("/views/webs/shopping_cart.jsp").forward(request, response);
					return;
				}
			} catch (Exception e) {
				e.printStackTrace();
				
			}
			request.getRequestDispatcher("/views/webs/shopping_cart.jsp").forward(request, response);
		
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
