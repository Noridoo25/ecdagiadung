package mypack.services;

import java.util.List;

import mypack.model.UserAccountModel;

public interface IUserService {
	
	void insert(UserAccountModel user);
	
	void updateRole(int userId);
	
	boolean edit(UserAccountModel user);
	
	UserAccountModel get(int id);
	
	UserAccountModel get(String username);
	
	UserAccountModel login(String username, String pw);
	
	boolean register(String username, String email, String password);
	
	boolean checkExistEmail(String email);
	
	boolean checkExistUsername(String username);
	
	boolean checkExistPhone(String phone);
	
	boolean checkExistEmailEdit(int userId, String email);
	
	boolean checkExistUsernameEdit(int userId,String username);
	
	boolean checkExistPhoneEdit(int userId,String phone);
	
	UserAccountModel findUserByEmail(String email);
	
	boolean editByEmail(String password, String email);
	List<UserAccountModel> getAllUser();
	void deleteUser(int userId);
	
	List<UserAccountModel> listUserNoStore();
	List<UserAccountModel> listUserHasStore();
	
	List<UserAccountModel> listUserForKey(String key);
}