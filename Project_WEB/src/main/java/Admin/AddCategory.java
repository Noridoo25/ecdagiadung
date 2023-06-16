package Admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mypack.DAO.ICategoryDAO;
import mypack.Impl.CategoryDAOImpl;
import mypack.Impl.CategoryServiceImpl;
import mypack.model.CategoryModel;
import mypack.services.ICategoryService;


@WebServlet("/admin/AddCategory")
public class AddCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
    ICategoryService category = new CategoryServiceImpl();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		request.getRequestDispatcher("/views/admin/addCategory.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String cateName = request.getParameter("categoryName");
		category.insert(cateName);
		response.sendRedirect(request.getContextPath() + "/admin/ListAllProductAndCategory");
	}

}
