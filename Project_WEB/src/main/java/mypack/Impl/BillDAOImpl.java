package mypack.Impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import ConnectionDB.DBConnection;
import mypack.DAO.IBilldDAO;
import mypack.model.BillModel;
import mypack.model.ProductModel;

public class BillDAOImpl extends DBConnection implements IBilldDAO{

	Connection con;
	PreparedStatement ps ;
	ResultSet rs;
	@Override
	public BillModel getBillByCartId(int cartId) {
	
		String sql = "select * from Bill where cartId = ?";

		try {
			con = super.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, cartId);
			rs = ps.executeQuery();
			while(rs.next()) {
				BillModel bill = new BillModel();
				bill.setAddr(rs.getString("addr"));
				bill.setBillId(rs.getInt("billId"));
				bill.setCartId(rs.getInt("cartId"));
				bill.setUserFName(rs.getString("userFName"));
				bill.setUserLName(rs.getString("userLName"));
				bill.setPhone(rs.getString("phone"));
				bill.setEmail(rs.getString("email"));
				bill.setCartTotal(rs.getInt("cartTotal"));
				bill.setShipping(rs.getInt("shipping"));
				bill.setSubTotal(rs.getInt("subTotal"));
				return bill;
				
			}
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return null;
	}
	@Override
	public BillModel getLastId() {
		
		String sql = "SELECT MAX(billId) as billId\r\n" + "  FROM Bill";
		try {
			con = super.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				BillModel bill = new BillModel();
				bill.setBillId(rs.getInt("billId"));
				return bill;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
