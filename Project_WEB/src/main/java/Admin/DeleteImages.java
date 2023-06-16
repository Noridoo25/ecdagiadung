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


@WebServlet("/admin/DeleteImages")
public class DeleteImages extends HttpServlet {
	private static final long serialVersionUID = 1L;


    IProductImageService images = new ProductImageServiceImpl();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		images.deleteImage(Integer.parseInt(id), name);
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
