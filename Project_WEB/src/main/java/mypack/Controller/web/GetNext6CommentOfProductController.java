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
import mypack.Impl.CommentServiceImpl;
import mypack.Impl.ProductImageServiceImpl;
import mypack.Impl.ProductServiceImpl;
import mypack.Impl.SlideImageDAOImpl;
import mypack.Impl.StoreServiceImpl;
import mypack.model.CategoryModel;
import mypack.model.CommentModel;
import mypack.model.ProductImageModel;
import mypack.model.ProductModel;
import mypack.model.StoreModel;
import mypack.services.ICategoryService;
import mypack.services.ICommentService;
import mypack.services.IProductImageService;
import mypack.services.IProductService;
import mypack.services.IStoreService;


@WebServlet("/GetNext6CommentOfProductController")
public class GetNext6CommentOfProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    IProductService products = new ProductServiceImpl();
    ICategoryService cates = new CategoryServiceImpl();
    ISlideImageDAO slides = new SlideImageDAOImpl();
    IStoreService stores = new StoreServiceImpl();
    IProductImageService allImages = new ProductImageServiceImpl();
    ICommentService comments = new CommentServiceImpl();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String index = request.getParameter("index");
		String page = request.getParameter("page");
		String productId = request.getParameter("productId");
		String sellerId = request.getParameter("seller");
		
		
		List<ProductImageModel> listImage = allImages.getAllImagesOfProduct(Integer.parseInt(productId));

		CategoryModel cate = cates.getCategoryById((listImage.get(0).getCategoryId()));
		request.setAttribute("productDetail", listImage);
		request.setAttribute("cate", cate);
		List<ProductModel> allProduct = products.getAllRelateProductByCategoryId(cate.getCategoryId(), (listImage.get(0).getProductName()));

		List<ProductImageModel> imageMainProducts = new ArrayList<>();
		for(ProductModel l: allProduct) {

			ProductImageModel image = allImages.getImagesOfProduct(l.getProductId());
			imageMainProducts.add(image);

		}
		StoreModel store = stores.getStoreOfSeller(Integer.parseInt(sellerId));
		List<CommentModel> comment = comments.getAllCommentOfProduct(Integer.parseInt(productId));
		List<CommentModel> top6comment = comments.getNext6CommentOfProduct(Integer.parseInt(productId), Integer.parseInt(index));
		int count = comment.size();

		int beginPage = 1;
		int id = 0;
		if(index != null) {
			id = Integer.parseInt(index);
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
		request.setAttribute("comment", top6comment);
		request.setAttribute("allComment", comment);
		request.setAttribute("sellerId", sellerId);
		request.setAttribute("store", store);
		request.setAttribute("imageMainProduct", imageMainProducts);
		request.getRequestDispatcher("/views/webs/product.jsp").forward(request, response);
		request.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		doGet(request, response);
	}

}
