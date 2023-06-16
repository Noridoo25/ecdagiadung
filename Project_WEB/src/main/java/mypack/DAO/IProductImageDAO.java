package mypack.DAO;

import java.util.List;

import mypack.model.ProductImageModel;
import mypack.model.ProductModel;

public interface IProductImageDAO {
	
	//home.jsp
	List<ProductImageModel> lastestProduct();
	void edit(ProductImageModel product);
	List<ProductImageModel> exclusiveProduct();
	void insert(ProductImageModel porductImages);
	ProductImageModel getImagesOfProduct(int productId);
	void delete(int productId);
	void deleteImage(int productId,String productImage);
	List<ProductImageModel> getAllImagesOfProduct(int productId);
}
