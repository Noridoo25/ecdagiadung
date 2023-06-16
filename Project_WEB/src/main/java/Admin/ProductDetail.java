package Admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mypack.Impl.CategoryServiceImpl;
import mypack.Impl.ProductImageServiceImpl;
import mypack.Impl.ProductServiceImpl;
import mypack.model.CategoryModel;
import mypack.model.ProductImageModel;
import mypack.model.ProductModel;
import mypack.services.ICategoryService;
import mypack.services.IProductImageService;
import mypack.services.IProductService;

@WebServlet("/admin/ProductDetail")
public class ProductDetail extends HttpServlet{
	

	private static final long serialVersionUID = 1L;

	IProductImageService productService = new ProductImageServiceImpl();
	ICategoryService cates = new CategoryServiceImpl();
	String productid= null;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		productid = req.getParameter("productid");
		int iproductId  = Integer.parseInt(productid);
		ProductImageModel product = productService.getImagesOfProduct(iproductId);
		List<CategoryModel> cate = cates.getAll();
		req.setAttribute("cates", cate);
		req.setAttribute("product", product);
		req.getRequestDispatcher("/views/admin/editProduct.jsp").forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		super.doPost(req, resp);
	}

}
