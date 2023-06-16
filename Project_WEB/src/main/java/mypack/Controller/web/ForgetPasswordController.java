package mypack.Controller.web;

import java.io.IOException;
import java.util.Properties;
import java.util.Random;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mypack.Impl.UserServiceImpl;
import mypack.model.UserAccountModel;
import mypack.services.IUserService;

@WebServlet("/ForgetPasswordController")
public class ForgetPasswordController extends HttpServlet{
	

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		req.getRequestDispatcher("/views/webs/forget_password.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		HttpSession session = req.getSession();
		IUserService userService = new UserServiceImpl();
		String email = req.getParameter("email");
		UserAccountModel user = userService.findUserByEmail(email);	
		int otp = 0;
		
			
		if (email.equals("")) {
			req.setAttribute("alertReset", "Please enter your email!");
			req.getRequestDispatcher("/views/webs/forget_password.jsp").forward(req, resp);
		}
		else if(user == null) {
			req.setAttribute("alertReset", "User with email does not exist!");
			req.getRequestDispatcher("/views/webs/forget_password.jsp").forward(req, resp);
		}
		else if(user != null){
			
			Random random = new Random();
			otp = random.nextInt(123456);
			
			String to = email;
			//Get the session object
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
				
				message.setFrom(new InternetAddress(email));	
				message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
				message.setSubject("THANHHUONGSHOP<Reset Password> ");
				message.setText("Your OTP is: " + otp + "\n" + 
						         "Please enter the valid OTP to reset.");
				
				Transport.send(message);
			
			} catch (MessagingException e) {
				throw new RuntimeException(e);
			}
			
			session.setAttribute("otp", otp);
			session.setAttribute("email", email);
			
			req.getRequestDispatcher("/views/webs/enter_OTP.jsp").forward(req, resp);
		
		}	
	
	}

}
