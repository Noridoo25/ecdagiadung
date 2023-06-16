package mypack.Controller.web;

import java.io.IOException;
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
import mypack.model.ProductImageModel;
import mypack.model.ProductModel;
import mypack.services.ICategoryService;
import mypack.services.IProductImageService;
import mypack.services.IProductService;


@WebServlet("/GetNext6ProductSearch")
public class GetNext6ProductSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;



	ISlideImageDAO slides = new SlideImageDAOImpl();
	ICategoryService cates = new CategoryServiceImpl();
	IProductService products = new ProductServiceImpl();
	IProductImageService productImage = new ProductImageServiceImpl();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String index = request.getParameter("index");
		String page = request.getParameter("page");
		String key = request.getParameter("key");
		List<ProductModel> product = products.getNext6ProductSearch(Integer.parseInt(index), key);

		List<ProductModel> productsSearch = products.searchProduct(key);
		List<ProductImageModel> imageMainProducts = new ArrayList<>();
		for(ProductModel l: product) {

			ProductImageModel image = productImage.getImagesOfProduct(l.getProductId());
			imageMainProducts.add(image);

		}
		int count = productsSearch.size();
		
		int beginPage = 1;
		int id = 0;
		if(index != null) {
			id = Integer.parseInt(index);
			
		}
		if(page != null) {
			beginPage = Integer.parseInt(page);
		}
		int pageSize = 6;
		int endPage = 0;
		endPage = count / pageSize;
		if(count % pageSize != 0 ) {
			endPage ++;
		}
		request.setAttribute("key", key);
		request.setAttribute("id", id);
		request.setAttribute("beginPage", beginPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("imageMainProduct", imageMainProducts);
		request.getRequestDispatcher("/views/webs/searchProduct.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		doGet(request, response);
	}

}
