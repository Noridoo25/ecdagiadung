package mypack.model;



public class CommentModel {
	private int commentId;
	private int userId;
	private int productId;
	
	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	private String content;
	private String time;
	private int rating;
	
	public UserAccountModel user;

	public CommentModel() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CommentModel(int commentId, int userId,int productId, String content, String time, int rating, UserAccountModel user) {
		super();
		this.commentId = commentId;
		this.userId = userId;
		this.productId = productId;
		this.content = content;
		this.time = time;
		this.rating = rating;
		this.user = user;
	}

	public int getCommentId() {
		return commentId;
	}

	public void setCommentId(int commentId) {
		this.commentId = commentId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public UserAccountModel getUser() {
		return user;
	}

	public void setUser(UserAccountModel user) {
		this.user = user;
	} 
	
}
