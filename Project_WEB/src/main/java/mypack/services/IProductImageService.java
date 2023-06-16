package mypack.services;

import java.util.List;

import mypack.model.ProductImageModel;
import mypack.model.ProductModel;

public interface IProductImageService {
	
	//home.jsp
	List<ProductImageModel> lastestProduct();
	void edit(ProductImageModel product);
	List<ProductImageModel> exclusiveProduct();
	void insert(ProductImageModel porductImages);
	void delete(int productId);
	void deleteImage(int productId,String productImage);
	ProductImageModel getImagesOfProduct(int productId);
	List<ProductImageModel> getAllImagesOfProduct(int productId);
}
