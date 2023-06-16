package mypack.Impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import ConnectionDB.DBConnection;
import mypack.DAO.ICategoryDAO;
import mypack.DAO.IProductDAO;
import mypack.model.CategoryModel;
import mypack.model.ProductModel;

public class ProductDAOImpl extends DBConnection implements IProductDAO {

	Connection conn;
	PreparedStatement ps;
	ResultSet rs;

	@Override
	public List<ProductModel> latestProduct() {

		List<ProductModel> products = new ArrayList<ProductModel>();

		String sql = "select top 8 *  from Product order by productId desc";
		try {

			conn = super.getConnection();
			ps = conn.prepareStatement(sql);

			rs = ps.executeQuery();


			ICategoryDAO categoryDao = new CategoryDAOImpl();

			while (rs.next()) {

				ProductModel product = new ProductModel();

				product.setProductId(rs.getInt("productId"));
				product.setProductName(rs.getString("productName"));
				product.setDepiction(rs.getString("depiction"));
				product.setDetail(rs.getString("detail"));
				product.setProductPrice(rs.getInt("productPrice"));
				product.setCategoryId(rs.getInt("categoryId"));
				product.setCategory(categoryDao.get(rs.getInt("categoryId")));
				products.add(product);
				
			}
			return products;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public ProductModel get(int id) {

		return null;
	}

	@Override
	public void inset(ProductModel product) {

		String sql = "insert into Product(productName, depiction,detail, productPrice,categoryId, sellerId) values(?,?,?,?,?,?	)";
		try {
			conn = super.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, product.getProductName());
			ps.setString(2, product.getDepiction());
			ps.setString(3, product.getDetail());
			ps.setInt(4, product.getProductPrice());
			ps.setInt(5, product.getCategoryId());
			ps.setInt(6, product.getSellerId());
			ps.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public ProductModel getIdByProductName(String productName) {

		String sql = "select productId, productName from Product where productName = ?";
		try {
			conn = super.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, productName);
			rs = ps.executeQuery();
			while (rs.next()) {
				ProductModel product = new ProductModel();
				product.setProductId(rs.getInt("productId"));
				product.setProductName(rs.getString("productName"));
				return product;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public ProductModel getLastId() {

		String sql = "SELECT MAX(productId) as productId\r\n" + "  FROM Product";
		try {
			conn = super.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				ProductModel product = new ProductModel();
				product.setProductId(rs.getInt("productId"));
				return product;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<ProductModel> getAll() {

		String sql = "select * from Product";
		List<ProductModel> products = new ArrayList<ProductModel>();
		try {
			conn = super.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				ProductModel product = new ProductModel();

				product.setProductId(rs.getInt("productId"));
				product.setProductName(rs.getString("productName"));
				product.setDepiction(rs.getString("depiction"));
				product.setDetail(rs.getString("detail"));
				product.setProductPrice(rs.getInt("productPrice"));
				product.setCategoryId(rs.getInt("categoryId"));
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
	public void edit(ProductModel product, int productId) {
		
		String sql = "update Product set productName=? ,depiction=?, detail=?, productPrice=? ,categoryId=? Where productId =?";
		try {
			conn = super.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, product.getProductName());
			ps.setString(2, product.getDepiction());
			ps.setString(3, product.getDetail());
			ps.setInt(4, product.getProductPrice());
			ps.setInt(5, product.getCategoryId());
			ps.setInt(6, productId);
			ps.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void delete(int productId) {
		
		String sql = "delete from Product where productId=?";
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
	public void resetProductId(int productId) {
		
		String sql = "DBCC CHECKIDENT(Product, RESEED, ? )";
		try {
			conn = super.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, productId - 1);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<ProductModel> getAllProductByCategoryId(int cateId, String Sort, String type) {
		
		String sql = "select * from Product where categoryId = "+cateId+" order by "+type+" "+" "+Sort ;
		List<ProductModel> products = new ArrayList<ProductModel>();
		try {
			conn = super.getConnection();
			ps = conn.prepareStatement(sql);
		
			rs = ps.executeQuery();

			while (rs.next()) {
				ProductModel product = new ProductModel();

				product.setProductId(rs.getInt("productId"));
				product.setProductName(rs.getString("productName"));
				product.setDepiction(rs.getString("depiction"));
				product.setDetail(rs.getString("detail"));
				product.setProductPrice(rs.getInt("productPrice"));
				product.setCategoryId(rs.getInt("categoryId"));

				products.add(product);

			}

			return products;
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<ProductModel> getAllRelateProductByCategoryId(int cateId, String productName) {

		String sql = "select TOP 4 * from Product where productName <> ? and categoryId = ?";
		List<ProductModel> products = new ArrayList<ProductModel>();
		try {
			conn = super.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(2, cateId);
			ps.setString(1, productName);
			rs = ps.executeQuery();

			while (rs.next()) {
				ProductModel product = new ProductModel();

				product.setProductId(rs.getInt("productId"));
				product.setProductName(rs.getString("productName"));
				product.setDepiction(rs.getString("depiction"));
				product.setDetail(rs.getString("detail"));
				product.setProductPrice(rs.getInt("productPrice"));
				product.setCategoryId(rs.getInt("categoryId"));

				products.add(product);

			}

			return products;
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<ProductModel> getNext6ProductFilter(int cateId, String Sort, String type, int index) {
		
		String sql="with x as (select ROW_NUMBER() over (order by "+type+""+ " "+ ""+ Sort+") as r\n"
				+ ",* from Product where categoryId = "+cateId+")\n"
				+ "select * from x where r between ?*6-5 and ?*6";
		List<ProductModel> products = new ArrayList<ProductModel>();
		try {
			conn = super.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, index);
			ps.setInt(2, index);

			rs = ps.executeQuery();

			while (rs.next()) {
				ProductModel product = new ProductModel();

				product.setProductId(rs.getInt("productId"));
				product.setProductName(rs.getString("productName"));
				product.setDepiction(rs.getString("depiction"));
				product.setDetail(rs.getString("detail"));
				product.setProductPrice(rs.getInt("productPrice"));
				product.setCategoryId(rs.getInt("categoryId"));

				products.add(product);

			}

			return products;
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return null;

	}

	@Override
	public List<ProductModel> getNext6Product(int index) {
		
		String sql="with x as (select ROW_NUMBER() over (order by productId ) as r\n"
				+ ",* from Product )\n"
				+ "select * from x where r between ?*6-5 and ?*6";
		List<ProductModel> products = new ArrayList<ProductModel>();
		try {
			conn = super.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, index);
			ps.setInt(2, index);
			rs = ps.executeQuery();
			while (rs.next()) {
				ProductModel product = new ProductModel();

				product.setProductId(rs.getInt("productId"));
				product.setProductName(rs.getString("productName"));
				product.setDepiction(rs.getString("depiction"));
				product.setDetail(rs.getString("detail"));
				product.setProductPrice(rs.getInt("productPrice"));
				product.setCategoryId(rs.getInt("categoryId"));

				products.add(product);
			}
			return products;
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<ProductModel> getTop6Product() {
		
		String sql = "select TOP 6 * from Product";
		List<ProductModel> products = new ArrayList<ProductModel>();
		try {
			conn = super.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				ProductModel product = new ProductModel();

				product.setProductId(rs.getInt("productId"));
				product.setProductName(rs.getString("productName"));
				product.setDepiction(rs.getString("depiction"));
				product.setDetail(rs.getString("detail"));
				product.setProductPrice(rs.getInt("productPrice"));
				product.setCategoryId(rs.getInt("categoryId"));

				products.add(product);
			}
			return products;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<ProductModel> get6ProductByCategoryId(int cateId, String Sort, String type) {
		
		String sql = "select TOP 6* from Product where categoryId = "+cateId+" order by "+type+" "+" "+Sort ;
		List<ProductModel> products = new ArrayList<ProductModel>();
		try {
			conn = super.getConnection();
			ps = conn.prepareStatement(sql);
		
			rs = ps.executeQuery();

			while (rs.next()) {
				ProductModel product = new ProductModel();

				product.setProductId(rs.getInt("productId"));
				product.setProductName(rs.getString("productName"));
				product.setDepiction(rs.getString("depiction"));
				product.setDetail(rs.getString("detail"));
				product.setProductPrice(rs.getInt("productPrice"));
				product.setCategoryId(rs.getInt("categoryId"));

				products.add(product);

			}

			return products;
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<ProductModel> searchProduct(String productName) {

		String sql = "select * from Product where productName like ?";
		List<ProductModel> products = new ArrayList<ProductModel>();
		try {
			conn = super.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, "%" +productName+"%");


			rs = ps.executeQuery();

			while (rs.next()) {
				ProductModel product = new ProductModel();

				product.setProductId(rs.getInt("productId"));
				product.setProductName(rs.getString("productName"));
				product.setDepiction(rs.getString("depiction"));
				product.setDetail(rs.getString("detail"));
				product.setProductPrice(rs.getInt("productPrice"));
				product.setCategoryId(rs.getInt("categoryId"));

				products.add(product);

			}

			return products;
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<ProductModel> searchTop6Product(String productName) {
		
		String sql = "select TOP 6 * from Product where productName like ?";
		List<ProductModel> products = new ArrayList<ProductModel>();
		try {
			conn = super.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, "%" +productName+"%");


			rs = ps.executeQuery();

			while (rs.next()) {
				ProductModel product = new ProductModel();

				product.setProductId(rs.getInt("productId"));
				product.setProductName(rs.getString("productName"));
				product.setDepiction(rs.getString("depiction"));
				product.setDetail(rs.getString("detail"));
				product.setProductPrice(rs.getInt("productPrice"));
				product.setCategoryId(rs.getInt("categoryId"));

				products.add(product);

			}

			return products;
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<ProductModel> getNext6ProductSearch(int index, String productName) {
		
		String sql="with x as (select ROW_NUMBER() over (order by productId ) as r\n"
				+ ",* from Product where productName like ?)\n"
				+ "select * from x where r between ?*6-5 and ?*6";
		List<ProductModel> products = new ArrayList<ProductModel>();
		try {
			conn = super.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(2, index);
			ps.setInt(3, index);
			ps.setString(1, "%" +productName+"%");
			rs = ps.executeQuery();
			while (rs.next()) {
				ProductModel product = new ProductModel();

				product.setProductId(rs.getInt("productId"));
				product.setProductName(rs.getString("productName"));
				product.setDepiction(rs.getString("depiction"));
				product.setDetail(rs.getString("detail"));
				product.setProductPrice(rs.getInt("productPrice"));
				product.setCategoryId(rs.getInt("categoryId"));

				products.add(product);
			}
			return products;
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<ProductModel> getAllSeller(int userId) {
		String sql = "select * from Product where sellerId = ?";
		List<ProductModel> products = new ArrayList<ProductModel>();
		try {
			conn = super.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, userId);
			rs = ps.executeQuery();
			while (rs.next()) {
				ProductModel product = new ProductModel();

				product.setProductId(rs.getInt("productId"));
				product.setProductName(rs.getString("productName"));
				product.setDepiction(rs.getString("depiction"));
				product.setDetail(rs.getString("detail"));
				product.setProductPrice(rs.getInt("productPrice"));
				product.setCategoryId(rs.getInt("categoryId"));
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
	public List<ProductModel> getTop6ProductSeller(int userId) {
		
		String sql = "select TOP 6 * from Product where sellerId = ?";
		List<ProductModel> products = new ArrayList<ProductModel>();
		try {
			conn = super.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, userId);
			rs = ps.executeQuery();
			while (rs.next()) {
				ProductModel product = new ProductModel();

				product.setProductId(rs.getInt("productId"));
				product.setProductName(rs.getString("productName"));
				product.setDepiction(rs.getString("depiction"));
				product.setDetail(rs.getString("detail"));
				product.setProductPrice(rs.getInt("productPrice"));
				product.setCategoryId(rs.getInt("categoryId"));
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
	public ProductModel getProductById(int productId) {
		
		String sql = "select * from Product where productId = ?";
		try {
			conn = super.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, productId);
			rs = ps.executeQuery();
			while (rs.next()) {
				ProductModel product = new ProductModel();

				product.setProductId(rs.getInt("productId"));
				product.setProductName(rs.getString("productName"));
				product.setDepiction(rs.getString("depiction"));
				product.setDetail(rs.getString("detail"));
				product.setProductPrice(rs.getInt("productPrice"));
				product.setCategoryId(rs.getInt("categoryId"));
				product.setSellerId(rs.getInt("sellerId"));
				return product;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;

	}

	@Override
	public List<ProductModel> searchProductOfSeller(int sellerId, String productName) {
		
		String sql = "select * from Product where productName like ? and sellerId = ?";
		List<ProductModel> products = new ArrayList<ProductModel>();
		try {
			conn = super.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, "%" +productName+"%");
			ps.setInt(2, sellerId);

			rs = ps.executeQuery();

			while (rs.next()) {
				ProductModel product = new ProductModel();

				product.setProductId(rs.getInt("productId"));
				product.setProductName(rs.getString("productName"));
				product.setDepiction(rs.getString("depiction"));
				product.setDetail(rs.getString("detail"));
				product.setProductPrice(rs.getInt("productPrice"));
				product.setCategoryId(rs.getInt("categoryId"));
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
	public List<ProductModel> getAllProductOfSellerByCategory(int cateId, int sellerId) {
		
		String sql = "select * from Product where categoryId = ? and sellerId = ?";
		List<ProductModel> products = new ArrayList<ProductModel>();
		try {
			conn = super.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, cateId);
			ps.setInt(2, sellerId);

			rs = ps.executeQuery();

			while (rs.next()) {
				ProductModel product = new ProductModel();

				product.setProductId(rs.getInt("productId"));
				product.setProductName(rs.getString("productName"));
				product.setDepiction(rs.getString("depiction"));
				product.setDetail(rs.getString("detail"));
				product.setProductPrice(rs.getInt("productPrice"));
				product.setCategoryId(rs.getInt("categoryId"));
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
	public List<ProductModel> getAllProductByCategoryId(int categoryId) {

		String sql = "select * from Product where categoryId = ?";

		List<ProductModel> products = new ArrayList<ProductModel>();

		try {
			conn = super.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, categoryId);
			rs = ps.executeQuery();

			while (rs.next()) {
				ProductModel product = new ProductModel();

				product.setProductId(rs.getInt("productId"));
				product.setProductName(rs.getString("productName"));
				product.setDepiction(rs.getString("depiction"));
				product.setDetail(rs.getString("detail"));
				product.setProductPrice(rs.getInt("productPrice"));
				product.setCategoryId(rs.getInt("categoryId"));
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
	public int numberProductOfStore(int sellerId) {
		int count=0;
		String sql = "select * from Product where sellerId = ?";
		try {
			conn = super.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, sellerId);
			rs = ps.executeQuery();
			while (rs.next()) {
				count++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;

	}

	@Override
	public List<ProductModel> getAllProductByCategoryIdOfSeller(int cateId, String Sort, String type, int sellerId) {
		
		String sql = "select * from Product where sellerId = ? and categoryId = "+cateId+" order by "+type+" "+" "+Sort ;
		List<ProductModel> products = new ArrayList<ProductModel>();
		try {
			conn = super.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, sellerId);

			rs = ps.executeQuery();

			while (rs.next()) {
				ProductModel product = new ProductModel();

				product.setProductId(rs.getInt("productId"));
				product.setProductName(rs.getString("productName"));
				product.setDepiction(rs.getString("depiction"));
				product.setDetail(rs.getString("detail"));
				product.setProductPrice(rs.getInt("productPrice"));
				product.setCategoryId(rs.getInt("categoryId"));
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
	public List<ProductModel> get6ProductByCategoryIdOfSeller(int cateId, String Sort, String type, int sellerId) {
		
		String sql = "select TOP 6* from Product where sellerId = ? and categoryId = "+cateId+" order by "+type+" "+" "+Sort ;
		List<ProductModel> products = new ArrayList<ProductModel>();
		try {
			conn = super.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, sellerId);
			

			rs = ps.executeQuery();

			while (rs.next()) {
				ProductModel product = new ProductModel();

				product.setProductId(rs.getInt("productId"));
				product.setProductName(rs.getString("productName"));
				product.setDepiction(rs.getString("depiction"));
				product.setDetail(rs.getString("detail"));
				product.setProductPrice(rs.getInt("productPrice"));
				product.setCategoryId(rs.getInt("categoryId"));
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
	public List<ProductModel> getNext6ProductFilterOfSeller(int cateId, String Sort, String type, int index,
			int sellerId) {
		
		String sql="with x as (select ROW_NUMBER() over (order by "+type+""+ " "+ ""+ Sort+") as r\n"
				+ ",* from Product where sellerId = ? categoryId = "+cateId+")\n"
				+ "select * from x where r between ?*6-5 and ?*6";
		List<ProductModel> products = new ArrayList<ProductModel>();
		try {
			conn = super.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, sellerId);
			ps.setInt(2, index);
			ps.setInt(3, index);

			rs = ps.executeQuery();

			while (rs.next()) {
				ProductModel product = new ProductModel();

				product.setProductId(rs.getInt("productId"));
				product.setProductName(rs.getString("productName"));
				product.setDepiction(rs.getString("depiction"));
				product.setDetail(rs.getString("detail"));
				product.setProductPrice(rs.getInt("productPrice"));
				product.setCategoryId(rs.getInt("categoryId"));
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
	public List<ProductModel> getNext6ProductOfSeller(int index, int sellerId) {
		
		String sql="with x as (select ROW_NUMBER() over (order by productId ) as r\n"
				+ ",* from Product where sellerId = ?)\n"
				+ "select * from x where r between ?*6-5 and ?*6";
		List<ProductModel> products = new ArrayList<ProductModel>();
		try {
			conn = super.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, sellerId);
			ps.setInt(2, index);
			ps.setInt(3, index);
			rs = ps.executeQuery();
			while (rs.next()) {
				ProductModel product = new ProductModel();

				product.setProductId(rs.getInt("productId"));
				product.setProductName(rs.getString("productName"));
				product.setDepiction(rs.getString("depiction"));
				product.setDetail(rs.getString("detail"));
				product.setProductPrice(rs.getInt("productPrice"));
				product.setCategoryId(rs.getInt("categoryId"));
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
	public List<ProductModel> loadMore6ProductSearch(int amount, String key) {
		
		String sql = "SELECT * FROM Product where productName like ? ORDER BY productId OFFSET ? ROW fetch next 6 rows only";
		List<ProductModel> products = new ArrayList<ProductModel>();
		try {
			conn = super.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, "%" +key+"%");
			ps.setInt(2, amount);
			
			rs = ps.executeQuery();
			while (rs.next()) {
				ProductModel product = new ProductModel();

				product.setProductId(rs.getInt("productId"));
				product.setProductName(rs.getString("productName"));
				product.setDepiction(rs.getString("depiction"));
				product.setDetail(rs.getString("detail"));
				product.setProductPrice(rs.getInt("productPrice"));
				product.setCategoryId(rs.getInt("categoryId"));
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
	public List<ProductModel> getTop10ProductOfSeler(int userId) {
		
		String sql = "select TOP 10 * from Product where sellerId = ? order by productId desc";
		List<ProductModel> products = new ArrayList<ProductModel>();
		try {
			conn = super.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, userId);
			rs = ps.executeQuery();
			while (rs.next()) {
				ProductModel product = new ProductModel();

				product.setProductId(rs.getInt("productId"));
				product.setProductName(rs.getString("productName"));
				product.setDepiction(rs.getString("depiction"));
				product.setDetail(rs.getString("detail"));
				product.setProductPrice(rs.getInt("productPrice"));
				product.setCategoryId(rs.getInt("categoryId"));
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
	public List<ProductModel> getTop10ProductByCategoryId(int categoryId) {
		
		String sql = "select TOP 10 * from Product where categoryId = ? order by productId desc";

		List<ProductModel> products = new ArrayList<ProductModel>();

		try {
			conn = super.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, categoryId);
			rs = ps.executeQuery();

			while (rs.next()) {
				ProductModel product = new ProductModel();

				product.setProductId(rs.getInt("productId"));
				product.setProductName(rs.getString("productName"));
				product.setDepiction(rs.getString("depiction"));
				product.setDetail(rs.getString("detail"));
				product.setProductPrice(rs.getInt("productPrice"));
				product.setCategoryId(rs.getInt("categoryId"));
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
	public List<ProductModel> getTop10Product() {
		
		String sql = "select TOP 10 * from Product order by productId desc";
		List<ProductModel> products = new ArrayList<ProductModel>();
		try {
			conn = super.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				ProductModel product = new ProductModel();

				product.setProductId(rs.getInt("productId"));
				product.setProductName(rs.getString("productName"));
				product.setDepiction(rs.getString("depiction"));
				product.setDetail(rs.getString("detail"));
				product.setProductPrice(rs.getInt("productPrice"));
				product.setCategoryId(rs.getInt("categoryId"));
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
	public List<ProductModel> getTop10ProductOfSeller(int sellerId) {
		
		String sql = "select TOP 10 * from Product where sellerId = ? order by productId desc";
		List<ProductModel> products = new ArrayList<ProductModel>();
		try {
			conn = super.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, sellerId);
			rs = ps.executeQuery();
			while (rs.next()) {
				ProductModel product = new ProductModel();

				product.setProductId(rs.getInt("productId"));
				product.setProductName(rs.getString("productName"));
				product.setDepiction(rs.getString("depiction"));
				product.setDetail(rs.getString("detail"));
				product.setProductPrice(rs.getInt("productPrice"));
				product.setCategoryId(rs.getInt("categoryId"));
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
	public List<ProductModel> loadMore10ProductOfSeler(int userId, int amount) {
		// TODO Auto-generated method stub
		String sql = "SELECT * from Product where sellerId = ? order by productId desc OFFSET ? ROW fetch next 10 rows only";
		List<ProductModel> products = new ArrayList<ProductModel>();
		try {
			conn = super.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, userId);
			ps.setInt(2, amount);
			rs = ps.executeQuery();
			while (rs.next()) {
				ProductModel product = new ProductModel();

				product.setProductId(rs.getInt("productId"));
				product.setProductName(rs.getString("productName"));
				product.setDepiction(rs.getString("depiction"));
				product.setDetail(rs.getString("detail"));
				product.setProductPrice(rs.getInt("productPrice"));
				product.setCategoryId(rs.getInt("categoryId"));
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
	public List<ProductModel> loadMore10ProductByCategoryId(int categoryId, int amount) {
		// TODO Auto-generated method stub
		String sql = "SELECT * from Product where categoryId = ? order by productId desc OFFSET ? ROW fetch next 10 rows only";
		List<ProductModel> products = new ArrayList<ProductModel>();
		try {
			conn = super.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, categoryId);
			ps.setInt(2, amount);
			rs = ps.executeQuery();
			while (rs.next()) {
				ProductModel product = new ProductModel();

				product.setProductId(rs.getInt("productId"));
				product.setProductName(rs.getString("productName"));
				product.setDepiction(rs.getString("depiction"));
				product.setDetail(rs.getString("detail"));
				product.setProductPrice(rs.getInt("productPrice"));
				product.setCategoryId(rs.getInt("categoryId"));
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
	public List<ProductModel> loadMore10Product(int amount) {
		// TODO Auto-generated method stub
		String sql = "SELECT * from Product order by productId desc OFFSET ? ROW fetch next 10 rows only";
		List<ProductModel> products = new ArrayList<ProductModel>();
		try {
			conn = super.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, amount);
			rs = ps.executeQuery();
			
			while (rs.next()) {
				ProductModel product = new ProductModel();

				product.setProductId(rs.getInt("productId"));
				product.setProductName(rs.getString("productName"));
				product.setDepiction(rs.getString("depiction"));
				product.setDetail(rs.getString("detail"));
				product.setProductPrice(rs.getInt("productPrice"));
				product.setCategoryId(rs.getInt("categoryId"));
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
	public List<ProductModel> loadMore10ProductOfSeller(int sellerId, int amount) {
		// TODO Auto-generated method stub
		String sql = "SELECT * from Product where sellerId = ? order by productId desc OFFSET ? ROW fetch next 10 rows only";
		List<ProductModel> products = new ArrayList<ProductModel>();
		try {
			conn = super.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, sellerId);
			ps.setInt(2, amount);
			rs = ps.executeQuery();
			while (rs.next()) {
				ProductModel product = new ProductModel();

				product.setProductId(rs.getInt("productId"));
				product.setProductName(rs.getString("productName"));
				product.setDepiction(rs.getString("depiction"));
				product.setDetail(rs.getString("detail"));
				product.setProductPrice(rs.getInt("productPrice"));
				product.setCategoryId(rs.getInt("categoryId"));
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
	public List<ProductModel> loadMore10ProductOfSellerByCategory(int cateId, int sellerId, int amount) {
		
		String sql = "select * from Product where categoryId = ? and sellerId = ? order by productId desc OFFSET ? ROW fetch next 10 rows only";
		List<ProductModel> products = new ArrayList<ProductModel>();
		try {
			conn = super.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, cateId);
			ps.setInt(2, sellerId);
			ps.setInt(3, amount);
			rs = ps.executeQuery();

			while (rs.next()) {
				ProductModel product = new ProductModel();

				product.setProductId(rs.getInt("productId"));
				product.setProductName(rs.getString("productName"));
				product.setDepiction(rs.getString("depiction"));
				product.setDetail(rs.getString("detail"));
				product.setProductPrice(rs.getInt("productPrice"));
				product.setCategoryId(rs.getInt("categoryId"));
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
	public List<ProductModel> getTop10ProductOfSellerByCategoryId(int cateId, int sellerId) {
		// TODO Auto-generated method stub
		String sql = "select * from Product where categoryId = ? and sellerId = ? ";
		List<ProductModel> products = new ArrayList<ProductModel>();
		try {
			conn = super.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, cateId);
			ps.setInt(2, sellerId);
			rs = ps.executeQuery();

			while (rs.next()) {
				ProductModel product = new ProductModel();

				product.setProductId(rs.getInt("productId"));
				product.setProductName(rs.getString("productName"));
				product.setDepiction(rs.getString("depiction"));
				product.setDetail(rs.getString("detail"));
				product.setProductPrice(rs.getInt("productPrice"));
				product.setCategoryId(rs.getInt("categoryId"));
				product.setSellerId(rs.getInt("sellerId"));
				products.add(product);

			}

			return products;
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return null;
	}

}
