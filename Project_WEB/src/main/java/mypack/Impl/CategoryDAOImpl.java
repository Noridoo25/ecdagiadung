package mypack.Impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import ConnectionDB.DBConnection;
import mypack.DAO.ICategoryDAO;
import mypack.model.CategoryModel;

public class CategoryDAOImpl extends DBConnection implements ICategoryDAO{

	Connection con;
	PreparedStatement ps ;
	ResultSet rs;
	
	@Override
	public CategoryModel get(int id) {
		String sql = "SELECT * FROM Category WHERE categoryId = ? ";
		try 
		{
			con = super.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			rs = ps.executeQuery();
			
			while (rs.next()) {
				
				CategoryModel category = new CategoryModel();
				
				category.setCategoryId(rs.getInt("categoryId"));
				category.setCategoryName(rs.getString("categoryName"));
				
				return category;
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public void insert(String categoryName) {
		
		String sql = "insert into Category(categoryName) values(?)";
		try {
			con = super.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, categoryName);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<CategoryModel> getAll() {
		
		String sql = "select * from Category";
		List<CategoryModel> cates = new ArrayList<>();
		try {
			con = super.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				CategoryModel cate = new CategoryModel();
				cate.setCategoryId(rs.getInt("categoryId"));
				cate.setCategoryName(rs.getString("categoryName"));
				cates.add(cate);
			}
			return cates;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public void edit(int categoryId,String categoryName) {
		
		String sql = "update Category set categoryName = ? where categoryId =?";
		try {
			con = super.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, categoryName);
			ps.setInt(2, categoryId);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public CategoryModel getCategoryById(int id) {
		
		String sql = "select * from Category where categoryId = ?";
		try {
			con = super.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			rs = ps.executeQuery();
			while(rs.next()) {
				CategoryModel cate = new CategoryModel();
				cate.setCategoryId(rs.getInt("categoryId"));
				cate.setCategoryName(rs.getString("categoryName"));
				return cate;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public void delete(int categoryId) {
		
		String sql ="delete from Category where categoryId = ?";
		try {
			con = super.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, categoryId);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void reset(int categoryId) {
		
		String sql = "DBCC CHECKIDENT(Category, RESEED, ?)";
		try {
			con = super.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, categoryId-1);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	

}