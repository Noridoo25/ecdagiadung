package mypack.Controller.web;



import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mypack.Impl.StoreServiceImpl;
import mypack.Impl.UserServiceImpl;
import mypack.model.StoreModel;
import mypack.model.UserAccountModel;
import mypack.services.IStoreService;
import mypack.services.IUserService;

@WebServlet(urlPatterns = {"/ControllerMyAccount/edit"})
public class UpdateAccountController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	IUserService userService = new UserServiceImpl();
	IStoreService stores = new StoreServiceImpl();
	String userid = null;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		userid = req.getParameter("userId");
		
		HttpSession session = req.getSession();
		if (session != null && session.getAttribute("account") != null) {
			UserAccountModel u = (UserAccountModel) session.getAttribute("account");
			UserAccountModel user = userService.get(u.getUserName());
			req.setAttribute("useracc", user);
		}
			req.getRequestDispatcher("/views/webs/edit-account.jsp").forward(req, resp);
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		int iuserId = Integer.parseInt(userid);
		String alertMsg = "";
		String newpass = req.getParameter("newpassword");;
		String repass="";
		HttpSession session = req.getSession();
		if (session != null && session.getAttribute("account") != null) {
			UserAccountModel u = (UserAccountModel) session.getAttribute("account");
			
			String username = req.getParameter("username");
			if(username.equals(u.getUserName())) {
				username = u.getUserName();
			}
			String fname = req.getParameter("firstname");
			if(fname.equals(u.getFirstName())) {
				fname = u.getFirstName();
			}
			String lname = req.getParameter("lastname");
			if(lname.equals(u.getLastName())) {
				lname = u.getLastName();
			}
			String email = req.getParameter("email");
			if(email.equals(u.getEmail())) {
				email = u.getEmail();
			}
			String phone = req.getParameter("phone");
			if(phone.equals(u.getPhone())) {
				phone = u.getPhone();
			}
			String addr = req.getParameter("address");
			if(addr.equals(u.getAddr())) {
				addr = u.getAddr();
			}
			
			
			repass = req.getParameter("repass");
			StoreModel store = stores.getStoreOfSeller(Integer.parseInt(userid));
		
			
			if(userService.checkExistEmailEdit(iuserId, email)) {
				
				alertMsg = "Email existed!";
				req.setAttribute("alert", alertMsg);
			}
			else if(userService.checkExistUsernameEdit(iuserId, username))
			{
				alertMsg = "Username existed!";
				req.setAttribute("alert", alertMsg);	
			}
			else if (userService.checkExistPhoneEdit(iuserId, phone)) {

				alertMsg = "Phone existed!";
				req.setAttribute("alert", alertMsg);	
			}
			else if(newpass != null) {
				if(!newpass.equals(repass)) {
					alertMsg = "Password does not match!";
				}
			}
			if (newpass == "")
			{
				newpass = u.getPass();
			}
			
			boolean isSuccess = userService.edit(new UserAccountModel(username, email, newpass, fname, lname, phone, addr, Integer.parseInt(userid),store));

			try {
				if (isSuccess) {
					
					UserAccountModel user = userService.get(u.getUserName());
					req.setAttribute("useracc", user);
					alertMsg = "Update Seccessfully!";
					req.setAttribute("alert", alertMsg);
					
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		

		req.getRequestDispatcher("/ControllerMyAccount/edit?userId="+iuserId );
		req.getRequestDispatcher("/views/webs/edit-account.jsp").forward(req, resp);
	}

}