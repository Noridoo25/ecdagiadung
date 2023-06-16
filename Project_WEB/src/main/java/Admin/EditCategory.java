package Admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mypack.Impl.CategoryServiceImpl;
import mypack.model.CategoryModel;
import mypack.services.ICategoryService;


@WebServlet("/admin/EditCategory")
public class EditCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    String id = null;
    ICategoryService cates = new CategoryServiceImpl();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		id = request.getParameter("id");
		CategoryModel cate =  cates.getCategoryById(Integer.parseInt(id));
		request.setAttribute("cates",cate);
		request.getRequestDispatcher("/views/admin/editCategory.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String cateName = request.getParameter("categoryName");
		cates.edit(Integer.parseInt(id), cateName);
		response.sendRedirect(request.getContextPath()+ "/admin/ListAllProductAndCategory");
	}

}
