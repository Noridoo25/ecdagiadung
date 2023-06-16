package mypack.Impl;

import java.util.List;

import mypack.DAO.IReportDAO;
import mypack.model.ReportAdminModel;
import mypack.model.ReportSellerModel;
import mypack.services.IReportService;

public class ReportServiceImpl implements IReportService{

	IReportDAO reportDAO = new ReportDAOImpl();
	@Override
	public List<ReportSellerModel> listReportByDateOfSeller(int sellerId, String date) {
		
		return reportDAO.listReportByDateOfSeller(sellerId, date);
	}
	@Override
	public List<ReportSellerModel> listReportByDateOfSellerForDays(int sellerId, String fromdate, String todate) {
		 return reportDAO.listReportByDateOfSellerForDays(sellerId, fromdate, todate);
	}
	@Override
	public List<ReportAdminModel> listReportAdminByDate(String date) {
		return reportDAO.listReportAdminByDate(date);
	}
	
	@Override
	public List<ReportAdminModel> listReportAdminForDays(String fromdate, String todate) {
		return reportDAO.listReportAdminForDays(fromdate, todate);
	}
	

}
