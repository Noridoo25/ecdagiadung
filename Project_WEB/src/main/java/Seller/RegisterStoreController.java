package Seller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import mypack.Impl.StoreServiceImpl;
import mypack.Impl.UserServiceImpl;
import mypack.model.StoreModel;
import mypack.services.IStoreService;
import mypack.services.IUserService;

@MultipartConfig()
@WebServlet(urlPatterns = {"/RegisterStoreController"})
public class RegisterStoreController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	String userid = null;
	IStoreService storeService = new StoreServiceImpl();
	IUserService user = new UserServiceImpl();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		userid = req.getParameter("userId"); 
		req.getRequestDispatcher("/views/seller/register_store.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		resp.setCharacterEncoding("UTF-8");
		req.setCharacterEncoding("UTF-8");
		
		try {
			String name = req.getParameter("storeName");
			String email = req.getParameter("email");
			String phone = req.getParameter("phone");
			String city = req.getParameter("city");
			String provin = req.getParameter("provin");
			String ward = req.getParameter("ward"); 
			int iowerid = Integer.parseInt(userid);
			 
			
	
			Part partAvartar = req.getPart("avartarStore");
			Part partBanner = req.getPart("bannerStore");
			String BannerImage = partBanner.getSubmittedFileName();
			String AvartarImage = partAvartar.getSubmittedFileName();
	
			String upLoadPath = "D:/HKI 2022-2023/Web/project_ltw/Project_WEB/src/main/webapp/images/AvatarShop/";
			String upLoadPathBanner = "D:/HKI 2022-2023/Web/project_ltw/Project_WEB/src/main/webapp/images/BannerShop/";
			
//			String upLoadPath = "E:/Downloads/project_ltw/Project_WEB/src/main/webapp/images/AvatarShop/";
//			String upLoadPathBanner = "E:/Downloads/project_ltw/Project_WEB/src/main/webapp/images/BannerShop/";

			File fileSaveDir = new File(upLoadPath);
			if (!fileSaveDir.exists()) {
	            fileSaveDir.mkdirs();
	        }
			File fileImage = new File(upLoadPath +"/" + AvartarImage);
			if(!fileImage.exists()) {
				partAvartar.write(upLoadPath +"/" + AvartarImage);
			}
			
			
			
			File fileSaveDirBanner = new File(upLoadPathBanner);
			if (!fileSaveDirBanner.exists()) {
				fileSaveDirBanner.mkdirs();
	        }
			File fileImageBanner = new File(upLoadPathBanner +"/" + BannerImage);
			if(!fileImageBanner.exists()) {
				partBanner.write(upLoadPathBanner +"/" + BannerImage);
			}
			
			StoreModel store = new StoreModel();
			
		
			
			store.setStoreName(name);
			store.setEmail(email);
			store.setPhone(phone);
			store.setCity(city);
			store.setProvin(provin);
			store.setWard(ward);
			store.setAvartarStore(AvartarImage);
			store.setBannerStore(BannerImage);
			store.setUserId(iowerid);

			
			String alertMsg = "";
			if(storeService.checkStoreName(name)) {
				alertMsg = "Store Name existed!";
				req.setAttribute("alert", alertMsg);
				req.getRequestDispatcher("/views/seller/register_store.jsp").forward(req, resp);
				return;
			}
			if(storeService.checkEmailStore(email)) {
				alertMsg = "Email existed!";
				req.setAttribute("alert", alertMsg);
				req.getRequestDispatcher("/views/seller/register_store.jsp").forward(req, resp);
				return;
			}
			if(storeService.checkPhoneStore(phone)) {
				alertMsg = "Phone existed!";
				req.setAttribute("alert", alertMsg);
				req.getRequestDispatcher("/views/seller/register_store.jsp").forward(req, resp);
				return;
			}
			try {
				if(storeService.insert(store))
				{
					StoreModel storeId = storeService.getLastId();
					StoreModel stores = storeService.get(storeId.getStoreId());
					user.updateRole(stores.getUserId());
					alertMsg = "Create Store Successfully!";
					req.setAttribute("alert", alertMsg);
					req.getRequestDispatcher("/views/seller/register_store.jsp").forward(req, resp);
				}
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
//			else {
//				alertMsg = "Error!";
//				req.setAttribute("alert", alertMsg);
//				req.getRequestDispatcher("/views/seller/register_store.jsp").forward(req, resp);
//			}
		} 
		catch (Exception e)
		{
			System.out.println(e.getMessage());
		}
		req.getRequestDispatcher("/views/seller/register_store.jsp").forward(req, resp);
	}

}
