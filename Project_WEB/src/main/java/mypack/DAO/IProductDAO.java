package mypack.DAO;

import java.util.List;

import mypack.model.ProductModel;

public interface IProductDAO {

	List<ProductModel> latestProduct();
	
	ProductModel get(int id);
	void inset(ProductModel product);
	void edit(ProductModel product, int productId);
	ProductModel getIdByProductName(String productName);
	ProductModel getLastId();
	ProductModel getProductById(int productId);
	List<ProductModel> getAll();
	List<ProductModel> getTop6Product();
	List<ProductModel> getAllSeller(int userId);
	List<ProductModel> getTop6ProductSeller(int userId);
	void delete(int productId);
	void resetProductId(int productId);
	List<ProductModel> getAllProductByCategoryId(int cateId, String Sort,String type);
	List<ProductModel> get6ProductByCategoryId(int cateId, String Sort, String type);
	List<ProductModel> getAllRelateProductByCategoryId(int cateId, String productName);
	List<ProductModel> getNext6ProductFilter(int cateId, String Sort,String type, int index);
	List<ProductModel> getNext6Product(int index);
	List<ProductModel> searchProduct(String productName);
	List<ProductModel> searchTop6Product(String productName);
	List<ProductModel> getNext6ProductSearch(int indext, String productName);
	
	List<ProductModel> searchProductOfSeller(int sellerId, String productName);
	
	List<ProductModel> getAllProductOfSellerByCategory(int cateId, int sellerId);
	
	List<ProductModel> getAllProductByCategoryId(int categoryId);
	int numberProductOfStore(int sellerId);
//	seller
	List<ProductModel> getAllProductByCategoryIdOfSeller(int cateId, String Sort, String type, int sellerId);
	List<ProductModel> get6ProductByCategoryIdOfSeller(int cateId, String Sort, String type, int sellerId);
	List<ProductModel> getNext6ProductFilterOfSeller(int cateId, String Sort, String type, int index, int sellerId);
	List<ProductModel> getNext6ProductOfSeller(int index, int sellerId);
	
	List<ProductModel> loadMore6ProductSearch(int amount, String key);
	
	List<ProductModel> getTop10ProductOfSeler(int userId);
	
	List<ProductModel> getTop10ProductByCategoryId(int categoryId);
	
	List<ProductModel> getTop10Product();
	
	List<ProductModel> getTop10ProductOfSeller(int sellerId);
	
	List<ProductModel> loadMore10ProductOfSeler(int userId,int amount);
	List<ProductModel> loadMore10ProductByCategoryId(int categoryId,int amount);
	List<ProductModel> loadMore10Product(int amount);
	List<ProductModel> loadMore10ProductOfSeller(int sellerId,int amount);
	
	List<ProductModel> loadMore10ProductOfSellerByCategory(int cateId, int sellerId, int amount);
	List<ProductModel> getTop10ProductOfSellerByCategoryId(int cateId, int sellerId);
}
