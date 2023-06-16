package mypack.Impl;

import java.util.List;

import mypack.DAO.IProductDAO;

import mypack.model.ProductModel;
import mypack.services.IProductService;

public class ProductServiceImpl implements IProductService {

	IProductDAO productDAO = new ProductDAOImpl();

	@Override
	public List<ProductModel> latestProduct() {
		return productDAO.latestProduct();
	}

	@Override
	public void inset(ProductModel product) {
		productDAO.inset(product);
	}

	@Override
	public ProductModel getIdByProductName(String productName) {
		return productDAO.getIdByProductName(productName);
	}

	@Override
	public ProductModel getLastId() {
		return productDAO.getLastId();
	}

	@Override
	public List<ProductModel> getAll() {
		return productDAO.getAll();
	}

	@Override
	public void edit(ProductModel product, int productId) {
		productDAO.edit(product, productId);
	}

	@Override
	public void delete(int productId) {
		productDAO.delete(productId);
	}

	@Override
	public void resetProductId(int productId) {
		productDAO.resetProductId(productId);
	}

	@Override
	public List<ProductModel> getAllProductByCategoryId(int cateId ,String Sort, String type) {
		return productDAO.getAllProductByCategoryId(cateId, Sort, type);
	}

	@Override
	public List<ProductModel> getAllRelateProductByCategoryId(int cateId,String productName) {
		return productDAO.getAllRelateProductByCategoryId(cateId, productName);
	}

	@Override
	public List<ProductModel> getNext6ProductFilter(int cateId, String Sort,String type,int index) {
		return productDAO.getNext6ProductFilter(cateId, Sort, type, index);
	}

	@Override
	public List<ProductModel> getNext6Product(int index) {
		return productDAO.getNext6Product(index);
	}

	@Override
	public List<ProductModel> getTop6Product() {
		return productDAO.getTop6Product();
	}

	@Override
	public List<ProductModel> get6ProductByCategoryId(int cateId, String Sort, String type) {
		return productDAO.get6ProductByCategoryId(cateId, Sort, type);
	}

	@Override
	public List<ProductModel> searchProduct(String productName) {
		return productDAO.searchProduct(productName);
	}

	@Override
	public List<ProductModel> searchTop6Product(String productName) {
		return productDAO.searchTop6Product(productName);
	}

	@Override
	public List<ProductModel> getNext6ProductSearch(int indext, String productName) {
		return productDAO.getNext6ProductSearch(indext, productName);
	}

	@Override
	public List<ProductModel> getAllSeller(int userId) {
		return productDAO.getAllSeller(userId);
	}

	@Override
	public List<ProductModel> getTop6ProductSeller(int userId) {
		return productDAO.getTop6ProductSeller(userId);
	}

	@Override
	public ProductModel getProductById(int productId) {
		return productDAO.getProductById(productId);
	}

	@Override
	public List<ProductModel> searchProductOfSeller(int sellerId, String productName) {
		return productDAO.searchProductOfSeller(sellerId, productName);
	}

	@Override
	public List<ProductModel> getAllProductOfSellerByCategory(int cateId, int sellerId) {
		return productDAO.getAllProductOfSellerByCategory(cateId, sellerId);
	}

	@Override
	public List<ProductModel> getAllProductByCategoryId(int categoryId) {
		return productDAO.getAllProductByCategoryId(categoryId);
	}

	@Override
	public int numberProductOfStore(int sellerId) {
		return productDAO.numberProductOfStore(sellerId);
	}

	@Override
	public List<ProductModel> getAllProductByCategoryIdOfSeller(int cateId, String Sort, String type, int sellerId) {
		
		return productDAO.getAllProductByCategoryIdOfSeller(cateId, Sort, type, sellerId);
	}

	@Override
	public List<ProductModel> get6ProductByCategoryIdOfSeller(int cateId, String Sort, String type, int sellerId) {
		
		return productDAO.get6ProductByCategoryIdOfSeller(cateId, Sort, type, sellerId);
	}

	@Override
	public List<ProductModel> getNext6ProductFilterOfSeller(int cateId, String Sort, String type, int index,
			int sellerId) {
		
		return productDAO.getNext6ProductFilterOfSeller(cateId, Sort, type, index, sellerId);
	}

	@Override
	public List<ProductModel> getNext6ProductOfSeller(int index, int sellerId) {
		
		return productDAO.getNext6ProductOfSeller(index, sellerId);
	}

	@Override
	public List<ProductModel> loadMore6ProductSearch(int amount, String key) {
		
		return productDAO.loadMore6ProductSearch(amount, key);
	}

	@Override
	public List<ProductModel> getTop10ProductOfSeler(int userId) {
		return productDAO.getTop10ProductOfSeler(userId);
	}

	@Override
	public List<ProductModel> getTop10ProductByCategoryId(int categoryId) {
		return productDAO.getTop10ProductByCategoryId(categoryId);
	}

	@Override
	public List<ProductModel> getTop10Product() {
		return productDAO.getTop10Product();
	}

	@Override
	public List<ProductModel> getTop10ProductOfSeller(int sellerId) {
		return productDAO.getTop10ProductOfSeller(sellerId);
	}

	@Override
	public List<ProductModel> loadMore10ProductOfSeler(int userId, int amount) {
		// TODO Auto-generated method stub
		return productDAO.loadMore10ProductOfSeler(userId, amount);
	}

	@Override
	public List<ProductModel> loadMore10ProductByCategoryId(int categoryId,int amount) {
		// TODO Auto-generated method stub
		return productDAO.loadMore10ProductByCategoryId(categoryId, amount);
	}

	@Override
	public List<ProductModel> loadMore10Product(int amount) {
		// TODO Auto-generated method stub
		return productDAO.loadMore10Product(amount);
	}

	@Override
	public List<ProductModel> loadMore10ProductOfSeller(int sellerId,int amount) {
		// TODO Auto-generated method stub
		return productDAO.loadMore10ProductOfSeller(sellerId,amount);
	}

	@Override
	public List<ProductModel> loadMore10ProductOfSellerByCategory(int cateId, int sellerId, int amount) {
		// TODO Auto-generated method stub
		return productDAO.loadMore10ProductOfSellerByCategory(cateId, sellerId, amount);
	}

	@Override
	public List<ProductModel> getTop10ProductOfSellerByCategoryId(int cateId, int sellerId) {
		// TODO Auto-generated method stub
		return productDAO.getTop10ProductOfSellerByCategoryId(cateId, sellerId);
	}

}
