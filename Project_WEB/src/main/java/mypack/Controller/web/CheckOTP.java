package mypack.Controller.web;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/CheckOTP")
public class CheckOTP extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		int otp = (int)session.getAttribute("otp");
		
		int value = Integer.parseInt(req.getParameter("otp"));
	
		
		if(value == otp)
		{
			req.getRequestDispatcher("/views/webs/reset_password.jsp").forward(req, resp);
			
		}
		else {
			req.setAttribute("status", "Wrong OTP");
			req.getRequestDispatcher("/views/webs/enter_OTP.jsp").forward(req, resp);
		}
	}
}
