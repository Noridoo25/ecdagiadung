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

import mypack.Impl.BillServiceImpl;
import mypack.Impl.CartServiceImpl;
import mypack.Impl.OrderServiceImpl;
import mypack.Impl.ProductImageServiceImpl;
import mypack.Impl.ProductServiceImpl;
import mypack.Impl.ReportServiceImpl;
import mypack.Impl.StoreServiceImpl;
import mypack.Impl.UserServiceImpl;
import mypack.model.BillModel;
import mypack.model.ProductInCartModel;
import mypack.model.OrderModel;
import mypack.model.ProductImageModel;
import mypack.model.ReportAdminModel;
import mypack.model.ReportSellerModel;
import mypack.model.StoreModel;
import mypack.model.UserAccountModel;
import mypack.services.IBilldService;
import mypack.services.ICartService;
import mypack.services.IOrderService;
import mypack.services.IProductImageService;
import mypack.services.IProductService;
import mypack.services.IReportService;
import mypack.services.IStoreService;
import mypack.services.IUserService;


@WebServlet("/admin/HomeAdmin")
public class HomeAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    IOrderService listOrders = new OrderServiceImpl();
    ICartService productInCart = new CartServiceImpl();
    IProductService product = new ProductServiceImpl();
    IBilldService listBill = new BillServiceImpl();
    IUserService users = new UserServiceImpl();
    IReportService reportService = new ReportServiceImpl();
    IProductImageService productImage = new ProductImageServiceImpl();
    IStoreService stores = new StoreServiceImpl();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		try {
			String userId = request.getParameter("id");
			String storeName = request.getParameter("storeName");
			
			UserAccountModel user = users.get(Integer.parseInt(userId));
			
			if(user.getRoleId() == 1) {
				storeName = "Admin";
			}

			List<StoreModel> listStore = stores.getListSeller(); //list store
			List<OrderModel> orders = listOrders.getAllOrders();
			List<OrderModel> orderOfSeller = new ArrayList<>();
			List<OrderModel> orderAllSeller = new ArrayList<>();
			
			List<ProductInCartModel> listItemOfSeller = productInCart.getListItemOfSellerByStatus(Integer.parseInt(userId), 0);

			for(OrderModel i: orders) {
				List<ProductInCartModel> listItems = productInCart.getListItemByStatus(i.getCartId(), 1);
				List<ProductInCartModel> listItemSeller = productInCart.getListItemOfSeller(Integer.parseInt(userId),i.getCartId());
				
				BillModel bill = listBill.getBillByCartId(i.getCartId());
				i.setBill(bill);
				if(user.getRoleId() != 1) {
					
//					for(ProductInCartModel c:listItemOfSeller) {
//						
//						if(i.getCartId()==c.getCartId()) {
//							
//							orderOfSeller.add(i);
//						}
//					}
					
					if(i.getStatus() == 0 && listItemSeller.size()>0) {
						i.setItems(listItemSeller);
						
						orderOfSeller.add(i);
					}
				}
				else {
					for(ProductInCartModel c:listItems) {
						ProductImageModel prod = productImage.getImagesOfProduct(c.getProductId());
						c.setProduct(prod);
					}
					if(i.getStatus() == 1) {
						i.setItems(listItems);
						orderAllSeller.add(i);
					}
				}
				
				
			}
			LocalDateTime dnow = LocalDateTime.now();
			int year = dnow.getYear();
			int day = dnow.getDayOfMonth();
			int month = dnow.getMonthValue();
			Date date = new Date(year - 1900,month-1,day);
			Date dateOld = new Date(year - 1900,month-1,1);
			SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd");
			String time = ft.format(date);
			String time1 =  ft.format(dateOld);
			List<ReportSellerModel> listReports = new ArrayList<>();
			List<ReportSellerModel> listReportForDay = new ArrayList<>();
			List<ReportAdminModel> listRreportsAdmin = new ArrayList<>();
			List<ReportAdminModel> listReportAdminForDay = new ArrayList<>();
			
			ArrayList<String> product = new ArrayList<String>();
			ArrayList<String> AmountProduct = new ArrayList<String>();
			
			
			ArrayList<String> productOfForDay = new ArrayList<String>();
			ArrayList<String> TotalProductOfForDay = new ArrayList<String>();
			
			if(user.getRoleId() == 1) {
				listRreportsAdmin = reportService.listReportAdminByDate(time);
				listReportAdminForDay = reportService.listReportAdminForDays(time1, time);
				for(ReportAdminModel r:listRreportsAdmin) {
					product.add(r.getStoreName());
					AmountProduct.add(Integer.toString(r.getAmount()) );
				}
				for(ReportAdminModel r:listReportAdminForDay) {
					productOfForDay.add(r.getStoreName());
					TotalProductOfForDay.add(Integer.toString(r.getTotal()) );
				}
				request.setAttribute("order", orderAllSeller);
			}
			else {
				listReports = reportService.listReportByDateOfSeller(Integer.parseInt(userId),time );
				listReportForDay = reportService.listReportByDateOfSellerForDays(Integer.parseInt(userId),time1,time );
				for(ReportSellerModel r:listReports) {
					product.add(r.getProductName());
					AmountProduct.add(Integer.toString(r.getAmount()) );
				}
				for(ReportSellerModel r:listReportForDay) {
					productOfForDay.add(r.getProductName());
					TotalProductOfForDay.add(Integer.toString(r.getTotal()) );
				}
				request.setAttribute("order", orderOfSeller);
			}
			int Page = 1;
			request.setAttribute("listStore", listStore);
			
			request.setAttribute("listReports", product);
			request.setAttribute("AmountProduct", AmountProduct);
			
			request.setAttribute("productOfForDay", productOfForDay);
			request.setAttribute("TotalProductOfForDay", TotalProductOfForDay);
			
			request.setAttribute("user", user);
			request.setAttribute("storeName", storeName);
			request.setAttribute("userId", userId);
			
			request.setAttribute("Page", Page);
			request.getRequestDispatcher("/views/admin/home.jsp").forward(request, response);
		} catch (Exception e) {
		
			e.printStackTrace();
			
		}
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String cartId = request.getParameter("cartId");
		int icartId = Integer.parseInt(cartId);
		String status = request.getParameter("status");
		int istatus = Integer.parseInt(status);
		if(cartId!=null && status!=null) {
			productInCart.updateStatus(icartId, istatus);
			listOrders.updateOrder(icartId, istatus);
		}
		
	}

}
