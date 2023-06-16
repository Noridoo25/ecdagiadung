package mypack.model;

public class StoreModel {

	private int storeId;
	private String storeName;
	private String email;
	private String phone;
	private String city;
	private String provin;
	private String ward;
	private String avartarStore;
	private String bannerStore;
	private int userId;
	private int numberRating;
	private int numberProduct;
	
	public UserAccountModel userAccount;
	
	public StoreModel() {
		super();
		// TODO Auto-generated constructor stub
	}

	public StoreModel(int storeId, String storeName, String email, String phone, String city, String provin,
			String ward, String avartarStore, String bannerStore, int owerId,
			UserAccountModel userAccount, int numberRating, int numberProduct) {
		super();
		this.storeId = storeId;
		this.storeName = storeName;
		this.email = email;
		this.phone = phone;
		this.city = city;
		this.provin = provin;
		this.ward = ward;
		this.avartarStore = avartarStore;
		this.bannerStore = bannerStore;
		this.userId = owerId;
		this.userAccount = userAccount;
		this.numberProduct = numberProduct;
		this.numberRating = numberRating;
	}
	
	public StoreModel(String storeName, String email, String phone, String city, String provin,
			String ward, String avartarStore, String bannerStore, int owerId) {
		super();
		this.storeName = storeName;
		this.email = email;
		this.phone = phone;
		this.city = city;
		this.provin = provin;
		this.ward = ward;
		this.avartarStore = avartarStore;
		this.bannerStore = bannerStore;
		this.userId = owerId;
	}

	public int getStoreId() {
		return storeId;
	}

	public void setStoreId(int storeId) {
		this.storeId = storeId;
	}

	public String getStoreName() {
		return storeName;
	}

	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getProvin() {
		return provin;
	}

	public void setProvin(String provin) {
		this.provin = provin;
	}

	public String getWard() {
		return ward;
	}

	public void setWard(String ward) {
		this.ward = ward;
	}

	public String getAvartarStore() {
		return avartarStore;
	}

	public void setAvartarStore(String avartarStore) {
		this.avartarStore = avartarStore;
	}

	public String getBannerStore() {
		return bannerStore;
	}

	public void setBannerStore(String bannerStore) {
		this.bannerStore = bannerStore;
	}

	

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public UserAccountModel getUserAccount() {
		return userAccount;
	}

	public void setUserAccount(UserAccountModel userAccount) {
		this.userAccount = userAccount;
	}

	public int getNumberRating() {
		return numberRating;
	}

	public void setNumberRating(int numberRating) {
		this.numberRating = numberRating;
	}

	public int getNumberProduct() {
		return numberProduct;
	}

	public void setNumberProduct(int numberProduct) {
		this.numberProduct = numberProduct;
	}


}
