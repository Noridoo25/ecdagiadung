package Admin;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mypack.Impl.ReportServiceImpl;
import mypack.Impl.UserServiceImpl;
import mypack.model.ReportAdminModel;
import mypack.model.ReportSellerModel;
import mypack.model.UserAccountModel;
import mypack.services.IReportService;
import mypack.services.IUserService;

@WebServlet("/admin/ControllerReportDaily")
public class ReportDailyControllerAdmin extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	IReportService reportService = new ReportServiceImpl();
	String userId = null;
	IUserService users = new UserServiceImpl();
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		userId = request.getParameter("id");
		
		LocalDateTime dnow = LocalDateTime.now();
		int year = dnow.getYear();
		int day = dnow.getDayOfMonth();
		int month = dnow.getMonthValue();
		Date date = new Date(year - 1900,month-1,day);
		Date dateOld = new Date(year - 1900,month-1,1);
		SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd");
		String time = ft.format(date);
		reports(time, request, response);
		request.setAttribute("u", userId);
		request.getRequestDispatcher("/views/admin/reportdaily.jsp").forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String date = request.getParameter("date");
		
		UserAccountModel user = users.get(Integer.parseInt(userId));
		List<ReportSellerModel> listReports = new ArrayList<>();
		List<ReportAdminModel> listRreportsAdmin = new ArrayList<>();
		if(user.getRoleId() == 1) {
			listRreportsAdmin = reportService.listReportAdminByDate(date);
			request.setAttribute("listReportss", listRreportsAdmin);
		}
		else {
			listReports = reportService.listReportByDateOfSeller(Integer.parseInt(userId),date);
			request.setAttribute("listReportss", listReports);
		}
		
		reports(date, request, response);
		
		
		request.getRequestDispatcher("/views/admin/reportdaily.jsp").forward(request, response);
	}
	protected void reports(String date, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		UserAccountModel user = users.get(Integer.parseInt(userId));
		List<ReportSellerModel> listReports = new ArrayList<>();
		
		List<ReportAdminModel> listRreportsAdmin = new ArrayList<>();
		
		
		ArrayList<String> product = new ArrayList<String>();
		ArrayList<String> AmountProduct = new ArrayList<String>();
		
		
		
		if(user.getRoleId() == 1) {
			listRreportsAdmin = reportService.listReportAdminByDate(date);
			
			for(ReportAdminModel r:listRreportsAdmin) {
				product.add(r.getStoreName());
				AmountProduct.add(Integer.toString(r.getAmount()) );
			}
			
			
		}
		else {
			listReports = reportService.listReportByDateOfSeller(Integer.parseInt(userId),date );
			
			for(ReportSellerModel r:listReports) {
				product.add(r.getProductName());
				AmountProduct.add(Integer.toString(r.getAmount()) );
			}
			
		}
		int Page = 2;
		request.setAttribute("Page", Page);
		request.setAttribute("user", user);
		request.setAttribute("u", user.getUserId());
		request.setAttribute("listReports", product);
		request.setAttribute("AmountProduct", AmountProduct);
	}
}
