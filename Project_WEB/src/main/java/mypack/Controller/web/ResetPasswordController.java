package mypack.Controller.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mypack.Impl.UserServiceImpl;
import mypack.model.UserAccountModel;
import mypack.services.IUserService;

@WebServlet("/ResetPasswordController")
public class ResetPasswordController extends HttpServlet{

	
	private static final long serialVersionUID = 1L;

	IUserService userService = new UserServiceImpl();
	String email = null;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		HttpSession session = req.getSession();
		
		email = (String) session.getAttribute("email");
		req.getRequestDispatcher("/views/webs/enter_OTP.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		String password = req.getParameter("password");
		String repassword = req.getParameter("repassword");
		
		if(!password.equals(repassword))
		{
			req.setAttribute("alertMess", "Password does not match!");
			req.getRequestDispatcher("/views/webs/reset_password.jsp").forward(req, resp);
		}
		else {
			boolean isSuccess = userService.editByEmail(password, email);
			if(isSuccess)
			{
				req.setAttribute("alertSucc", "Successfully! Back To Login");
				req.getRequestDispatcher("/views/webs/reset_password.jsp").forward(req, resp);
			}
			else {
				req.setAttribute("alertMess", "System error");
				req.getRequestDispatcher("/views/webs/reset_password.jsp").forward(req, resp);
			}
		}	
	}
}
