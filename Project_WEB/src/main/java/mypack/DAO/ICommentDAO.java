package mypack.DAO;

import java.util.List;

import mypack.model.CommentModel;

public interface ICommentDAO {
	void insertComment(int userId,int productId, String content, int rating, String time);
	void editComment(int commentId, int userId,int productId, String content, int rating, String time);
	void deleteComment(int userId, int productId);
	List<CommentModel> getAllCommentOfProduct(int productId);
	List<CommentModel> getNext6CommentOfProduct(int productId, int index);
	
	int getNumberRatingOfStore(int sellerId);
}
