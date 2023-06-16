package Admin;

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
import mypack.Impl.StoreServiceImpl;
import mypack.model.CategoryModel;
import mypack.model.ProductModel;
import mypack.model.StoreModel;
import mypack.services.ICategoryService;
import mypack.services.IProductService;
import mypack.services.IStoreService;

/**
 * Servlet implementation class LoadMoreProductOfAdmin
 */
@WebServlet("/admin/LoadMoreProductOfAdmin")
public class LoadMoreProductOfAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoadMoreProductOfAdmin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	ICategoryService categoryService = new CategoryServiceImpl();
	IProductService productService = new ProductServiceImpl();
	IStoreService storeService = new StoreServiceImpl();
	String cateId = null;
	String idstore = null;
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		int amount = Integer.parseInt(req.getParameter("exits"));
		List<CategoryModel> listCategories = categoryService.getAll();
		req.setAttribute("listC", listCategories);
		
		List<ProductModel> listProducts = productService.loadMore10Product(amount);
		req.setAttribute("listProducts", listProducts);
		
		List<StoreModel> listStore = storeService.getListSeller();
		req.setAttribute("listStore", listStore);
		int Page = 4;
		req.setAttribute("Page", Page);
		PrintWriter out = resp.getWriter();
		for(ProductModel p: listProducts) {
			out.println("<tr class=\"table-product-item\">\r\n"
					+ "									<th scope=\"row\"><!-- <input type=\"checkbox\" /> --></th>\r\n"
					+ "									<td class=\"product-name\"\r\n"
					+ "										style=\"font-size: 0.95rem; font-weight: 600;\"><a\r\n"
					+ "										href=\"/Project_WEB/admin/EditProduct?productid="+p.getProductId()+"&userId="+p.getSellerId()+"/>\">"+p.getProductName()+"</a></td>\r\n"
					+ "									<td>"+p.getProductPrice()+" VNĐ</td>\r\n"
					+ "									<td><a\r\n"
					+ "										href=\"/Project_WEB/admin/DeleteProduct?productid="+p.getProductId()+"&userId="+p.getSellerId()+"/>\"\r\n"
					+ "										class=\"tm-product-delete-link\"> <i\r\n"
					+ "											class=\"far fa-trash-alt tm-product-delete-icon\"></i>\r\n"
					+ "									</a></td>\r\n"
					+ "								</tr>");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		cateId = req.getParameter("id");
		int icateId = Integer.parseInt(cateId);
		int amount = Integer.parseInt(req.getParameter("exits"));
		if(icateId == 0)
		{
			idstore = req.getParameter("idstore");
			int iidstore = Integer.parseInt(idstore);
			List<ProductModel> listPr = productService.loadMore10ProductOfSellerByCategory(icateId, iidstore,amount);
			req.setAttribute("listProducts", listPr);
			req.setAttribute("Idstore", iidstore);
			PrintWriter out = resp.getWriter();
			for(ProductModel p: listPr) {
				out.println("<tr class=\"table-product-item\">\r\n"
						+ "									<th scope=\"row\"><!-- <input type=\"checkbox\" /> --></th>\r\n"
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
		else {
		
			List<ProductModel> listP = productService.loadMore10ProductByCategoryId(icateId, amount);
			req.setAttribute("listProducts", listP);
			PrintWriter out = resp.getWriter();
			for(ProductModel p: listP) {
				out.println("<tr class=\"table-product-item\">\r\n"
						+ "									<th scope=\"row\"><!-- <input type=\"checkbox\" /> --></th>\r\n"
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
	
		//hien lai gia tri trong select
		List<CategoryModel> listCategories = categoryService.getAll();
		req.setAttribute("listC", listCategories);
		
		List<StoreModel> listStore = storeService.getListSeller();
		
		
	}

}
