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
import mypack.model.CategoryModel;
import mypack.model.ProductImageModel;
import mypack.model.ProductModel;
import mypack.model.SlideImageModel;
import mypack.services.ICategoryService;
import mypack.services.IProductImageService;
import mypack.services.IProductService;


@WebServlet("/AllProductControllerWeb")
public class AllProductControllerWeb extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    ISlideImageDAO slides = new SlideImageDAOImpl();
    ICategoryService cates = new CategoryServiceImpl();
    IProductService products = new ProductServiceImpl();
    IProductImageService productImage = new ProductImageServiceImpl();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		List<SlideImageModel> slideImage = slides.getSlideImage(2);
		request.setAttribute("slideImage", slideImage);
		List<CategoryModel> cate = cates.getAll();
		request.setAttribute("cates", cate);
		List<ProductModel> allProduct = products.getTop6Product();
		List<ProductModel> countProduct = products.getAll();;
		
		List<ProductImageModel> imageMainProducts = new ArrayList<>();
		for(ProductModel l: allProduct) {
			
			ProductImageModel image = productImage.getImagesOfProduct(l.getProductId());
			imageMainProducts.add(image);
			
		}
		int count = countProduct.size();
		String index = request.getParameter("index");
		int beginPage = 1;
		if(index != null) {
			beginPage = Integer.parseInt(index);
		}
		
		
		int pageSize = 6;
		int endPage = 0;
		endPage = count / pageSize;
		if(count % pageSize != 0 ) {
			endPage ++;
		}
		String sellerId = request.getParameter("id");
		request.setAttribute("sellerId", sellerId);
		request.setAttribute("beginPage", beginPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("imageMainProduct", imageMainProducts);
		
		request.getRequestDispatcher("/views/webs/all_product.jsp").forward(request, response);
		
	}


	String cateId = null;
	String Sort = null;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		cateId = request.getParameter("categoryId");
		Sort = request.getParameter("sort");
		List<ProductModel> allProduct = null;
		List<ProductModel> countProduct = null;
		if(Sort.equals("productId_desc") && cateId.compareTo("all")!=0) {
			allProduct = products.get6ProductByCategoryId(Integer.parseInt(cateId), "desc", "productId");
			countProduct=products.getAllProductByCategoryId(Integer.parseInt(cateId), "desc", "productId");;
		}
		else if(Sort.equals("productId_asc") && cateId.compareTo("all")!=0) {
			allProduct = products.get6ProductByCategoryId(Integer.parseInt(cateId), "asc", "productId");
			countProduct=products.getAllProductByCategoryId(Integer.parseInt(cateId), "asc", "productId");
		}
		else if(Sort.equals("productPrice_asc") && cateId.compareTo("all")!=0) {
			allProduct = products.get6ProductByCategoryId(Integer.parseInt(cateId), "asc", "productPrice");
			countProduct=products.getAllProductByCategoryId(Integer.parseInt(cateId), "asc", "productPrice");
		}
		else if(Sort.equals("productPrice_desc") && cateId.compareTo("all")!=0) {
			allProduct = products.get6ProductByCategoryId(Integer.parseInt(cateId), "desc", "productPrice");
			countProduct=products.getAllProductByCategoryId(Integer.parseInt(cateId), "desc", "productPrice");
			
		}
		else if(cateId.equals("all") || Sort.equals("defaul")){
			allProduct = products.getTop6Product();
			countProduct=products.getAll();;
		}
		int count = countProduct.size();
		int beginPage = 1;
		request.setAttribute("id", beginPage);
		request.setAttribute("cateId", cateId);
		request.setAttribute("Sort", Sort);
		int endPage =  count/6;
		if(count % 6 != 0 ) {
			endPage ++;
		}
		
		request.setAttribute("beginPage", beginPage);
		request.setAttribute("endPage", endPage);
		List<SlideImageModel> slideImage = slides.getSlideImage(2);
		request.setAttribute("slideImage", slideImage);
		List<CategoryModel> cate = cates.getAll();
		request.setAttribute("cates", cate);
		List<ProductImageModel> imageMainProducts = new ArrayList<>();
		for(ProductModel l: allProduct) {
			
			ProductImageModel image = productImage.getImagesOfProduct(l.getProductId());
			
			imageMainProducts.add(image);
			
		}
		
		request.setAttribute("imageMainProduct", imageMainProducts);
		
		request.getRequestDispatcher("/views/webs/all_product.jsp").forward(request, response);
	}

}
