package Admin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mypack.Impl.CategoryServiceImpl;
import mypack.Impl.ProductServiceImpl;
import mypack.Impl.UserServiceImpl;
import mypack.model.CategoryModel;
import mypack.model.ProductModel;
import mypack.model.UserAccountModel;
import mypack.services.ICategoryService;
import mypack.services.IProductService;
import mypack.services.IUserService;


@WebServlet("/admin/ListProductAndCategory")
public class ListProductAndCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    ICategoryService cates = new CategoryServiceImpl();
    IProductService products = new ProductServiceImpl();
    IUserService userAccount = new UserServiceImpl();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String userId = request.getParameter("userId");
		List<CategoryModel> cate = cates.getAll();
		request.setAttribute("cates", cate);
		List<ProductModel> allProduct = products.getTop10ProductOfSeller(Integer.parseInt(userId));
		request.setAttribute("allProduct", allProduct);
		
		UserAccountModel user = new UserAccountModel();
		if(userId != null) {
			user = userAccount.get(Integer.parseInt(userId));
		}
		int Page = 4;
		request.setAttribute("apply", false);
		request.setAttribute("Page", Page);
		request.setAttribute("user", user);
		request.getRequestDispatcher("/views/admin/listProduct.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String cateId = request.getParameter("id");
		String userId = request.getParameter("userId");
		List<ProductModel> allProductOfCate = new ArrayList<>();
		if(Integer.parseInt(cateId)!=0) {
			request.setAttribute("apply", true);
			request.setAttribute("cateId", cateId);
			allProductOfCate = products.getAllProductOfSellerByCategory(Integer.parseInt(cateId),Integer.parseInt(userId) );
		}
		else {
			request.setAttribute("apply", false);
			allProductOfCate = products.getTop10ProductOfSeller(Integer.parseInt(userId));
		}
		UserAccountModel user = new UserAccountModel();
		if(userId != null) {
			
			user = userAccount.get(Integer.parseInt(userId));
		}
		List<CategoryModel> cate = cates.getAll();
		int Page = 4;
		
		request.setAttribute("Page", Page);
		request.setAttribute("cates", cate);
		request.setAttribute("user", user);
		request.setAttribute("allProduct", allProductOfCate);
		request.getRequestDispatcher("/views/admin/listProduct.jsp").forward(request, response);
	}

}
