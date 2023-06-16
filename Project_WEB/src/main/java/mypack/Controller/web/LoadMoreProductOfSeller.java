package mypack.Controller.web;

import java.io.IOException;
import java.io.PrintWriter;
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
import mypack.model.StoreModel;
import mypack.model.UserAccountModel;
import mypack.services.ICategoryService;
import mypack.services.IProductService;
import mypack.services.IUserService;

/**
 * Servlet implementation class LoadMoreProductOfSeller
 */
@WebServlet("/admin/LoadMoreProductOfSeller")
public class LoadMoreProductOfSeller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoadMoreProductOfSeller() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	ICategoryService cates = new CategoryServiceImpl();
	IProductService products = new ProductServiceImpl();
	IUserService userAccount = new UserServiceImpl();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		String userId = request.getParameter("userId");
		String cateId = request.getParameter("cateId");
		String amount = request.getParameter("exits");
		List<CategoryModel> cate = cates.getAll();
		request.setAttribute("cates", cate);
		List<ProductModel> allProduct = products.loadMore10ProductOfSellerByCategory(Integer.parseInt(cateId),Integer.parseInt(userId), Integer.parseInt(amount));
		request.setAttribute("allProduct", allProduct);

		UserAccountModel user = new UserAccountModel();
		if(userId != null) {
			user = userAccount.get(Integer.parseInt(userId));
		}
		int Page = 4;
		request.setAttribute("Page", Page);
		request.setAttribute("user", user);
		PrintWriter out = response.getWriter();
		for(ProductModel p: allProduct) {
			out.println("<tr class=\"table-product-item\">\r\n"
					+"<th scope=\"row\"><!-- <input type=\"checkbox\" /> --></th>"
					+ "									<td class=\"product-name\"\r\n"
					+ "										style=\"font-size: 0.95rem; font-weight: 600;\"><a\r\n"
					+ "										href=\"/Project_WEB/admin/EditProduct?productid="+p.getProductId()+"&userId="+p.getSellerId()+"\">"+p.getProductName()+"</a></td>\r\n"
					+ "									<td>"+p.getProductPrice()+" VNĐ</td>\r\n"
					+ "									<td><a\r\n"
					+ "										href=\"/Project_WEB/admin/DeleteProduct?productid="+p.getProductId()+"&userId="+p.getSellerId()+"\"\r\n"
					+ "										class=\"tm-product-delete-link\"> <i\r\n"
					+ "											class=\"far fa-trash-alt tm-product-delete-icon\"></i>\r\n"
					+ "									</a></td>\r\n"
					+ "								</tr>");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		String userId = request.getParameter("userId");
		String amount = request.getParameter("exits");
		List<CategoryModel> cate = cates.getAll();
		request.setAttribute("cates", cate);
		List<ProductModel> allProduct = products.loadMore10ProductOfSeler(Integer.parseInt(userId), Integer.parseInt(amount));
		request.setAttribute("allProduct", allProduct);

		UserAccountModel user = new UserAccountModel();
		if(userId != null) {
			user = userAccount.get(Integer.parseInt(userId));
		}
		int Page = 4;
		request.setAttribute("Page", Page);
		request.setAttribute("user", user);
		PrintWriter out = response.getWriter();
		for(ProductModel p: allProduct) {
			out.println("<tr class=\"table-product-item\">\r\n"
					+"<th scope=\"row\"><!-- <input type=\"checkbox\" /> --></th>"
					+ "									<td class=\"product-name\"\r\n"
					+ "										style=\"font-size: 0.95rem; font-weight: 600;\"><a\r\n"
					+ "										href=\"/Project_WEB/admin/EditProduct?productid="+p.getProductId()+"&userId="+p.getSellerId()+"\">"+p.getProductName()+"</a></td>\r\n"
					+ "									<td>"+p.getProductPrice()+" VNĐ</td>\r\n"
					+ "									<td><a\r\n"
					+ "										href=\"/Project_WEB/admin/DeleteProduct?productid="+p.getProductId()+"&userId="+p.getSellerId()+"\"\r\n"
					+ "										class=\"tm-product-delete-link\"> <i\r\n"
					+ "											class=\"far fa-trash-alt tm-product-delete-icon\"></i>\r\n"
					+ "									</a></td>\r\n"
					+ "								</tr>");
		}
	}


}
