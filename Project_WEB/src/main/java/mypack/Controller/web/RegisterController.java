package mypack.Controller.web;

import java.io.IOException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mypack.Impl.UserServiceImpl;
import mypack.services.IUserService;

@WebServlet(urlPatterns = {"/ControllerRegister"})

public class RegisterController extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// doGet: ktra session
//		HttpSession session = req.getSession(false); // false: no current session and return new session (true: have
//														// session)
//		if (session != null && session.getAttribute("username") != null) {
//			resp.sendRedirect(req.getContextPath() + "/admin");
//			return;
//		}
//
//		// Check cookie
//		Cookie[] cookies = req.getCookies();
//		if (cookies != null) {
//			for (Cookie cookie : cookies) {
//				if (cookie.getName().equals("username")) {
//					session = req.getSession(true);
//					session.setAttribute("username", cookie.getValue());
//					resp.sendRedirect(req.getContextPath() + "/admin");
//					return;
//				}
//			}
//		}
//		req.getRequestDispatcher("/views/admin/register.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		IUserService service = new UserServiceImpl();
		String usernamerg = req.getParameter("usernamerg"); // tên trên view
		String emailrg = req.getParameter("emailrg");
		String passwordrg = req.getParameter("passwordrg");
		String repass = req.getParameter("repasswordrg");

		String alert = "";
		if (service.checkExistEmail(emailrg)) {

			alert = "Email existed!";
			req.setAttribute("alertrg", alert);
			req.getRequestDispatcher("/views/webs/login_register.jsp").forward(req, resp);
			return;
		}
		if (service.checkExistUsername(usernamerg)) {

			alert = "Username existed!";
			req.setAttribute("alertrg", alert);
			req.getRequestDispatcher("/views/webs/login_register.jsp").forward(req, resp);
			return;
		}
		if (passwordrg.equals(repass) == false) {
			alert = "Password does not match!";
			req.setAttribute("alertrg", alert);
			req.getRequestDispatcher("/views/webs/login_register.jsp").forward(req, resp);
			return;
		}

		boolean isSuccess = service.register(usernamerg, emailrg, passwordrg);
		if (isSuccess) {
			alert = "Register successfully!";
			req.setAttribute("alertrg", alert);
			req.getRequestDispatcher("/views/webs/login_register.jsp").forward(req, resp);
			
			//send mail
			
			Properties properties = new Properties();
			
			properties.put("mail.smtp.host","smtp.gmail.com");
			properties.put("mail.smtp.socketFactory.port", "587");  //465
			properties.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			properties.put("mail.smtp.auth", "true");
			properties.put("mail.smtp.port", "587");
			properties.put("mail.smtp.starttls.enable", "true");
			
			Session sessionauth = Session.getDefaultInstance(properties, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication("nkocbabi@gmail.com", "grbdfdwvcpprghyx"); //xác thực mail gửi đi
				}
			});
					
			try {
				
				MimeMessage message = new MimeMessage(sessionauth);
				
				message.setFrom(new InternetAddress(emailrg ));	
				message.addRecipient(Message.RecipientType.TO, new InternetAddress(emailrg ));
				message.setSubject("THANHHUONGSHOP<Registed Successfully> ");
				message.setText("Thank you for registering."+ "\n" + 
								"Welcome to shopping. " + "\n" +
						         "Your username:" + usernamerg);
				
				Transport.send(message);
				
			
			} catch (MessagingException e) {
				throw new RuntimeException(e);
			}
		} else {

			alert = "System error!";
			req.setAttribute("alertrg", alert);
			req.getRequestDispatcher("/views/webs/login_register.jsp").forward(req, resp);
		}
	}

}