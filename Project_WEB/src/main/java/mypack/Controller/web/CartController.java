package mypack.Controller.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.tribes.ErrorHandler;

import mypack.Impl.CartServiceImpl;
import mypack.Impl.ProductImageServiceImpl;
import mypack.Impl.ProductServiceImpl;
import mypack.model.ProductInCartModel;
import mypack.model.OrderModel;
import mypack.model.ProductImageModel;

import mypack.model.UserAccountModel;
import mypack.services.ICartService;
import mypack.services.IProductImageService;
import mypack.services.IProductService;

@WebServlet("/CartController")
public class CartController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	IProductService products = new ProductServiceImpl();
	IProductImageService productHasImage = new ProductImageServiceImpl();
	ICartService cart = new CartServiceImpl();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		try {
			HttpSession session = request.getSession();
			
			String productId = "";
			String productPrice = request.getParameter("price");
			int totalAllProduct = 0;
			int amount = 1;
			UserAccountModel u = (UserAccountModel) session.getAttribute("account");
			request.setAttribute("username", u.getUserName());
			
			if (session != null && session.getAttribute("account") != null) {
				productId = request.getParameter("productId");		
				if(productId != null && productPrice!=null) {
					if(session.getAttribute("cart")==null) {

						ProductImageModel product = productHasImage.getImagesOfProduct(Integer.parseInt(productId));
						OrderModel order = new OrderModel();
						List<ProductInCartModel> carts = new ArrayList<>();
						ProductInCartModel cart = new ProductInCartModel();
						cart.setProductId(product.getProductId());
						cart.setAmount(amount);
						cart.setProduct(product);
						cart.setTotal(Integer.parseInt(productPrice));
						carts.add(cart);
						order.setItems(carts);
						session.setAttribute("cart", order);
						totalAllProduct += cart.getTotal();
						order.setTotalPrice(totalAllProduct);
						session.setAttribute("totalPrice", totalAllProduct);
						request.setAttribute("totalAllProduct",totalAllProduct);
					}
					else {
						boolean checkOrderExists = false;
						OrderModel order = (OrderModel)session.getAttribute("cart");
						List<ProductInCartModel> carts = order.getItems();
						for(ProductInCartModel pid : carts) {
							if(pid.getProductId() == Integer.parseInt(productId)) {
								pid.setAmount(pid.getAmount()+amount);
								pid.setTotal(Integer.parseInt(productPrice)*pid.getAmount());
								checkOrderExists =true;
							}
							totalAllProduct += pid.getTotal();
						}
						if(checkOrderExists == false) {
							ProductImageModel product = productHasImage.getImagesOfProduct(Integer.parseInt(productId));
							ProductInCartModel cart = new ProductInCartModel();
							cart.setProductId(product.getProductId());
							cart.setAmount(amount);
							cart.setProduct(product);
							cart.setTotal(Integer.parseInt(productPrice));
							carts.add(cart);
							order.setItems(carts);
							totalAllProduct += cart.getTotal();
						}
						order.setTotalPrice(totalAllProduct);
						session.setAttribute("cart", order);
						session.setAttribute("totalPrice", totalAllProduct);
						request.setAttribute("totalAllProduct",totalAllProduct);
					}
				}
				else {
					request.getRequestDispatcher("/views/webs/shopping_cart.jsp").forward(request, response);
					return;
				}
			}
			else {
				request.getRequestDispatcher("/views/webs/login_register.jsp").forward(request, response);
			}
		
		} catch (Exception e) {
			PrintWriter out = response.getWriter();
			out.print("false");
		}
		
		}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		doGet(request, response);
	}

}
