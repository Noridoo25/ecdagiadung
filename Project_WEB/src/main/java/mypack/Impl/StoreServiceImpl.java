package mypack.Impl;

import java.util.List;


import mypack.DAO.IStoreDAO;

import mypack.model.StoreModel;
import mypack.services.IStoreService;

public class StoreServiceImpl implements IStoreService{

	IStoreDAO storeDAO = new StoreDAOImpl();
	
	@Override
	public boolean insert(StoreModel store) {
		return storeDAO.insert(store);
		
	}
	@Override
	public void delete(int storeid) {
		
	}

	@Override
	public StoreModel get(int id) {
		return storeDAO.get(id);
	}

	@Override
	public StoreModel getStoreOfSeller(int userId) {
		
		return storeDAO.getStoreOfSeller(userId);
	}

	@Override
	public StoreModel getImageShop(int userId) {
		
		return storeDAO.getImageShop(userId);
	}

	@Override
	public List<StoreModel> getListSeller() {
		
		return storeDAO.getListSeller();
	}

	@Override
	public StoreModel listStoreForKey(String key, int userId) {
		
		return storeDAO.listStoreForKey(key, userId);
	}

	@Override
	public List<StoreModel> listStoreForKey(String key) {
		
		return storeDAO.listStoreForKey(key);
	}

	@Override
	public boolean checkEmailStore(String email) {
		return storeDAO.checkEmailStore(email);
	}

	@Override
	public boolean checkPhoneStore(String phone) {
		return storeDAO.checkPhoneStore(phone);
	}

	@Override
	public StoreModel getLastId() {
		
		return storeDAO.getLastId();
	}

	@Override
	public boolean checkEmailStoreEdit(String email, int sellerId) {
		return storeDAO.checkEmailStoreEdit(email, sellerId);
	}

	@Override
	public boolean checkPhoneStoreEdit(String phone, int sellerId) {
		return storeDAO.checkPhoneStoreEdit(phone, sellerId);
	}



	@Override
	public boolean edit(StoreModel store) {
		return storeDAO.edit(store);
	}
	@Override
	public boolean checkStoreName(String storeName) {
		return storeDAO.checkStoreName(storeName);
	}
	@Override
	public boolean checkStoreNameEdit(String storeName, int sellerId) {
		return storeDAO.checkStoreNameEdit(storeName, sellerId);
	}

	

}
