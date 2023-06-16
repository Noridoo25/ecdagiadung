package Admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mypack.Impl.CategoryServiceImpl;
import mypack.Impl.ProductServiceImpl;
import mypack.Impl.StoreServiceImpl;
import mypack.model.CategoryModel;
import mypack.model.ProductModel;
import mypack.model.StoreModel;
import mypack.services.ICategoryService;
import mypack.services.IProductService;
import mypack.services.IStoreService;

@WebServlet("/admin/ListAllProductAndCategory")
public class ListAllProductAndCategory extends HttpServlet{


	private static final long serialVersionUID = 1L;
	
	ICategoryService categoryService = new CategoryServiceImpl();
	IProductService productService = new ProductServiceImpl();
	IStoreService storeService = new StoreServiceImpl();
	String cateId = null;
	String idstore = null;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		List<CategoryModel> listCategories = categoryService.getAll();
		req.setAttribute("listC", listCategories);
		
		List<ProductModel> listProducts = productService.getTop10Product();
		req.setAttribute("listProducts", listProducts);
		
		List<StoreModel> listStore = storeService.getListSeller();
		req.setAttribute("listStore", listStore);
		int Page = 4;
		req.setAttribute("Page", Page);
		req.setAttribute("Idstore", 0);
		req.getRequestDispatcher("/views/admin/listAllProductAndCategory.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		cateId = req.getParameter("id");
		int icateId = Integer.parseInt(cateId);
		idstore = req.getParameter("idstore");
		int iidstore = Integer.parseInt(idstore);
		if(icateId == 0 && iidstore!=0)
		{
			List<ProductModel> listPr = productService.getTop10ProductOfSeler(iidstore);
			req.setAttribute("listProducts", listPr);
			req.setAttribute("typeLoad", 0);
		}
		else if(icateId != 0 && iidstore==0){
		
			List<ProductModel> listP = productService.getTop10ProductByCategoryId(icateId);
			req.setAttribute("listProducts", listP);
			req.setAttribute("typeLoad", 1);
		}
		else {
			List<ProductModel> listP = productService.getTop10ProductOfSellerByCategoryId(icateId, iidstore);
			req.setAttribute("listProducts", listP);
			req.setAttribute("typeLoad", 2);
		}
	
		//hien lai gia tri trong select
		List<CategoryModel> listCategories = categoryService.getAll();
		req.setAttribute("listC", listCategories);
		req.setAttribute("Idstore", idstore);
		List<StoreModel> listStore = storeService.getListSeller();
		req.setAttribute("listStore", listStore);
		req.setAttribute("IcateId", icateId);
		req.getRequestDispatcher("/views/admin/listAllProductAndCategory.jsp").forward(req, resp);
	}

}
