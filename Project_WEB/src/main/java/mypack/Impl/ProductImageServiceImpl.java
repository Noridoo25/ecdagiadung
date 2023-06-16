package mypack.Impl;

import java.util.List;

import mypack.DAO.IProductImageDAO;
import mypack.model.ProductImageModel;
import mypack.services.IProductImageService;

public class ProductImageServiceImpl implements IProductImageService {

	IProductImageDAO productImageDAO = new ProductImageDAOImpl();
	@Override
	public List<ProductImageModel> lastestProduct() {
		return productImageDAO.lastestProduct();
	}
	
	@Override
	public List<ProductImageModel> exclusiveProduct() {
		return productImageDAO.exclusiveProduct();
	}

	@Override
	public void insert(ProductImageModel porductImages) {
		
		productImageDAO.insert(porductImages);
	}

	
	public ProductImageModel getImagesOfProduct(int productId) {
		
		return productImageDAO.getImagesOfProduct(productId);
	}

	@Override
	public void edit(ProductImageModel product) {
		
		productImageDAO.edit(product);
	}

	@Override
	public void delete(int productId) {
		
		productImageDAO.delete(productId);
	}

	@Override
	public List<ProductImageModel> getAllImagesOfProduct(int productId) {
		
		return productImageDAO.getAllImagesOfProduct(productId);
	}

	@Override
	public void deleteImage(int productId, String productImage) {
		
		productImageDAO.deleteImage(productId, productImage);
	}
	
}
