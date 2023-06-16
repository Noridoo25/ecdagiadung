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

@WebServlet("/admin/ControllerReportForDays")
public class ReportForDaysControllerAdmin extends HttpServlet{


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
		String time1 =  ft.format(dateOld);
		reports(time,time1, request, response);
		request.getRequestDispatcher("/views/admin/reportfordays.jsp").forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String fromdate = request.getParameter("FromDate");
		String todate = request.getParameter("ToDate");
		UserAccountModel user = users.get(Integer.parseInt(userId));
		List<ReportSellerModel> listReports = new ArrayList<>();
		List<ReportAdminModel> listRreportsAdmin = new ArrayList<>();
		if(user.getRoleId() == 1) {
			listRreportsAdmin = reportService.listReportAdminForDays(fromdate, todate);
			request.setAttribute("listReports", listRreportsAdmin);
		}
		else {
			listReports = reportService.listReportByDateOfSellerForDays(Integer.parseInt(userId),fromdate, todate);
			request.setAttribute("listReports", listReports);
		}
		reports(todate,fromdate, request, response);
	
		
		
		request.getRequestDispatcher("/views/admin/reportfordays.jsp").forward(request, response);
	}
protected void reports(String time,String time1, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		UserAccountModel user = users.get(Integer.parseInt(userId));
		List<ReportSellerModel> listReportForDay = new ArrayList<>();
		
		List<ReportAdminModel> listReportAdminForDay = new ArrayList<>();
		
		
		ArrayList<String> productOfForDay = new ArrayList<String>();
		ArrayList<String> TotalProductOfForDay = new ArrayList<String>();
		
		
		
		if(user.getRoleId() == 1) {
			listReportAdminForDay = reportService.listReportAdminForDays(time1, time);
			
			for(ReportAdminModel r:listReportAdminForDay) {
				productOfForDay.add(r.getStoreName());
				TotalProductOfForDay.add(Integer.toString(r.getTotal()) );
			}
			
			
		}
		else {
			listReportForDay = reportService.listReportByDateOfSellerForDays(Integer.parseInt(userId),time1,time );
			
			for(ReportSellerModel r:listReportForDay) {
				productOfForDay.add(r.getProductName());
				TotalProductOfForDay.add(Integer.toString(r.getTotal()) );
			}
			
		}
		int Page = 2;
		request.setAttribute("Page", Page);
		request.setAttribute("user", user);
		request.setAttribute("u", user.getUserId());
		request.setAttribute("productOfForDay", productOfForDay);
		request.setAttribute("TotalProductOfForDay", TotalProductOfForDay);
	}
}
