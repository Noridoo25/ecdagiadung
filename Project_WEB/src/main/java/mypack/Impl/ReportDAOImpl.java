package mypack.Impl;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import ConnectionDB.DBConnection;
import mypack.DAO.ICategoryDAO;
import mypack.DAO.IReportDAO;
import mypack.model.ProductModel;
import mypack.model.ReportAdminModel;
import mypack.model.ReportSellerModel;

public class ReportDAOImpl extends DBConnection implements IReportDAO{

	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	@Override
	public List<ReportSellerModel> listReportByDateOfSeller(int sellerId, String date) {
		
		
		List<ReportSellerModel> reports = new ArrayList<ReportSellerModel>();

		String sql = "select Pr.productId, Pr.productName, sum(amount) as amount, sum(total) as total, Pr.sellerId FROM (select * from Orders O where date=? and status=1) Q join ProductInCart P\r\n"
				+ "					on Q.cartId = P.cartId \r\n"
				+ "					join Product Pr ON P.productId = Pr.productId \r\n"
				+ "					where Pr.sellerId = ? \r\n"
				+ "					group by Pr.sellerId, Pr.productId, Pr.productName";
		
		try {

			conn = super.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, date);
			ps.setInt(2, sellerId);
			rs = ps.executeQuery();


			while (rs.next()) {

				ReportSellerModel report = new ReportSellerModel();

				report.setProductId(rs.getInt("productId"));
				report.setProductName(rs.getString("productName"));
				report.setAmount(rs.getInt("amount"));
				report.setTotal(rs.getInt("total"));
				report.setUserId(rs.getInt("sellerId"));
				reports.add(report);

			}
			return reports;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<ReportSellerModel> listReportByDateOfSellerForDays(int sellerId, String fromdate, String todate) {
		
		List<ReportSellerModel> reports = new ArrayList<ReportSellerModel>();

		String sql = "select Pr.productId, Pr.productName, sum(amount) as amount, sum(total) as total, Pr.sellerId FROM (select * from Orders O where date >= ? and date <= ? and status=1) Q join ProductInCart P\r\n"
				+ "					on Q.cartId = P.cartId \r\n"
				+ "					join Product Pr ON P.productId = Pr.productId \r\n"
				+ "					where Pr.sellerId = ? \r\n"
				+ "					group by Pr.sellerId, Pr.productId, Pr.productName";
		
		try {

			conn = super.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, fromdate);
			ps.setString(2, todate);
			ps.setInt(3, sellerId);
			rs = ps.executeQuery();


			while (rs.next()) {

				ReportSellerModel report = new ReportSellerModel();

				report.setProductId(rs.getInt("productId"));
				report.setProductName(rs.getString("productName"));
				report.setAmount(rs.getInt("amount"));
				report.setTotal(rs.getInt("total"));
				report.setUserId(rs.getInt("sellerId"));
				reports.add(report);

			}
			return reports;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<ReportAdminModel> listReportAdminByDate(String date) {
		List<ReportAdminModel> reports = new ArrayList<ReportAdminModel>();

		String sql = "select S.storeId, S.storeName, S.email, sum(amount) as amount, sum(total) as total \r\n"
				+ "		FROM (select * from Orders O where date =? and status=1) Q join ProductInCart P \r\n"
				+ "					on Q.cartId = P.cartId \r\n"
				+ "					join Product Pr ON P.productId = Pr.productId \r\n"
				+ "					join Store S ON Pr.sellerId = S.userId \r\n"
				+ "					group by Pr.sellerId, S.storeId, S.storeName, S.email";
		
		try {

			conn = super.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, date);
			rs = ps.executeQuery();


			while (rs.next()) {

				ReportAdminModel report = new ReportAdminModel();

				report.setStoreId(rs.getInt("storeId"));
				report.setStoreName(rs.getString("storeName"));
				report.setEmail(rs.getString("email"));
				report.setAmount(rs.getInt("amount"));
				report.setTotal(rs.getInt("total"));
				
				reports.add(report);

			}
			return reports;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<ReportAdminModel> listReportAdminForDays(String fromdate, String todate) {
		
		List<ReportAdminModel> reports = new ArrayList<ReportAdminModel>();

		String sql = "select S.storeId, S.storeName, S.email, sum(amount) as amount, sum(total) as total \r\n"
				+ "		FROM (select * from Orders O where date >= ? and date <= ? and status=1) Q join ProductInCart P \r\n"
				+ "					on Q.cartId = P.cartId \r\n"
				+ "					join Product Pr ON P.productId = Pr.productId \r\n"
				+ "					join Store S ON Pr.sellerId = S.userId \r\n"
				+ "					group by Pr.sellerId, S.storeId, S.storeName, S.email";
		
		try {

			conn = super.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, fromdate);
			ps.setString(2, todate);
			rs = ps.executeQuery();


			while (rs.next()) {

				ReportAdminModel report = new ReportAdminModel();

				report.setStoreId(rs.getInt("storeId"));
				report.setStoreName(rs.getString("storeName"));
				report.setEmail(rs.getString("email"));
				report.setAmount(rs.getInt("amount"));
				report.setTotal(rs.getInt("total"));
				
				reports.add(report);

			}
			return reports;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
