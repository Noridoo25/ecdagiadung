package Admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mypack.Impl.ProductServiceImpl;
import mypack.model.ProductModel;
import mypack.services.IProductService;


@WebServlet("/admin/SearchProducts")
public class SearchProducts extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    IProductService productService = new ProductServiceImpl();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String key = request.getParameter("key");
		String userId = request.getParameter("userId");

		
		List<ProductModel> productByPId = productService.searchProduct(key);
		PrintWriter out = response.getWriter();
		if(userId == null)
		{
			for(ProductModel p:productByPId) {
				out.println("<tr>\r\n"
						+ "									<th scope=\"row\"><input type=\"checkbox\" /></th>\r\n"
						+ "									<td class=\"product-name\"\r\n"
						+ "										style=\"font-size: 0.95rem; font-weight: 600;\"><a\r\n"
						+ "										href=\"<c:url value='/admin/ProductDetail?productid="+p.getProductId()+"'/>\">"+p.getProductName()+"</a></td>\r\n"
						+ "									<td>"+p.getProductPrice()+" VNĐ</td>\r\n"
						+ "								</tr>");
			}
		}else
		{
			List<ProductModel> product = productService.searchProductOfSeller(Integer.parseInt(userId), key);
			for(ProductModel p:product) {
				out.println("<tr>\r\n"
						+ "									<th scope=\"row\"><input type=\"checkbox\" /></th>\r\n"
						+ "									<td class=\"product-name\"\r\n"
						+ "										style=\"font-size: 0.95rem; font-weight: 600;\"><a\r\n"
						+ "										href=\"/Project_WEB/admin/EditProduct?productid="+p.getProductId()+"&userId="+p.getSellerId()+"\">"+p.getProductName()+"</a></td>\r\n"
						+ "									<td>"+p.getProductPrice()+"</td>\r\n"
						+ "									<!-- <td>550</td>\r\n"
						+ "									<td>28 March 2019</td> -->\r\n"
						+ "									<td><a\r\n"
						+ "										href=\"/Project_WEB/admin/DeleteProduct?productid="+p.getProductId()+"&userId="+p.getSellerId()+"\"\r\n"
						+ "										class=\"tm-product-delete-link\"> <i\r\n"
						+ "											class=\"far fa-trash-alt tm-product-delete-icon\"></i>\r\n"
						+ "									</a></td>\r\n"
						+ "								</tr>");
			}
		}
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}
