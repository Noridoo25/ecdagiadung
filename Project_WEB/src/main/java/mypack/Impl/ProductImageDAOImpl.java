package mypack.Impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import ConnectionDB.DBConnection;
import mypack.DAO.IProductImageDAO;
import mypack.model.ProductImageModel;

public class ProductImageDAOImpl extends DBConnection implements IProductImageDAO {
	
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	@Override
	public List<ProductImageModel> lastestProduct() {
		
		List<ProductImageModel> products = new ArrayList<ProductImageModel>();
		
		String sql = "SELECT * FROM Product as A JOIN \r\n"
				+ "	(SELECT DISTINCT productId, FIRST_VALUE(productImage) OVER \r\n"
				+ "	(PARTITION BY productId ORDER BY productId) as productImage from ProductImage) \r\n"
				+ "	as P ON A.productId = P.productId WHERE A.exclusion=1";
		
		try {
			conn = super.getConnection();
			ps = conn.prepareStatement(sql);  
			rs = ps.executeQuery(); 
			
		
		while (rs.next()) {    
			
		ProductImageModel product = new ProductImageModel();
		product.setProductId(rs.getInt("productId"));
		product.setProductName(rs.getString("productName"));
		product.setDepiction(rs.getString("depiction"));
		product.setDetail(rs.getString("detail"));
		product.setProductPrice(rs.getInt("productPrice"));
		product.setProductImage(rs.getString("productImage"));
		product.setSellerId(rs.getInt("sellerId"));
		products.add(product);
		
		}
		return products;
		} catch (Exception e) 
		{
			e.printStackTrace();
		}

		return null;
	}

	@Override
	public List<ProductImageModel> exclusiveProduct() {
		
		List<ProductImageModel> products = new ArrayList<ProductImageModel>();
		
		String sql = "SELECT * FROM Product WHERE exclusion=1";
		
		try {
			conn = super.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();

			while (rs.next()) {

				ProductImageModel product = new ProductImageModel();
				product.setProductId(rs.getInt("productId"));
				product.setProductName(rs.getString("productName"));
				product.setDepiction(rs.getString("depiction"));
				product.setDetail(rs.getString("detail"));
				product.setProductPrice(rs.getInt("productPrice"));
				product.setSellerId(rs.getInt("sellerId"));
				products.add(product);

			}
			return products;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	@Override
	public void insert(ProductImageModel productImages) {
		
		String sql = "insert into ProductImage(productId, productImage) values(?,?)";
		try {
			conn = super.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, productImages.getProductId());
			ps.setString(2, productImages.getProductImage());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public ProductImageModel getImagesOfProduct(int productId) {
	
		ProductImageModel image = new ProductImageModel();
		String sql = "select TOP 1 * from ProductImage join Product on ProductImage.productId = Product.productId where ProductImage.productId = ?";
		try {
			conn = super.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, productId);
			rs = ps.executeQuery();
			while(rs.next()) {
				
				image.setProductId(rs.getInt("productId"));
				image.setProductImage(rs.getString("productImage"));
				image.setProductName(rs.getString("productName"));
				image.setDepiction(rs.getString("depiction"));
				image.setDetail(rs.getString("detail"));
				image.setProductPrice(rs.getInt("productPrice"));
				image.setCategoryId(rs.getInt("categoryId"));
				image.setSellerId(rs.getInt("sellerId"));
				return image;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public void edit(ProductImageModel product) {
		
		String sql = "update ProductImage set productImage=? where productId in(select top 1 productId from ProductImage where productId = ?) ";
		try {
			conn = super.getConnection();
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, product.getProductImage());
			ps.setInt(2, product.getProductId());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	@Override
	public void delete(int productId) {
		
		String sql ="delete from ProductImage where productId=?";
		try {
			conn = super.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, productId);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<ProductImageModel> getAllImagesOfProduct(int productId) {
		
		List<ProductImageModel> images = new ArrayList<>();
		String sql = "select * from ProductImage join Product on ProductImage.productId = Product.productId where ProductImage.productId = ?";
		try {
			conn = super.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, productId);
			rs = ps.executeQuery();
			while(rs.next()) {
				ProductImageModel image = new ProductImageModel();
				image.setProductId(rs.getInt("productId"));
				image.setProductImage(rs.getString("productImage"));
				image.setProductName(rs.getString("productName"));
				image.setDepiction(rs.getString("depiction"));
				image.setDetail(rs.getString("detail"));
				image.setProductPrice(rs.getInt("productPrice"));
				image.setCategoryId(rs.getInt("categoryId"));
				images.add(image);
			}
			return images;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public void deleteImage(int productId, String productImage) {
		
		String sql ="delete from ProductImage where productId=? and productImage = ?";
		try {
			conn = super.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, productId);
			ps.setString(2,productImage );
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
