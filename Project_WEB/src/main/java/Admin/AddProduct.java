package Admin;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Path;
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


@WebServlet("/admin/AddProduct")
@MultipartConfig
public class AddProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;

    IProductService products = new ProductServiceImpl();
    ICategoryService cates = new CategoryServiceImpl();
    IProductImageService productImages = new ProductImageServiceImpl();
    String userId = "";
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		List<CategoryModel> cate = cates.getAll();
		request.setAttribute("cates", cate);
		userId = request.getParameter("userId");
		request.getRequestDispatcher("/views/admin/addProduct.jsp").forward(request, response);
	}


	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String proName = request.getParameter("productName");
		String productDescription = request.getParameter("productDescription");
		Integer categoryId = Integer.parseInt(request.getParameter("categoryId"));
		String detail = request.getParameter("detail");
		Integer productPrice = Integer.parseInt(request.getParameter("productPrice"));
		
		
		Part file = request.getPart("productImage");
		
		String productImage =file.getSubmittedFileName();
		
//		String upLoadPath = "D:/project_ltw/Project_WEB/src/main/webapp/images/"+categoryId;
		String upLoadPath = "D:/HKI 2022-2023/Web/project_ltw/Project_WEB/src/main/webapp/images/" +categoryId;

		File fileSaveDir = new File(upLoadPath);
		if (!fileSaveDir.exists()) {
            fileSaveDir.mkdirs();
        }
		
		File fileImage = new File(upLoadPath +"/" + productImage);
		if(!fileImage.exists()) {
			file.write(upLoadPath +"/" + productImage);
		}
		
		
		ProductModel product = new ProductModel();
		product.setProductName(proName);
		product.setProductPrice(productPrice);
		product.setDepiction(productDescription);
		product.setDetail(detail);
		product.setCategoryId(categoryId);

		product.setSellerId(Integer.parseInt(userId));
		try {
			products.inset(product);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		ProductModel productId = products.getLastId();
		
		ProductImageModel productImg = new ProductImageModel();
		productImg.setProductId(productId.getProductId());
		productImg.setProductImage(productImage);
		productImages.insert(productImg);
		
		response.sendRedirect(request.getContextPath()+"/admin/ListProductAndCategory?userId="+userId);
	}

}
