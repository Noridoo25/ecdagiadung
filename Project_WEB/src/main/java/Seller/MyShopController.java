package Seller;

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
import mypack.model.ProductImageModel;
import mypack.model.ProductModel;
import mypack.model.SlideImageModel;
import mypack.model.StoreModel;
import mypack.services.ICategoryService;
import mypack.services.ICommentService;
import mypack.services.IProductImageService;
import mypack.services.IProductService;
import mypack.services.IStoreService;


@WebServlet("/MyShopController")
public class MyShopController extends HttpServlet {
	private static final long serialVersionUID = 1L;


	public MyShopController() {
		super();
		// TODO Auto-generated constructor stub
	}


	IStoreService stores = new StoreServiceImpl();
	ISlideImageDAO slides = new SlideImageDAOImpl();
	ICategoryService cates = new CategoryServiceImpl();
	IProductService products = new ProductServiceImpl();
	IProductImageService productImage = new ProductImageServiceImpl();
	ICommentService comments = new CommentServiceImpl();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String id = request.getParameter("id");
		List<CategoryModel> cate = cates.getAll();
		request.setAttribute("cates", cate);
		StoreModel store = new StoreModel();
		
		//rating of store
		int numberRating =  comments.getNumberRatingOfStore(Integer.parseInt(id));
		request.setAttribute("numberRating" , numberRating);
		
		//number product of Store
		int numberProduct = products.numberProductOfStore(Integer.parseInt(id));
		request.setAttribute("numberProduct", numberProduct);
				
		if(id != null) {
			store = stores.getStoreOfSeller(Integer.parseInt(id));



			if(store!=null) {
				List<ProductModel> allProduct = products.getTop6ProductSeller(Integer.parseInt(id));
				List<ProductModel> countProduct = products.getAllSeller(Integer.parseInt(id));
				List<ProductImageModel> imageMainProducts = new ArrayList<>();
				for(ProductModel l: allProduct) {

					ProductImageModel image = productImage.getImagesOfProduct(l.getProductId());
					if(image != null) {
						imageMainProducts.add(image);
					}

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
				request.setAttribute("slideImage", store);
				request.setAttribute("imageMainProduct", imageMainProducts);
				request.getRequestDispatcher("/views/seller/myShop.jsp").forward(request, response);
			}
			else {
				request.getRequestDispatcher("/RegisterStoreController?userId="+id).forward(request, response);
			}
		}
	}

	String cateId = null;
	String Sort = null;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		cateId = request.getParameter("categoryId");
		Sort = request.getParameter("sort");
		String sellerId = request.getParameter("Id");
		StoreModel store = stores.getStoreOfSeller(Integer.parseInt(sellerId));

		request.setAttribute("slideImage", store);
		List<ProductModel> allProduct = null;
		List<ProductModel> countProduct = null;
		if(Sort.equals("productId_desc") && cateId.compareTo("all")!=0) {
			allProduct = products.get6ProductByCategoryIdOfSeller(Integer.parseInt(cateId), "desc", "productId", Integer.parseInt(sellerId));
			countProduct=products.getAllProductByCategoryIdOfSeller(Integer.parseInt(cateId), "desc", "productId", Integer.parseInt(sellerId));;
		}
		else if(Sort.equals("productId_asc")&& cateId.compareTo("all")!=0) {
			allProduct = products.get6ProductByCategoryIdOfSeller(Integer.parseInt(cateId), "asc", "productId", Integer.parseInt(sellerId));
			countProduct=products.getAllProductByCategoryIdOfSeller(Integer.parseInt(cateId), "asc", "productId", Integer.parseInt(sellerId));
		}
		else if(Sort.equals("productPrice_asc")&& cateId.compareTo("all")!=0) {
			allProduct = products.get6ProductByCategoryIdOfSeller(Integer.parseInt(cateId), "asc", "productPrice", Integer.parseInt(sellerId));
			countProduct=products.getAllProductByCategoryIdOfSeller(Integer.parseInt(cateId), "asc", "productPrice", Integer.parseInt(sellerId));
		}
		else if(Sort.equals("productPrice_desc")&& cateId.compareTo("all")!=0) {
			allProduct = products.get6ProductByCategoryIdOfSeller(Integer.parseInt(cateId), "desc", "productPrice", Integer.parseInt(sellerId));
			countProduct=products.getAllProductByCategoryIdOfSeller(Integer.parseInt(cateId), "desc", "productPrice", Integer.parseInt(sellerId));

		}
		else if(cateId.equals("all") || Sort.equals("defaul")){
			allProduct = products.getTop6ProductSeller(Integer.parseInt(sellerId));
			countProduct=products.getAllSeller(Integer.parseInt(sellerId));;
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
//		List<SlideImageModel> slideImage = slides.getSlideImage(2);
//		request.setAttribute("slideImage", slideImage);
		List<CategoryModel> cate = cates.getAll();
		request.setAttribute("cates", cate);
		List<ProductImageModel> imageMainProducts = new ArrayList<>();
		for(ProductModel l: allProduct) {

			ProductImageModel image = productImage.getImagesOfProduct(l.getProductId());
			if(image != null) {
				imageMainProducts.add(image);
			}
				

		}
		request.setAttribute("sellerId", sellerId);
		request.setAttribute("imageMainProduct", imageMainProducts);

		request.getRequestDispatcher("/views/seller/myShop.jsp").forward(request, response);

	}

}
