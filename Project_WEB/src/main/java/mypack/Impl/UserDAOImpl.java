package mypack.Impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import ConnectionDB.DBConnection;
import mypack.DAO.IUserDAO;
import mypack.model.UserAccountModel;

public class UserDAOImpl extends DBConnection implements IUserDAO{

	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	@Override
	public UserAccountModel get(int id) {

		String sql = "SELECT * FROM UserAccount WHERE userId=?";

		try {
			conn = super.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			rs = ps.executeQuery();

			while(rs.next()) {
				UserAccountModel user = new UserAccountModel();
				user.setUserId(rs.getInt("userId"));
				user.setUserName(rs.getString("userName"));
				user.setFirstName(rs.getString("firstName"));
				user.setLastName(rs.getString("lastName"));
				user.setEmail(rs.getString("email"));
				user.setPass(rs.getString("pass"));
				user.setRoleId(rs.getInt("roleId"));

				return user;
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public UserAccountModel get(String username) {

		String sql = "SELECT * FROM UserAccount WHERE userName=?";

		try {
			conn = super.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, username);
			rs = ps.executeQuery();

			while(rs.next()) {
				UserAccountModel user = new UserAccountModel();
				user.setUserId(rs.getInt("userId"));
				user.setUserName(rs.getString("userName"));
				user.setEmail(rs.getString("email"));
				user.setPass(rs.getString("pass"));
				user.setFirstName(rs.getString("firstName"));
				user.setLastName(rs.getString("lastName"));
				user.setAddr(rs.getString("addr"));
				user.setPhone(rs.getString("phone"));
				user.setRoleId(rs.getInt("roleId"));

				return user;
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return null;	
	}

	@Override
	public boolean checkExistEmail(String email) {

		boolean check = false;
		String sql = "SELECT * FROM UserAccount WHERE email = ?";

		try {
			conn = super.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			rs = ps.executeQuery();
			if(rs.next())
			{
				check=true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return check;
	}

	@Override
	public boolean checkExistUsername(String username) {

		boolean check = false;
		String sql = "SELECT * FROM UserAccount WHERE userName = ?";

		try {
			conn = super.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, username);
			rs = ps.executeQuery();
			if(rs.next())
			{
				check=true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return check;
	}

	@Override
	public boolean checkExistPhone(String phone) {
		boolean check = false;
		String sql = "SELECT * FROM UserAccount WHERE phone = ?";

		try {
			conn = super.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, phone);
			rs = ps.executeQuery();
			if(rs.next())
			{
				check=true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return check;
	}

	@Override
	public void insert(UserAccountModel user) {
		String sql = "INSERT INTO UserAccount(userName,email,pass,roleId) VALUES (?,?,?,3)";

		try {
			conn = super.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, user.getUserName());
			ps.setString(2, user.getEmail());
			ps.setString(3, user.getPass());

			ps.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}

	}

	@Override
	public boolean edit(UserAccountModel user) {

		String sql = "UPDATE UserAccount SET username =?, email=?, pass=?, firstName=?, lastName=?, addr=?, phone=?  WHERE userId=?";

		try {
			conn = super.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1,  user.getUserName());
			ps.setString(2, user.getEmail());
			ps.setString(3, user.getPass());
			ps.setString(4, user.getFirstName());
			ps.setString(5,  user.getLastName());
			ps.setString(6, user.getAddr());
			ps.setString(7, user.getPhone());
			ps.setInt(8, user.getUserId());
			

			ps.executeUpdate();
			return true;
		}catch(Exception e) {
			return false;
		}
	}


	@Override
	public UserAccountModel findUserByEmail(String email) {

		String sql = "SELECT * FROM UserAccount WHERE email=?";

		try {
			conn = super.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			rs = ps.executeQuery();

			while(rs.next()) {
				UserAccountModel user = new UserAccountModel();
				user.setUserId(rs.getInt("userId"));
				user.setUserName(rs.getString("userName"));
				user.setEmail(rs.getString("email"));
				user.setPass(rs.getString("pass"));
				user.setFirstName(rs.getString("firstName"));
				user.setLastName(rs.getString("lastName"));
				user.setAddr(rs.getString("addr"));
				user.setPhone(rs.getString("phone"));
				user.setRoleId(rs.getInt("roleId"));

				return user;
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return null;	
	}

	@Override
	public boolean editByEmail(String password, String email) {

		String sql = "UPDATE UserAccount SET pass=? WHERE email=?";

		try {
			conn = super.getConnection();
			ps = conn.prepareStatement(sql);

			ps.setString(1, password);
			ps.setString(2, email);

			ps.executeUpdate();
			return true;
		}catch(Exception e) {
			return false;
		}
	}

	@Override
	public List<UserAccountModel> getAllUser() {
		
		String sql = "SELECT * FROM UserAccount WHERE roleId <> 1";
		List<UserAccountModel> listUser = new ArrayList<>();
		try {
			conn = super.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();

			while(rs.next()) {
				UserAccountModel user = new UserAccountModel();
				user.setUserId(rs.getInt("userId"));
				user.setUserName(rs.getString("userName"));
				user.setFirstName(rs.getString("firstName"));
				user.setLastName(rs.getString("lastName"));
				user.setEmail(rs.getString("email"));
				user.setPass(rs.getString("pass"));
				user.setRoleId(rs.getInt("roleId"));
				listUser.add(user);
				
			}
			return listUser;
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public void deleteUser(int userId) {
		
		String sql = "delete from UserAccount where userId = ?";
		try {
			conn = super.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, userId);
			ps.executeUpdate();
		} catch (Exception e) {
			
			e.printStackTrace();
		}

	}

	@Override
	public List<UserAccountModel> listUserNoStore() {
		
		String sql ="select userId,userName,firstName,lastName\r\n"
				+ ",email,pass,roleId  from UserAccount\r\n"
				+ "EXCEPT\r\n"
				+ "select UserAccount.userId,UserAccount.userName,UserAccount.firstName,UserAccount.lastName\r\n"
				+ ",UserAccount.email,UserAccount.pass,UserAccount.roleId \r\n"
				+ "from Store join UserAccount on Store.userId = UserAccount.userId";
		List<UserAccountModel> listUser = new ArrayList<>();
		try {
			conn = super.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();

			while(rs.next()) {
				UserAccountModel user = new UserAccountModel();
				user.setUserId(rs.getInt("userId"));
				user.setUserName(rs.getString("userName"));
				user.setFirstName(rs.getString("firstName"));
				user.setLastName(rs.getString("lastName"));
				user.setEmail(rs.getString("email"));
				user.setPass(rs.getString("pass"));
				user.setRoleId(rs.getInt("roleId"));
				listUser.add(user);
				
			}
			return listUser;
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<UserAccountModel> listUserHasStore() {
		
		String sql ="select UserAccount.userId,UserAccount.userName,UserAccount.firstName,UserAccount.lastName\r\n"
				+ ",UserAccount.email,UserAccount.pass,UserAccount.roleId \r\n"
				+ "from Store join UserAccount on Store.userId = UserAccount.userId";
		List<UserAccountModel> listUser = new ArrayList<>();
		try {
			conn = super.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();

			while(rs.next()) {
				UserAccountModel user = new UserAccountModel();
				user.setUserId(rs.getInt("userId"));
				user.setUserName(rs.getString("userName"));
				user.setFirstName(rs.getString("firstName"));
				user.setLastName(rs.getString("lastName"));
				user.setEmail(rs.getString("email"));
				user.setPass(rs.getString("pass"));
				user.setRoleId(rs.getInt("roleId"));
				listUser.add(user);
				
			}
			return listUser;
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<UserAccountModel> listUserForKey(String key) {
		
		String sql = "select * from UserAccount where userName like ?";
		
		List<UserAccountModel> listUser = new ArrayList<>();
		try {
			conn = super.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, "%" +key+"%");
			rs = ps.executeQuery();

			while(rs.next()) {
				UserAccountModel user = new UserAccountModel();
				user.setUserId(rs.getInt("userId"));
				user.setUserName(rs.getString("userName"));
				user.setFirstName(rs.getString("firstName"));
				user.setLastName(rs.getString("lastName"));
				user.setEmail(rs.getString("email"));
				user.setPass(rs.getString("pass"));
				user.setRoleId(rs.getInt("roleId"));
				listUser.add(user);
				
			}
			return listUser;
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
	@Override
	public void updateRole(int userId) {
		
		String sql = "update UserAccount set roleId = 2  Where userId =?";
		try {
			conn = super.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, userId);
			ps.executeUpdate();
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
	}

	@Override
	public boolean checkExistEmailEdit(int userId,String email) {
		boolean check = false;
		String sql = "SELECT * FROM UserAccount WHERE email = ? and userId <> ?";

		try {
			conn = super.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ps.setInt(2, userId);
			rs = ps.executeQuery();
			if(rs.next())
			{
				check=true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return check;
	}

	@Override
	public boolean checkExistUsernameEdit(int userId,String username) {
		boolean check = false;
		String sql = "SELECT * FROM UserAccount WHERE userName = ? and userId <> ?";

		try {
			conn = super.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, username);
			ps.setInt(2, userId);
			rs = ps.executeQuery();
			if(rs.next())
			{
				check=true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return check;
	}

	@Override
	public boolean checkExistPhoneEdit(int userId,String phone) {
		boolean check = false;
		String sql = "SELECT * FROM UserAccount WHERE phone = ? and userId <> ?";

		try {
			conn = super.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, phone);
			ps.setInt(2, userId);
			rs = ps.executeQuery();
			if(rs.next())
			{
				check=true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return check;
	}
}



