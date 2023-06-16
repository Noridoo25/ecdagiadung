package mypack.services;

import java.util.List;

import mypack.model.CommentModel;

public interface ICommentService {
	void insertComment(int userId,int productId, String content, int rating, String time);
	void editComment(int commentId,int userId,int productId, String content, int rating, String time);
	void deleteComment(int commentId, int productId);
	List<CommentModel> getAllCommentOfProduct(int productId);
	List<CommentModel> getNext6CommentOfProduct(int productId, int index);
	int getNumberRatingOfStore(int sellerId);
}
