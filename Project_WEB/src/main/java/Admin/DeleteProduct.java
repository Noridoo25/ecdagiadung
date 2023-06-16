package Admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mypack.Impl.CategoryServiceImpl;
import mypack.Impl.CommentServiceImpl;
import mypack.Impl.ProductImageServiceImpl;
import mypack.Impl.ProductServiceImpl;
import mypack.Impl.UserServiceImpl;
import mypack.model.UserAccountModel;
import mypack.services.ICategoryService;
import mypack.services.ICommentService;
import mypack.services.IProductImageService;
import mypack.services.IProductService;
import mypack.services.IUserService;


@WebServlet("/admin/DeleteProduct")
public class DeleteProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	IProductService products = new ProductServiceImpl();
	IProductImageService productImages = new ProductImageServiceImpl();
	ICommentService comments = new CommentServiceImpl();
	IUserService userAccount = new UserServiceImpl();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		try {
			String id = request.getParameter("productid");
			String userId = request.getParameter("userId");
			HttpSession session = request.getSession();
			UserAccountModel user = (UserAccountModel) session.getAttribute("account");
			comments.deleteComment(Integer.parseInt(userId), Integer.parseInt(id));
			productImages.delete(Integer.parseInt(id));
			products.delete(Integer.parseInt(id));
			if(user.getRoleId()==1) {
				response.sendRedirect(request.getContextPath()+"/admin/ListAllProductAndCategory?userId="+user.getUserId());
			}
			else {
				response.sendRedirect(request.getContextPath()+"/admin/ListProductAndCategory?userId="+userId);
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.print(e);
		}
		}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
