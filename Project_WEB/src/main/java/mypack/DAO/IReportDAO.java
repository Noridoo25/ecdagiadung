package mypack.DAO;

import java.sql.Date;
import java.util.List;

import mypack.model.ReportAdminModel;
import mypack.model.ReportSellerModel;

public interface IReportDAO {

	List<ReportSellerModel> listReportByDateOfSeller(int sellerId, String date);
	List<ReportSellerModel> listReportByDateOfSellerForDays(int sellerId, String fromdate, String todate );
	
	List<ReportAdminModel> listReportAdminByDate(String date);
	List<ReportAdminModel> listReportAdminForDays(String fromdate, String todate);
}
