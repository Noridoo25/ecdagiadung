package mypack.Controller.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mypack.DAO.IEmployeeDao;
import mypack.DAO.ISlideImageDAO;
import mypack.Impl.EmployeeDAOImpl;
import mypack.Impl.SlideImageDAOImpl;
import mypack.model.EmPloyeeModel;
import mypack.model.SlideImageModel;

@WebServlet("/AboutControllerWeb")

public class AboutController extends HttpServlet{


	private static final long serialVersionUID = 1L;
	IEmployeeDao employee = new EmployeeDAOImpl();
	ISlideImageDAO slides = new SlideImageDAOImpl();
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		List<EmPloyeeModel> AllEmployee = employee.getEmployeeAll();
		List<SlideImageModel> slideImage = slides.getSlideImage(1);
		request.setAttribute("slideImage", slideImage);
		request.setAttribute("AllEmployee", AllEmployee);
		request.getRequestDispatcher("/views/webs/about.jsp").forward(request, response);
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		doGet(request, response);
	}

}
