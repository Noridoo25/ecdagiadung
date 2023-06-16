package Admin;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.fileupload.servlet.ServletFileUpload;

import mypack.Impl.CategoryServiceImpl;
import mypack.Impl.ProductImageServiceImpl;
import mypack.model.CategoryModel;
import mypack.model.ProductImageModel;
import mypack.services.ICategoryService;
import mypack.services.IProductImageService;


@WebServlet("/admin/AddImagesProductDetail")
@MultipartConfig
public class AddImagesProductDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;

    String productId = null;
    int userId = 0;
    ICategoryService cates = new CategoryServiceImpl();
    IProductImageService productImages = new ProductImageServiceImpl();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String cateId = request.getParameter("cateId");
		CategoryModel cate = cates.getCategoryById(Integer.parseInt(cateId));
		request.setAttribute("cates", cate);
		
		productId = request.getParameter("id");
		ProductImageModel product = productImages.getImagesOfProduct(Integer.parseInt(productId));
		
		userId = product.getSellerId();
		request.setAttribute("product", product);
		request.getRequestDispatcher("/views/admin/addImagesProduct.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		Integer categoryId = Integer.parseInt(request.getParameter("categoryId"));
		
		if(ServletFileUpload.isMultipartContent(request)) {
			List<String> fileNames = new ArrayList<String>();
			try {
				List <Part> images =  (List<Part>) request.getParts();
				for(Part image : images) {
					
					if(image.getName().equalsIgnoreCase("productImage")) {
						String productImage =image.getSubmittedFileName();
						fileNames.add(productImage);
						
//						String upLoadPath = "E:/Downloads/project_ltw/Project_WEB/src/main/webapp/images/"+categoryId;
						String upLoadPath = "D:/HKI 2022-2023/Web/project_ltw/Project_WEB/src/main/webapp/images/"+categoryId;

						File fileSaveDir = new File(upLoadPath);
						if (!fileSaveDir.exists()) {
				            fileSaveDir.mkdirs();
				        }
						
						File fileImage = new File(upLoadPath +"/" + productImage);
						if(!fileImage.exists()) {
							image.write(upLoadPath +"/" + productImage);
						}
						
						ProductImageModel productImg = new ProductImageModel();
						productImg.setProductId(Integer.parseInt(productId));
						productImg.setProductImage(productImage);
						productImages.insert(productImg);		
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		response.sendRedirect(request.getContextPath()+"/admin/ListProductAndCategory?userId="+userId);
	}
}
