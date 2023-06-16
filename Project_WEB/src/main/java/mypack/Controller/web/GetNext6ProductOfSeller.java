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
import mypack.Impl.StoreServiceImpl;
import mypack.model.CategoryModel;
import mypack.model.ProductImageModel;
import mypack.model.ProductModel;
import mypack.model.SlideImageModel;
import mypack.model.StoreModel;
import mypack.services.ICategoryService;
import mypack.services.IProductImageService;
import mypack.services.IProductService;
import mypack.services.IStoreService;

@WebServlet("/GetNext6ProductOfSeller")
public class GetNext6ProductOfSeller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    IStoreService stores = new StoreServiceImpl();
    ISlideImageDAO slides = new SlideImageDAOImpl();
    ICategoryService cates = new CategoryServiceImpl();
    IProductService products = new ProductServiceImpl();
    IProductImageService productImage = new ProductImageServiceImpl();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String sellerId = request.getParameter("sellerId");
		String index = request.getParameter("index");
		String page = request.getParameter("page");
		String cateId = request.getParameter("cid");
		String Sort = request.getParameter("s");
		List<ProductModel> allProduct = null;
		List<ProductModel> countProduct = null;
		if(Sort.equals("productId_desc") && cateId.compareTo("all")!=0) {
			allProduct = products.getNext6ProductFilterOfSeller(Integer.parseInt(cateId), "desc", "productId",Integer.parseInt(index) ,Integer.parseInt(sellerId));
			countProduct=products.getAllProductByCategoryIdOfSeller(Integer.parseInt(cateId), "desc", "productId",Integer.parseInt(sellerId));;
		}
		else if(Sort.equals("productId_asc") && cateId.compareTo("all")!=0) {
			countProduct=products.getAllProductByCategoryIdOfSeller(Integer.parseInt(cateId), "asc", "productId",Integer.parseInt(sellerId));;
			allProduct = products.getNext6ProductFilterOfSeller(Integer.parseInt(cateId), "asc", "productId",Integer.parseInt(index),Integer.parseInt(sellerId));
		}
		else if(Sort.equals("productPrice_asc") && cateId.compareTo("all")!=0) {
			countProduct=products.getAllProductByCategoryIdOfSeller(Integer.parseInt(cateId), "asc", "productPrice",Integer.parseInt(sellerId));
			allProduct = products.getNext6ProductFilterOfSeller(Integer.parseInt(cateId), "asc", "productPrice",Integer.parseInt(index),Integer.parseInt(sellerId));
		}
		else if(Sort.equals("productPrice_desc") && cateId.compareTo("all")!=0) {
			countProduct=products.getAllProductByCategoryIdOfSeller(Integer.parseInt(cateId), "desc", "productPrice",Integer.parseInt(sellerId));
			allProduct = products.getNext6ProductFilterOfSeller(Integer.parseInt(cateId), "desc", "productPrice", Integer.parseInt(index),Integer.parseInt(sellerId));
		}
		else {
			allProduct = products.getNext6ProductOfSeller(Integer.parseInt(index),Integer.parseInt(sellerId));
			countProduct=products.getAllSeller(Integer.parseInt(sellerId));;
		}
		int count = countProduct.size();
		int beginPage = 1;
		int id = 0;
		if(index != null) {
			id = Integer.parseInt(index);
			request.setAttribute("cateId", cateId);
			request.setAttribute("Sort", Sort);	
		}
		if(page != null) {
			beginPage = Integer.parseInt(page);
		}
		int endPage =  count/6;
		if(count % 6 != 0 ) {
			endPage ++;
		}
		request.setAttribute("id", id);
		request.setAttribute("beginPage", beginPage);
		request.setAttribute("endPage", endPage);
		StoreModel store = new StoreModel();
		if(sellerId != null) {
			store = stores.getStoreOfSeller(Integer.parseInt(sellerId));
		}
		List<CategoryModel> cate = cates.getAll();
		request.setAttribute("cates", cate);
		List<ProductImageModel> imageMainProducts = new ArrayList<>();
		
		for(ProductModel l: allProduct) {
			
			ProductImageModel image = productImage.getImagesOfProduct(l.getProductId());
			imageMainProducts.add(image);
			
			
		}
		
		request.setAttribute("slideImage", store);
		request.setAttribute("sellerId", sellerId);
		request.setAttribute("imageMainProduct", imageMainProducts);
		
		request.getRequestDispatcher("/views/seller/myShop.jsp").forward(request, response);
	
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}
