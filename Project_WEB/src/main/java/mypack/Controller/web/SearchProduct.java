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
import mypack.Impl.CommentServiceImpl;
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
import mypack.services.ICommentService;
import mypack.services.IProductImageService;
import mypack.services.IProductService;
import mypack.services.IStoreService;

@WebServlet("/SearchProduct")
public class SearchProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;

    ICommentService comments = new CommentServiceImpl();
    ISlideImageDAO slides = new SlideImageDAOImpl();
    ICategoryService cates = new CategoryServiceImpl();
    IProductService products = new ProductServiceImpl();
    IStoreService storeService = new StoreServiceImpl();
    IProductImageService productImage = new ProductImageServiceImpl();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		try {
			List<SlideImageModel> slideImage = slides.getSlideImage(2);
			request.setAttribute("slideImage", slideImage);
			List<CategoryModel> cate = cates.getAll();
			request.setAttribute("cates", cate);
			String key = request.getParameter("txt");
			//search product
//			List<ProductModel> productSearch = products.searchTop6Product(key);
			List<ProductModel> productSearch = products.searchProduct(key);
			List<ProductImageModel> imageMainProducts = new ArrayList<>();
			
			//search Store
			List<StoreModel> listStore = storeService.listStoreForKey(key);
			for(StoreModel s:listStore) {
				int numberRating =  comments.getNumberRatingOfStore(s.getUserId());
				int numberProduct = products.numberProductOfStore(s.getUserId());
				s.setNumberProduct(numberProduct);
				s.setNumberRating(numberRating);
			}
			request.setAttribute("listStore", listStore);
			for(ProductModel l: productSearch) {
				
				ProductImageModel image = productImage.getImagesOfProduct(l.getProductId());
				imageMainProducts.add(image);
				
			}
			PrintWriter out = response.getWriter();
			for(StoreModel s: listStore) {
				out.println(
						"				<div class=\"col-sm-12 box__shop\"style=\"margin: 20px 0;\">\r\n"
						+ "					<div class=\" avatar__shop\">\r\n"
						+ "						<a class=\"box-avatar-shop\">\r\n"
						+ "							<div class=\"box-avatar__placeholder\">\r\n"
						+ "								<img src=\"/Project_WEB/images/AvatarShop/" + s.getAvartarStore() + "\" alt=\"\">\r\n"
						+ "							</div>\r\n"
						+ "						</a>\r\n"
						+ "						<div class=\"info-shop\">\r\n"
						+ "							<div class=\"shop-name\">\r\n"
						+ "								<label>" + s.getStoreName() + "</label>\r\n"
						+ "							</div>\r\n"
						+ "							<div class=\"box__amount\">\r\n"
						+ "									<div class=\"rating-shop\">\r\n"
						+ "										<label class=\"rating-text\">RATING: </label> <label\r\n"
						+ "											class=\"rating-amount\">" + s.getNumberRating() + "</label>\r\n"
						+ "									</div>\r\n"
						+ "									<div class=\"amount-product\">\r\n"
						+ "										<label class=\"amount-product-text\">PRODUCT: </label> <label\r\n"
						+ "											class=\"product-amount\">" + s.getNumberProduct() + " </label>\r\n"
						+ "									</div>\r\n"
						+ "								</div>"
						+ "							<a href=\"/Project_WEB/MyShopController?id="+s.getUserId()+"\"\r\n"
						+ "								class=\"btn-shop btn btn-lg btn-block btn-round btn-b\"> <i\r\n"
						+ "								class=\"fa fa-shopping-bag\" aria-hidden=\"true\"></i> REVIEW SHOP\r\n"
						+ "							</a>\r\n"
						+ "						</div>\r\n"
						+ "					</div>\r\n"
						+ "				</div>\r\n"
						);
			}
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
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		List<SlideImageModel> slideImage = slides.getSlideImage(2);
		
		List<CategoryModel> cate = cates.getAll();
		
		String key = request.getParameter("search");
		request.setAttribute("key", key);
		List<ProductModel> productSearch = products.searchTop6Product(key);
		List<StoreModel> listStore = storeService.listStoreForKey(key);
		for(StoreModel s:listStore) {
			int numberRating =  comments.getNumberRatingOfStore(s.getUserId());
			int numberProduct = products.numberProductOfStore(s.getUserId());
			s.setNumberProduct(numberProduct);
			s.setNumberRating(numberRating);
		}
		List<ProductModel> productsSearch = products.searchProduct(key);
		List<ProductImageModel> imageMainProducts = new ArrayList<>();
		for(ProductModel l: productSearch) {
			
			ProductImageModel image = productImage.getImagesOfProduct(l.getProductId());
			imageMainProducts.add(image);
			
		}
		int count = productsSearch.size();
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
		request.setAttribute("slideImage", slideImage);
		request.setAttribute("cates", cate);
		request.setAttribute("listStore", listStore);
		request.setAttribute("beginPage", beginPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("imageMainProduct", imageMainProducts);
		request.getRequestDispatcher("/views/webs/searchProduct.jsp").forward(request, response);
	}

}
