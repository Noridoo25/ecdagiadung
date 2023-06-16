package Seller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mypack.Impl.ReportServiceImpl;
import mypack.model.ReportSellerModel;
import mypack.services.IReportService;

@WebServlet("/ReportForDaysController")
public class ReportForDaysController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	IReportService reportService = new ReportServiceImpl();
	String userId = null;
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		userId = request.getParameter("id");
		request.getRequestDispatcher("/views/seller/reportfordays.jsp").forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userId = request.getParameter("id");
		String fromdate = request.getParameter("FromDate");
		String todate = request.getParameter("ToDate");

		List<ReportSellerModel> listReports = reportService.listReportByDateOfSellerForDays(Integer.parseInt(userId), fromdate, todate);
	
//		System.out.println(fromdate);
//		System.out.println(todate);
		request.setAttribute("listReports", listReports);
		request.getRequestDispatcher("/views/seller/reportdaily.jsp").forward(request, response);
	}

}
