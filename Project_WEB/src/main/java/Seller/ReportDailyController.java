package Seller;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mypack.Impl.BillServiceImpl;
import mypack.Impl.CartServiceImpl;
import mypack.Impl.OrderServiceImpl;
import mypack.Impl.ProductImageServiceImpl;
import mypack.Impl.ProductServiceImpl;
import mypack.Impl.ReportServiceImpl;
import mypack.model.BillModel;
import mypack.model.ProductInCartModel;
import mypack.model.OrderModel;
import mypack.model.ProductImageModel;
import mypack.model.ProductModel;
import mypack.model.ReportSellerModel;
import mypack.services.IBilldService;
import mypack.services.ICartService;
import mypack.services.IOrderService;
import mypack.services.IProductImageService;
import mypack.services.IProductService;
import mypack.services.IReportService;

@WebServlet("/ReportDailyController")
public class ReportDailyController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	IReportService reportService = new ReportServiceImpl();
	String userId = null;
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		userId = request.getParameter("id");
		request.getRequestDispatcher("/views/seller/reportdaily.jsp").forward(request, response);
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String date = request.getParameter("date");

		List<ReportSellerModel> listReports = reportService.listReportByDateOfSeller(Integer.parseInt(userId), date);
	
		
		request.setAttribute("listReports", listReports);
		request.getRequestDispatcher("/views/seller/reportdaily.jsp").forward(request, response);
	}

}
