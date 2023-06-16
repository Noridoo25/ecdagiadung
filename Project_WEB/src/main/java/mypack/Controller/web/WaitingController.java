package mypack.Controller.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mypack.model.UserAccountModel;

@WebServlet(urlPatterns = { "/waiting" })
public class WaitingController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		HttpSession session = req.getSession();
		if (session != null && session.getAttribute("account") != null) {
			UserAccountModel u = (UserAccountModel) session.getAttribute("account");
			req.setAttribute("username", u.getUserName());
			if (u.getRoleId() == 1 || u.getRoleId() == 2 || u.getRoleId() == 3) {
				resp.sendRedirect(req.getContextPath() + "/HomeControllerWeb");
			} else {
				resp.sendRedirect(req.getContextPath() + "/ControllerLogin");
			}
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		super.doPost(req, resp);
	}

}