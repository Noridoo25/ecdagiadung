package Admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mypack.Impl.ProductImageServiceImpl;
import mypack.model.ProductImageModel;
import mypack.services.IProductImageService;


@WebServlet("/admin/EditListImageSingleProduct")
public class EditListImageSingleProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    String id = null;
    String cateId = null;
    IProductImageService images = new ProductImageServiceImpl();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		id = request.getParameter("id");
		cateId = request.getParameter("cateId");
		List<ProductImageModel> image = images.getAllImagesOfProduct(Integer.parseInt(id));
		request.setAttribute("image", image);
		request.getRequestDispatcher("/views/admin/listImageSingleProduct.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		doGet(request, response);
	}

}
