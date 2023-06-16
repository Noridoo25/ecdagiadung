
package mypack.Controller.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import mypack.Impl.ProductImageServiceImpl;
import mypack.Impl.ProductServiceImpl;
import mypack.model.ProductImageModel;
import mypack.model.ProductModel;
import mypack.services.IProductImageService;
//import mypack.services.IProductImageService;
import mypack.services.IProductService;

@WebServlet("/HomeControllerWeb")
public class HomeController extends HttpServlet {


	private static final long serialVersionUID = 1L;
	IProductService products = new ProductServiceImpl();
	IProductImageService productImageService = new ProductImageServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		List<ProductModel> product = products.latestProduct();
		

		List<ProductImageModel> img = new ArrayList<>();
		for(ProductModel i:product) {
			ProductImageModel image = productImageService.getImagesOfProduct(i.getProductId());
			img.add(image);
		}
		req.setAttribute("latestProduct", img);
		
		List<ProductImageModel> exclusiveProduct = productImageService.exclusiveProduct();
		//req.setAttribute("exclusiveProduct", exclusiveProduct);
	
		RequestDispatcher rd = req.getRequestDispatcher("/views/webs/home.jsp");
		rd.forward(req, resp);
		
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}

}
