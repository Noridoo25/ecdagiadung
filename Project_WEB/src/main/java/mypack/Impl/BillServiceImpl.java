package mypack.Impl;


import mypack.DAO.IBilldDAO;
import mypack.model.BillModel;
import mypack.services.IBilldService;

public class BillServiceImpl implements IBilldService{

	IBilldDAO billDAO = new BillDAOImpl();
	@Override
	public BillModel getBillByCartId(int cartId) {
		
		return billDAO.getBillByCartId(cartId);
	}
	@Override
	public BillModel getLastId() {
		
		return billDAO.getLastId();
	}

}
