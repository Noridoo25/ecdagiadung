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


@WebServlet("/GetNext6Product")
public class GetNext6Product extends HttpServlet {
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
		String cateId = request.getParameter("cid");
		String Sort = request.getParameter("s");
		List<ProductModel> allProduct = null;
		List<ProductModel> countProduct = null;
		if(Sort.equals("productId_desc") && cateId.compareTo("all")!=0 ) {
			allProduct = products.getNext6ProductFilter(Integer.parseInt(cateId), "desc", "productId",Integer.parseInt(index) );
			countProduct=products.getAllProductByCategoryId(Integer.parseInt(cateId), "desc", "productId");;
		}
		else if(Sort.equals("productId_asc")&& cateId.compareTo("all")!=0) {
			countProduct=products.getAllProductByCategoryId(Integer.parseInt(cateId), "asc", "productId");;
			allProduct = products.getNext6ProductFilter(Integer.parseInt(cateId), "asc", "productId",Integer.parseInt(index));
		}
		else if(Sort.equals("productPrice_asc")&& cateId.compareTo("all")!=0) {
			countProduct=products.getAllProductByCategoryId(Integer.parseInt(cateId), "asc", "productPrice");
			allProduct = products.getNext6ProductFilter(Integer.parseInt(cateId), "asc", "productPrice",Integer.parseInt(index));
		}
		else if(Sort.equals("productPrice_desc")&& cateId.compareTo("all")!=0) {
			countProduct=products.getAllProductByCategoryId(Integer.parseInt(cateId), "desc", "productPrice");
			allProduct = products.getNext6ProductFilter(Integer.parseInt(cateId), "desc", "productPrice", Integer.parseInt(index));
		}
		else {
			allProduct = products.getNext6Product(Integer.parseInt(index));
			countProduct=products.getAll();;
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


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		doGet(request, response);
	}

}
