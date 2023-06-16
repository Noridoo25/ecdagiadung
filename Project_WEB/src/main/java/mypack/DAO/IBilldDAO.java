package mypack.DAO;


import mypack.model.BillModel;

public interface IBilldDAO {
	BillModel getBillByCartId(int cartId);
	BillModel getLastId();
}
