package Admin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mypack.Impl.StoreServiceImpl;
import mypack.Impl.UserServiceImpl;
import mypack.model.StoreModel;
import mypack.model.UserAccountModel;
import mypack.services.IStoreService;
import mypack.services.IUserService;


@WebServlet("/admin/ListAccount")
public class ListAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    IUserService listUser = new UserServiceImpl();
    IStoreService storeSeller = new StoreServiceImpl();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		List<UserAccountModel> users = listUser.getAllUser();
		List<UserAccountModel> userStore = new ArrayList<>(); // lay ra user va store
		for(UserAccountModel u:users) {
			StoreModel store = storeSeller.getStoreOfSeller(u.getUserId());
			u.setStore(store);
			userStore.add(u);
		}
		int Page = 3;
		request.setAttribute("Page", Page);
		request.setAttribute("user", userStore);
		request.getRequestDispatcher("/views/admin/listAccounts.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		try {
			String status = request.getParameter("status");
			List<UserAccountModel> users = new ArrayList<>();
			if(Integer.parseInt(status)==1) { //user no store
				users = listUser.listUserNoStore();
			}
			else {
				users = listUser.listUserHasStore();
			}
			List<UserAccountModel> userStore = new ArrayList<>(); // lay ra user va store
			for(UserAccountModel u:users) {
				StoreModel store = storeSeller.getStoreOfSeller(u.getUserId());
				u.setStore(store);
				userStore.add(u);
			}
			request.setAttribute("user", userStore);
			request.getRequestDispatcher("/views/admin/listAccounts.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
