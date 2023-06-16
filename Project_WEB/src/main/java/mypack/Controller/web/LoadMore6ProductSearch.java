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

import mypack.DAO.ISlideImageDAO;
import mypack.Impl.CategoryServiceImpl;
import mypack.Impl.ProductImageServiceImpl;
import mypack.Impl.ProductServiceImpl;
import mypack.Impl.SlideImageDAOImpl;
import mypack.Impl.StoreServiceImpl;
import mypack.model.ProductImageModel;
import mypack.model.ProductModel;
import mypack.services.ICategoryService;
import mypack.services.IProductImageService;
import mypack.services.IProductService;
import mypack.services.IStoreService;

@WebServlet("/LoadMore6ProductSearch")
public class LoadMore6ProductSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;

	ISlideImageDAO slides = new SlideImageDAOImpl();
	ICategoryService cates = new CategoryServiceImpl();
	IProductService products = new ProductServiceImpl();
	IStoreService storeService = new StoreServiceImpl();
	IProductImageService productImage = new ProductImageServiceImpl();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String amount = request.getParameter("exits");
		String key = request.getParameter("key");

		List<ProductModel> productSearch = products.loadMore6ProductSearch(Integer.parseInt(amount), key);
		List<ProductImageModel> imageMainProducts = new ArrayList<>();
		for(ProductModel l: productSearch) {

			ProductImageModel image = productImage.getImagesOfProduct(l.getProductId());
			imageMainProducts.add(image);

		}
		PrintWriter out = response.getWriter();
		for(ProductImageModel l: imageMainProducts) {
			out.println("<div class=\"col-sm-6 col-md-4 col-lg-4\">\r\n"
					+ "						<div class=\"shop-item\">\r\n"
					+ "							<div class=\"shop-item-image\">\r\n"
					+ "								<img\r\n"
					+ "									src=\"/Project_WEB/images/"+l.getCategoryId()+"/"+l.getProductImage()+"\"\r\n"
					+ "									alt=\"Accessories Pack\" />\r\n"
					+ "								<div class=\"shop-item-detail\">\r\n"
					+ "									<a class=\"btn btn-round btn-b\"><span class=\"icon-basket\">Add\r\n"
					+ "											To Cart</span></a>\r\n"
					+ "								</div>\r\n"
					+ "							</div>\r\n"
					+ "							<h4 class=\"shop-item-title font-alt\">\r\n"
					+ "								<a\r\n"
					+ "									href=\"/Project_WEB/ProductControllerWeb?id="+l.getProductId()+"&userId="+l.getSellerId()+"\">"+l.getProductName()+"</a>\r\n"
					+ "							</h4>"+l.getProductPrice()+" VNĐ \r\n"
					+ "						</div>\r\n"
					+ "					</div>");
		}
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
