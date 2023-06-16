package mypack.services;

import java.util.List;


import mypack.model.StoreModel;


public interface IStoreService {
	boolean insert(StoreModel store);
	void delete(int storeid);
	
	StoreModel get(int id);
	StoreModel getStoreOfSeller(int userId);
	StoreModel getImageShop(int userId);
	List<StoreModel> getListSeller();
	boolean checkEmailStore(String email);
	boolean checkPhoneStore(String phone);
	StoreModel listStoreForKey(String key, int userId);
	List<StoreModel> listStoreForKey(String key);
	boolean checkEmailStoreEdit(String email, int sellerId);
	boolean checkPhoneStoreEdit(String phone, int sellerId);
	boolean edit(StoreModel store);
	StoreModel getLastId();
	
	boolean checkStoreName(String storeName);
	boolean checkStoreNameEdit(String storeName, int sellerId);
}
