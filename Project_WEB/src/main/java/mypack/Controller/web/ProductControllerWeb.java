package mypack.Controller.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mypack.DAO.ISlideImageDAO;
import mypack.Impl.CartServiceImpl;
import mypack.Impl.CategoryServiceImpl;
import mypack.Impl.CommentServiceImpl;
import mypack.Impl.ProductImageServiceImpl;
import mypack.Impl.ProductServiceImpl;
import mypack.Impl.SlideImageDAOImpl;
import mypack.Impl.StoreServiceImpl;
import mypack.model.CartModel;
import mypack.model.CategoryModel;
import mypack.model.CommentModel;
import mypack.model.ProductImageModel;
import mypack.model.ProductInCartModel;
import mypack.model.ProductModel;
import mypack.model.SlideImageModel;
import mypack.model.StoreModel;
import mypack.model.UserAccountModel;
import mypack.services.ICartService;
import mypack.services.ICategoryService;
import mypack.services.ICommentService;
import mypack.services.IProductImageService;
import mypack.services.IProductService;
import mypack.services.IStoreService;

@WebServlet("/ProductControllerWeb")
public class ProductControllerWeb extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    IProductService products = new ProductServiceImpl();
    ICategoryService cates = new CategoryServiceImpl();
    ISlideImageDAO slides = new SlideImageDAOImpl();
    IStoreService stores = new StoreServiceImpl();
    IProductImageService allImages = new ProductImageServiceImpl();
    ICommentService comments = new CommentServiceImpl();
    ICartService carts = new CartServiceImpl();
    
    String sellerId = "";
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String id = request.getParameter("id");//productId
		sellerId = request.getParameter("userId");
		List<ProductImageModel> listImage = allImages.getAllImagesOfProduct(Integer.parseInt(id));
		
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
		List<CommentModel> comment = comments.getAllCommentOfProduct(Integer.parseInt(id));
		List<CommentModel> top6comment = comments.getNext6CommentOfProduct(Integer.parseInt(id), 1);
		int count = comment.size();
		
		int beginPage = 1;
		
		int pageSize = 6;
		int endPage = 0;
		endPage = count / pageSize;
		if(count % pageSize != 0 ) {
			endPage ++;
		}
		int checkBought = 0;
		HttpSession session = request.getSession();
		UserAccountModel u = (UserAccountModel)session.getAttribute("account");
		try {
			List<CartModel> cart = carts.getListCartIdByUserId(u.getUserId());
			for(CartModel c:cart) {
				ProductInCartModel check = carts.checkBougth(c.getCartId());
				if(check.getProductId() == Integer.parseInt(id)) {
					checkBought = 1;
					break;
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		request.setAttribute("checkBought", checkBought);
		request.setAttribute("beginPage", beginPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("comment", top6comment);
		request.setAttribute("allComment", comment);
		request.setAttribute("sellerId", sellerId);
		request.setAttribute("store", store);
		request.setAttribute("imageMainProduct", imageMainProducts);
		
		//rating of store
		int numberRating =  comments.getNumberRatingOfStore(Integer.parseInt(sellerId));
		request.setAttribute("numberRating" , numberRating);
		
		//number product of Store
		int numberProduct = products.numberProductOfStore(Integer.parseInt(sellerId));
		request.setAttribute("numberProduct", numberProduct);
		request.getRequestDispatcher("/views/webs/product.jsp").forward(request, response);
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		doGet(request, response);
	}

}
