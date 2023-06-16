package mypack.model;

public class EmPloyeeModel {
	private int employeeId;
	private String employName;
	private String roles;
	private String depiction;
	private String employeeImage;
	
	
	public EmPloyeeModel() {
		super();
		// TODO Auto-generated constructor stub
	}


	public EmPloyeeModel(int employeeId, String employName, String roles, String depiction, String employeeImage) {
		super();
		this.employeeId = employeeId;
		this.employName = employName;
		this.roles = roles;
		this.depiction = depiction;
		this.employeeImage = employeeImage;
	}


	public int getEmployeeId() {
		return employeeId;
	}


	public void setEmployeeId(int employeeId) {
		this.employeeId = employeeId;
	}


	public String getEmployName() {
		return employName;
	}


	public void setEmployName(String employName) {
		this.employName = employName;
	}


	public String getRoles() {
		return roles;
	}


	public void setRoles(String roles) {
		this.roles = roles;
	}


	public String getDepiction() {
		return depiction;
	}


	public void setDepiction(String depiction) {
		this.depiction = depiction;
	}


	public String getEmployeeImage() {
		return employeeImage;
	}


	public void setEmployeeImage(String employeeImage) {
		this.employeeImage = employeeImage;
	}
	
	
	
	
}
