package mypack.Impl;

import java.util.List;

import mypack.DAO.ICommentDAO;
import mypack.model.CommentModel;
import mypack.services.ICommentService;

public class CommentServiceImpl implements ICommentService{

	ICommentDAO commentDAO = new CommentDAOImpl();
	@Override
	public void insertComment(int userId,int productId, String content, int rating, String time) {
		
		commentDAO.insertComment(userId, productId, content, rating, time);
	}

	@Override
	public void editComment(int commentId,int userId, int productId, String content, int rating, String time) {
		
		commentDAO.editComment(commentId, userId, productId, content, rating, time);
	}

	@Override
	public void deleteComment(int userId, int productId) {
		
		commentDAO.deleteComment(userId, productId);
	}

	@Override
	public List<CommentModel> getAllCommentOfProduct(int productId) {
		
		return commentDAO.getAllCommentOfProduct(productId);
	}

	@Override
	public List<CommentModel> getNext6CommentOfProduct(int productId, int index) {
		
		return commentDAO.getNext6CommentOfProduct(productId, index);
	}

	@Override
	public int getNumberRatingOfStore(int sellerId) {
		return commentDAO.getNumberRatingOfStore(sellerId);
	}

}
