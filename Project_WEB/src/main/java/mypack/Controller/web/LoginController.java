package mypack.Controller.web;

import java.io.IOException;

import mypack.Impl.UserServiceImpl;
import mypack.model.UserAccountModel;
import mypack.services.IUserService;
import mypack.util.Constant;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/ControllerLogin")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public LoginController() {
		super();
	}

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// check session
		HttpSession session = req.getSession(false);
		if (session != null && session.getAttribute("account") != null) {
			resp.sendRedirect(req.getContextPath() + "/waiting");
			return;
		}

		// Check cookie: import cookie từ http
		Cookie[] cookies = req.getCookies();
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("username")) {
					session = req.getSession(true);
					session.setAttribute("username", cookie.getValue());
					resp.sendRedirect(req.getContextPath() + "/waiting");
					return;
				}
			}
		}
		req.getRequestDispatcher("/views/webs/login_register.jsp").forward(req, resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		resp.setContentType("text/html");
		resp.setCharacterEncoding("UTF-8");
		req.setCharacterEncoding("UTF-8");

		String username = req.getParameter("username");
		String password = req.getParameter("password");

//		boolean isRememberMe = false;
//
//		String remember = req.getParameter("remember");
//
//		
//		if ("on".equals(remember)) { isRememberMe = true; }
		 
		String alertMsg = "";

		if (username.isEmpty() || password.isEmpty()) {
			alertMsg = "Username or password does not empty!";
			req.setAttribute("alert", alertMsg);
			req.getRequestDispatcher("/views/webs/login_register.jsp").forward(req, resp);
			return;
		}
		IUserService service = new UserServiceImpl();
		UserAccountModel user = service.login(username, password);

		if (user != null) {
			HttpSession session = req.getSession(true);
			session.setAttribute("account", user);
//			if (isRememberMe) {
//				saveRemeberMe(resp, username);
//			}
			resp.sendRedirect(req.getContextPath() + "/waiting"); 
		} else {
			alertMsg = "Username or password is not correct!";
			req.setAttribute("alert", alertMsg);
			req.getRequestDispatcher("/views/webs/login_register.jsp").forward(req, resp); 
		}
	}
	private void saveRemeberMe(HttpServletResponse response, String username) {
		Cookie cookie = new Cookie(Constant.COOKIE_REMEMBER, username);
//		cookie.setMaxAge(1000);
		response.addCookie(cookie);
	}

}