package mypack.Impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import ConnectionDB.DBConnection;
import mypack.DAO.IStoreDAO;
import mypack.DAO.IUserDAO;
import mypack.model.ProductModel;
import mypack.model.StoreModel;

public class StoreDAOImpl extends DBConnection implements IStoreDAO{

	Connection con = null;
	PreparedStatement ps=null;
	ResultSet rs = null;
	@Override
	public boolean insert(StoreModel store) {

		String sql = "INSERT INTO Store(storeName,email,phone,city,provin,ward,avartarStore,bannerStore,userId) VALUES (?,?,?,?,?,?,?,?,?)";
		try {
			con = super.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, store.getStoreName());
			ps.setString(2, store.getEmail());
			ps.setString(3, store.getPhone());
			ps.setString(4, store.getCity());
			ps.setString(5, store.getProvin());
			ps.setString(6, store.getWard());
			ps.setString(7, store.getAvartarStore());
			ps.setString(8, store.getBannerStore());
			ps.setInt(9, store.getUserId());
			ps.executeUpdate();
			return true;
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		return false;

	}

	@Override
	public boolean edit(StoreModel store) {

		String sql = "UPDATE Store SET storeName=?,email=?,phone=?,city=?,provin=?,ward=?,avartarStore=?,bannerStore=? where userId=?";
		try {
			con = super.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, store.getStoreName());
			ps.setString(2, store.getEmail());
			ps.setString(3, store.getPhone());
			ps.setString(4, store.getCity());
			ps.setString(5, store.getProvin());
			ps.setString(6, store.getWard());
			ps.setString(7, store.getAvartarStore());
			ps.setString(8, store.getBannerStore());
			ps.setInt(9, store.getUserId());
			ps.executeUpdate();
			return true;
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public void delete(int storeid) {

	}

	@Override
	public StoreModel get(int id) {

		String sql = "SELECT * FROM Store where storeId = ?";
		try {
			con = super.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			rs = ps.executeQuery();
			while(rs.next()) {
				StoreModel store = new StoreModel();
				store.setStoreId(rs.getInt("storeId"));
				store.setStoreName(rs.getString("storeName"));
				store.setEmail(rs.getString("email"));
				store.setPhone(rs.getString("phone"));
				store.setCity(rs.getString("city"));
				store.setProvin(rs.getString("provin"));
				store.setWard(rs.getString("ward"));
				store.setAvartarStore(rs.getString("avartarStore"));
				store.setBannerStore(rs.getString("bannerStore"));
				store.setUserId(rs.getInt("userId"));
				return store;
			}
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public StoreModel getStoreOfSeller(int userId) {
		IUserDAO userDAO = new UserDAOImpl();

		StoreModel store = new StoreModel();
		String sql = "SELECT * FROM Store where userId = ?";
		try {
			con = super.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, userId);
			rs = ps.executeQuery();
			while(rs.next()) {
				store.setStoreId(rs.getInt("storeId"));
				store.setStoreName(rs.getString("storeName"));
				store.setEmail(rs.getString("email"));
				store.setPhone(rs.getString("phone"));
				store.setCity(rs.getString("city"));
				store.setProvin(rs.getString("provin"));
				store.setWard(rs.getString("ward"));
				store.setAvartarStore(rs.getString("avartarStore"));
				store.setBannerStore(rs.getString("bannerStore"));
				store.setUserAccount(userDAO.get(rs.getInt("userId")));
				return store;
			}

		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public StoreModel getImageShop(int userId) {


		return null;
	}

	@Override
	public List<StoreModel> getListSeller() {

		String sql="select * from Store";
		IUserDAO userDAO = new UserDAOImpl();
		List<StoreModel> stores = new ArrayList<>();


		try {
			con = super.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				StoreModel store = new StoreModel();
				store.setStoreId(rs.getInt("storeId"));
				store.setStoreName(rs.getString("storeName"));
				store.setEmail(rs.getString("email"));
				store.setPhone(rs.getString("phone"));
				store.setCity(rs.getString("city"));
				store.setProvin(rs.getString("provin"));
				store.setWard(rs.getString("ward"));
				store.setAvartarStore(rs.getString("avartarStore"));
				store.setBannerStore(rs.getString("bannerStore"));
				store.setUserId(rs.getInt("userId"));
				store.setUserAccount(userDAO.get(rs.getInt("userId")));
				stores.add(store);
			}

			return stores;
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public StoreModel listStoreForKey(String key, int userId) {

		String sql = "select * from Store where storeName like ? and userId = ?";

		try {
			con = super.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, "%" +key+"%");
			ps.setInt(2, userId);
			rs = ps.executeQuery();
			while(rs.next()) {
				StoreModel store = new StoreModel();
				store.setStoreId(rs.getInt("storeId"));
				store.setStoreName(rs.getString("storeName"));
				store.setEmail(rs.getString("email"));
				store.setPhone(rs.getString("phone"));
				store.setCity(rs.getString("city"));
				store.setProvin(rs.getString("provin"));
				store.setWard(rs.getString("ward"));
				store.setAvartarStore(rs.getString("avartarStore"));
				store.setBannerStore(rs.getString("bannerStore"));
				store.setUserId(rs.getInt("userId"));
				return store;
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<StoreModel> listStoreForKey(String key) {
		List<StoreModel> stores = new ArrayList<>();
		String sql = "select * from Store where storeName like ?";

		try {
			con = super.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, "%" +key+"%");
			rs = ps.executeQuery();
			while(rs.next()) {
				StoreModel store = new StoreModel();
				store.setStoreId(rs.getInt("storeId"));
				store.setStoreName(rs.getString("storeName"));
				store.setEmail(rs.getString("email"));
				store.setPhone(rs.getString("phone"));
				store.setCity(rs.getString("city"));
				store.setProvin(rs.getString("provin"));
				store.setWard(rs.getString("ward"));
				store.setAvartarStore(rs.getString("avartarStore"));
				store.setBannerStore(rs.getString("bannerStore"));
				store.setUserId(rs.getInt("userId"));
				stores.add(store);
			}

			return stores;
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public boolean checkEmailStore(String email) {
		boolean check = false;
		String sql = "select * from Store where email =?";
		try {
			con = super.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, email);
			rs = ps.executeQuery();
			if(rs.next())
			{
				check=true;
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		return check;
	}

	@Override
	public boolean checkPhoneStore(String phone) {
		boolean check = false;
		String sql = "select * from Store where phone =?";
		try {
			con = super.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, phone);
			rs = ps.executeQuery();
			if(rs.next())
			{
				check=true;
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		return check;
	}

	@Override
	public StoreModel getLastId() {
		
		String sql = "SELECT MAX(storeId) as storeId FROM Store";

		try {
			con = super.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				StoreModel store = new StoreModel();
				store.setStoreId(rs.getInt("storeId"));
				return store;
			}


		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public boolean checkEmailStoreEdit(String email, int sellerId) {
		boolean check = false;
		String sql = "Select * from Store where email = ? and userId <> ?";
		try {
			con = super.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, email);
			ps.setInt(2, sellerId);
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
	public boolean checkPhoneStoreEdit(String phone, int sellerId) {
		boolean check = false;
		String sql = "Select * from Store where phone = ? and userId <> ?";
		try {
			con = super.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, phone);
			ps.setInt(2, sellerId);
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
	public boolean checkStoreName(String storeName) {
		boolean check = false;
		String sql = "select * from Store where storeName =?";
		try {
			con = super.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, storeName);
			rs = ps.executeQuery();
			if(rs.next())
			{
				check=true;
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		return check;
	}

	@Override
	public boolean checkStoreNameEdit(String storeName, int sellerId) {
		boolean check = false;
		String sql = "Select * from Store where email = ? and userId <> ?";
		try {
			con = super.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, storeName);
			ps.setInt(2, sellerId);
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
