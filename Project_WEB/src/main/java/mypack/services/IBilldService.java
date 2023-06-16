package mypack.services;



import mypack.model.BillModel;

public interface IBilldService {
	BillModel getBillByCartId(int cartId);
	BillModel getLastId();
}
