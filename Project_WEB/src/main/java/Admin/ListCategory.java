package Admin;

import java.io.IOException;
import java.util.List;

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


@WebServlet("/ListCategory")
public class ListCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 

    ICategoryService cates = new CategoryServiceImpl();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		List<CategoryModel> cate = cates.getAll();
		request.setAttribute("cates", cate);
		request.getRequestDispatcher("/views/admin/listCategory.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		doGet(request, response);
	}

}
