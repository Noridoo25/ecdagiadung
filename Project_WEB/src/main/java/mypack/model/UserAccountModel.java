package mypack.model;

public class UserAccountModel {
	
	private int userId;
	private String userName;
	private String email;
	private String pass;
	private String firstName;
	private String lastName;
	private String phone;
	private String addr;
	private int roleId;
	private StoreModel store;
	public UserAccountModel() {
		super();
		// TODO Auto-generated constructor stub
	}
	public UserAccountModel(int userId, String userName, String email, String pass, String firstName, String lastName,
			String phone, String addr, int roleId, StoreModel store) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.email = email;
		this.pass = pass;
		this.firstName = firstName;
		this.lastName = lastName;
		this.phone = phone;
		this.addr = addr;
		this.roleId = roleId;
		this.store = store;
	}
	public UserAccountModel(String userName, String email, String pass) {
		super();
		this.userName = userName;
		this.email = email;
		this.pass = pass;
	}
	
	public UserAccountModel(String username, String email, String pass, String firstName, String lastName,
			String phone, String addr, int userId, StoreModel store) {
		super();
		this.userName = username;
		this.email = email;
		this.pass = pass;
		this.firstName = firstName;
		this.lastName = lastName;
		this.phone = phone;
		this.addr = addr;
		this.userId = userId;
		this.store = store;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public int getRoleId() {
		return roleId;
	}
	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}
	public StoreModel getStore() {
		return store;
	}
	public void setStore(StoreModel store) {
		this.store = store;
	}


	
	
	
}