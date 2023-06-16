package mypack.DAO;

import java.util.List;

import mypack.model.StoreModel;

public interface IStoreDAO {
	
	boolean insert(StoreModel store);
	boolean edit(StoreModel store);
	void delete(int storeid);
	
	StoreModel get(int id);
	StoreModel getStoreOfSeller(int userId);
	StoreModel getImageShop(int userId);
	List<StoreModel> getListSeller();
	boolean checkStoreName(String storeName);
	boolean checkEmailStore(String email);
	boolean checkPhoneStore(String phone);
	boolean checkStoreNameEdit(String storeName, int sellerId);
	boolean checkEmailStoreEdit(String email, int sellerId);
	boolean checkPhoneStoreEdit(String phone, int sellerId);
	StoreModel listStoreForKey(String key, int userId);
	
	List<StoreModel> listStoreForKey(String key);

	StoreModel getLastId();
	
	
}
