package mypack.DAO;

import java.util.List;

import mypack.model.EmPloyeeModel;

public interface IEmployeeDao {
	List<EmPloyeeModel> getEmployeeAll();
}
