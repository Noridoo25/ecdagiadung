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


@WebServlet("/admin/SearchUserAndStore")
public class SearchUserAndStore extends HttpServlet {
	private static final long serialVersionUID = 1L;


	IUserService listUser = new UserServiceImpl();
	IStoreService storeSeller = new StoreServiceImpl();

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String key = request.getParameter("key");
		String type = request.getParameter("type");
		List<UserAccountModel> userStore = new ArrayList<>();
		List<UserAccountModel> users = new ArrayList<>();
		if(type.equals("User")) {
			users = listUser.listUserForKey(key);
			for(UserAccountModel u:users) {

				StoreModel store = storeSeller.getStoreOfSeller(u.getUserId());
				u.setStore(store);
				userStore.add(u);


			}
		}
		else if(type.equals("Store"))
		{		
			users = listUser.getAllUser();
			for(UserAccountModel u:users) {

				StoreModel store = storeSeller.listStoreForKey(key,u.getUserId());
				if(store != null) {
					if(u.getUserId() == store.getUserId()) {
						u.setStore(store);
						userStore.add(u);
					}
				}
			}
		}
		// lay ra user va store

		request.setAttribute("user", userStore);
		request.getRequestDispatcher("/views/admin/listAccounts.jsp").forward(request, response);

	}

}
