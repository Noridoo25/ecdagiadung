package mypack.Controller.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ContactControllerWeb")

public class ContactController extends HttpServlet{


	private static final long serialVersionUID = 1L;

	String alert="";
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		request.getRequestDispatcher("/views/webs/contact.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		alert = "Sending Successfully!";
		request.setAttribute("alert", alert);
		request.getRequestDispatcher("/views/webs/contact.jsp").forward(request, response);
	
	}

}
