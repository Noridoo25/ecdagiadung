package Admin;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import mypack.Impl.CategoryServiceImpl;
import mypack.Impl.ProductImageServiceImpl;
import mypack.Impl.ProductServiceImpl;
import mypack.model.CategoryModel;
import mypack.model.ProductImageModel;
import mypack.model.ProductModel;
import mypack.services.ICategoryService;
import mypack.services.IProductImageService;
import mypack.services.IProductService;


@WebServlet("/admin/EditProduct")
@MultipartConfig
public class EditProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    String productId = null;
    String userId = "";
    IProductService allproduct = new ProductServiceImpl();
    ICategoryService cates = new CategoryServiceImpl();
    IProductImageService products = new ProductImageServiceImpl();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		List<CategoryModel> cate = cates.getAll();
		request.setAttribute("cates", cate);
		productId = request.getParameter("productid");
		userId = request.getParameter("userId");
		ProductModel prod = new ProductModel();
		ProductImageModel productss = new ProductImageModel();
		ProductImageModel product = products.getImagesOfProduct(Integer.parseInt(productId));
		if(product == null) {
			prod = allproduct.getProductById(Integer.parseInt(productId));
			productss.setCategoryId(prod.getCategoryId());
			productss.setDepiction(prod.getDepiction());
			productss.setDetail(prod.getDetail());
			productss.setProductId(prod.getProductId());
			productss.setProductImage("null");
			productss.setProductName(prod.getProductName());
			productss.setProductPrice(prod.getProductPrice());
			productss.setSellerId(prod.getSellerId());
			request.setAttribute("product", productss);
			
		}
		else {
			request.setAttribute("product", product);
		}
		
		request.getRequestDispatcher("/views/admin/editProduct.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		
		String proName = request.getParameter("productName");
		String productDescription = request.getParameter("productDescription");
		
		String detail = request.getParameter("detail");
		Integer productPrice = Integer.parseInt(request.getParameter("productPrice"));
		Integer categoryId = Integer.parseInt(request.getParameter("categoryId"));
		
		Part file = request.getPart("productImage");
		
		String productImage =file.getSubmittedFileName();
		
		if(productImage!="") {
//			String upLoadPath = "D:/project_ltw/Project_WEB/src/main/webapp/images/"+categoryId;
			String upLoadPath = "D:/HKI 2022-2023/Web/project_ltw/Project_WEB/src/main/webapp/images/"+categoryId;
//			String realFile =  request.getServletContext().getRealPath(upLoadPath);
			File fileSaveDir = new File(upLoadPath);
			if (!fileSaveDir.exists()) {
	            fileSaveDir.mkdirs();
	        }
			File fileImage = new File(upLoadPath +"/" + productImage);
			if(!fileImage.exists()) {
				file.write(upLoadPath +"/" + productImage);
			}
			ProductImageModel product = products.getImagesOfProduct(Integer.parseInt(productId));
			ProductImageModel productImg = new ProductImageModel();
			productImg.setProductId(Integer.parseInt(productId));
			productImg.setProductImage(productImage);
			if(product == null) {
				products.insert(productImg);
			}
			else {
				products.edit(productImg);
			}
			
		}
		
//		Part file = request.getPart("productImage");
//		
//		String productImage = file.getSubmittedFileName();
//		
//		String upLoadPath = "D:/project_ltw/Project_WEB/src/main/webapp/images/"+categoryId+"/" + productImage;
//		try {
//			FileOutputStream fos = new FileOutputStream(upLoadPath);
//			InputStream is = file.getInputStream();
//			
//			byte[] data = new byte[is.available()];
//			is.read();
//			fos.write(data);
//			fos.close();
//		} catch (Exception e) {
//			// TODO: handle exception
//			e.printStackTrace();
//		}
		
		ProductModel product = new ProductModel();
		product.setProductName(proName);
		product.setProductPrice(productPrice);
		product.setDepiction(productDescription);
		product.setDetail(detail);
		product.setCategoryId(categoryId);
		
		allproduct.edit(product,Integer.parseInt(productId) );
		
		response.sendRedirect(request.getContextPath()+"/admin/ListProductAndCategory?userId="+userId);
	}

}
