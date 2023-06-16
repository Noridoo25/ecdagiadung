package mypack.Impl;

import java.util.List;

import mypack.DAO.IUserDAO;
import mypack.model.UserAccountModel;
import mypack.services.IUserService;



public class UserServiceImpl implements IUserService{

	IUserDAO userDAO = new UserDAOImpl();
	@Override
	public UserAccountModel get(int id) {
		return userDAO.get(id);
	}

	@Override
	public UserAccountModel get(String username) {
		return userDAO.get(username);
	}
	
	@Override
	public UserAccountModel login(String username, String pw) {
		UserAccountModel user = this.get(username);
		if(user != null && pw.equals(user.getPass())) {
			return user;
		}
		return user;
	}

	@Override
	public boolean register(String username, String email, String password) {
		
		if (userDAO.checkExistUsername(username)) {
			return false;
		}

		userDAO.insert(new UserAccountModel(username, email, password));
		return true;
	}

	@Override
	public boolean checkExistEmail(String email) {
		return userDAO.checkExistEmail(email);
	}

	@Override
	public boolean checkExistUsername(String username) {
		return userDAO.checkExistUsername(username);
	}

	@Override
	public void insert(UserAccountModel user) {
		userDAO.insert(user);
		
	}

	@Override
	public boolean edit(UserAccountModel user) {
		return userDAO.edit(user);
		
	}

	@Override
	public boolean checkExistPhone(String phone) {
		return userDAO.checkExistPhone(phone);
	}



	@Override
	public UserAccountModel findUserByEmail(String email) {
		return userDAO.findUserByEmail(email);
	}

	@Override
	public boolean editByEmail(String password, String email) {
		return userDAO.editByEmail(password, email);
	}

	@Override
	public List<UserAccountModel> getAllUser() {
		
		return userDAO.getAllUser();
	}

	@Override
	public void deleteUser(int userId) {
		
		userDAO.deleteUser(userId);
	}

	@Override
	public List<UserAccountModel> listUserNoStore() {
		
		return userDAO.listUserNoStore();
	}

	@Override
	public List<UserAccountModel> listUserHasStore() {
		
		return userDAO.listUserHasStore();
	}

	@Override
	public List<UserAccountModel> listUserForKey(String key) {

		return userDAO.listUserForKey(key);
	}

	@Override
	public boolean checkExistEmailEdit(int userId, String email) {

		return userDAO.checkExistEmailEdit(userId, email);
	}

	@Override
	public boolean checkExistUsernameEdit(int userId, String username) {
		return userDAO.checkExistUsernameEdit(userId, username);
	}

	@Override
	public boolean checkExistPhoneEdit(int userId, String phone) {
		
		return userDAO.checkExistPhoneEdit(userId, phone);
	}

	@Override
	public void updateRole( int userId) {
		
		userDAO.updateRole(userId);
	}
}