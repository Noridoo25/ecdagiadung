package mypack.Impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import ConnectionDB.DBConnection;
import mypack.DAO.IEmployeeDao;
import mypack.model.EmPloyeeModel;

public class EmployeeDAOImpl extends DBConnection implements IEmployeeDao {
	Connection conn;
	PreparedStatement ps;
	ResultSet rs;
	@Override
	public List<EmPloyeeModel> getEmployeeAll() {
		List<EmPloyeeModel> employees = new ArrayList<EmPloyeeModel>();
		
		String sql = "select * from Employee";
		try {
			conn = super.getConnection();
			ps=conn.prepareStatement(sql);
			rs= ps.executeQuery();
			while (rs.next()) {
				EmPloyeeModel employee = new EmPloyeeModel();
				employee.setEmployeeId(rs.getInt("employeeId"));
				employee.setEmployName(rs.getString("employName"));
				employee.setRoles(rs.getString("roles"));
				employee.setDepiction(rs.getString("depiction"));
				employee.setEmployeeImage(rs.getString("employeeImage"));
				
				employees.add(employee);
			}
			return employees;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
}
