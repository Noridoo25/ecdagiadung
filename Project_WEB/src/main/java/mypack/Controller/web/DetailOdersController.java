package mypack.Controller.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mypack.Impl.BillServiceImpl;
import mypack.Impl.CartServiceImpl;
import mypack.Impl.ProductImageServiceImpl;
import mypack.Impl.ProductServiceImpl;
import mypack.model.BillModel;
import mypack.model.ProductInCartModel;
import mypack.model.ProductImageModel;
import mypack.model.ProductModel;
import mypack.services.IBilldService;
import mypack.services.ICartService;
import mypack.services.IProductImageService;
import mypack.services.IProductService;


@WebServlet("/DetailOdersController")
public class DetailOdersController extends HttpServlet {
	private static final long serialVersionUID = 1L;


	ICartService productInCart = new CartServiceImpl();
	IProductService products = new ProductServiceImpl();
	IProductImageService productImage = new ProductImageServiceImpl();
	IBilldService bills = new BillServiceImpl();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String cartId = request.getParameter("cartId");
		String userId = request.getParameter("userId");
		List<ProductInCartModel> carts = new ArrayList<>();
		if(userId == null) {
			carts = productInCart.getListItem(Integer.parseInt(cartId));
		}
		else {
			carts = productInCart.getListItemOfSeller(Integer.parseInt(userId),Integer.parseInt(cartId));
		}

		BillModel bill = bills.getBillByCartId(Integer.parseInt(cartId));
		for(ProductInCartModel i:carts) {
			if(bill.getCartId()==i.getCartId()) {
				ProductImageModel image = productImage.getImagesOfProduct(i.getProductId());
				i.setProduct(image);
			}
			
		}

		
		request.setAttribute("bill", bill);
		request.setAttribute("items", carts);
		request.getRequestDispatcher("/views/webs/detail_item.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		doGet(request, response);
	}

}
