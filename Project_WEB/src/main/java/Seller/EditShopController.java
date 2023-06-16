package Seller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import mypack.Impl.StoreServiceImpl;
import mypack.model.StoreModel;
import mypack.services.IStoreService;

@MultipartConfig()
@WebServlet("/admin/EditShop")
public class EditShopController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	IStoreService storeService = new StoreServiceImpl();
	String userId = "";
	StoreModel myStore;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		int Page = 5;
		
		userId = req.getParameter("userId");
		myStore = storeService.getStoreOfSeller(Integer.parseInt(userId));
		req.setAttribute("myStore", myStore);
		req.setAttribute("Page", Page);
		req.getRequestDispatcher("/views/seller/edit_shop.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		try {
			String name = req.getParameter("storeName");
			String email = req.getParameter("email");
			String phone = req.getParameter("phone");
			String city = req.getParameter("city");
			String provin = req.getParameter("provin");
			String ward = req.getParameter("ward"); 
			int iowerid = Integer.parseInt(userId);
			int Page = 5;
			req.setAttribute("Page", Page);
			Part partAvartar = req.getPart("avartarStore");
			Part partBanner = req.getPart("bannerStore");
			String BannerImage = partBanner.getSubmittedFileName();
			if(BannerImage.equals(""))
			{
				BannerImage = myStore.getBannerStore();
			}
			String AvartarImage = partAvartar.getSubmittedFileName();
			if(AvartarImage.equals(""))
			{
				AvartarImage = myStore.getAvartarStore();
			}
	
			
			
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
			if(storeService.checkStoreNameEdit(name, iowerid)){
				alertMsg = "Store Name existed!";
				req.setAttribute("alert", alertMsg);
				req.getRequestDispatcher("/views/seller/edit_shop.jsp").forward(req, resp);
				return;
			}
			if(storeService.checkEmailStoreEdit(email, iowerid)) {
				alertMsg = "Email existed!";
				req.setAttribute("alert", alertMsg);
				req.getRequestDispatcher("/views/seller/edit_shop.jsp").forward(req, resp);
				return;
			}
			if(storeService.checkPhoneStoreEdit(phone, iowerid)) {
				alertMsg = "Phone existed!";
				req.setAttribute("alert", alertMsg);
				req.getRequestDispatcher("/views/seller/edit_shop.jsp").forward(req, resp);
				return;
			}
			
		
		if(storeService.edit(new StoreModel(name, email, phone, city, provin, ward, AvartarImage, BannerImage, iowerid)))
			{
				alertMsg = "Edit Store Successfully!";
				myStore = storeService.getStoreOfSeller(Integer.parseInt(userId));
				req.setAttribute("myStore", myStore);
				req.setAttribute("alert", alertMsg);
				req.getRequestDispatcher("/views/seller/edit_shop.jsp").forward(req, resp);
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
	
		req.getRequestDispatcher("/views/seller/edit_shop.jsp").forward(req, resp);
	}

}
