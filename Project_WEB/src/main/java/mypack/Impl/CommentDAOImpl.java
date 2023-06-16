package mypack.Impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.xml.stream.events.Comment;

import org.eclipse.jdt.internal.compiler.ast.ReturnStatement;

import ConnectionDB.DBConnection;
import mypack.DAO.ICommentDAO;
import mypack.model.CommentModel;
import mypack.services.IProductService;
import mypack.services.IUserService;

public class CommentDAOImpl extends DBConnection implements ICommentDAO{
	Connection con;
	PreparedStatement ps ;
	ResultSet rs;
	@Override
	public void insertComment(int userId,int productId, String content, int rating, String time) {
		
		String sql = "insert into Comment(userId, productId, content, time, rating) values(?,?,?,?,?)";
		try {
			con = super.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, userId);
			ps.setInt(2, productId);
			ps.setString(3, content);
			ps.setString(4, time);
			ps.setInt(5, rating);
			ps.executeUpdate();
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
	}

	@Override
	public void editComment(int commentId, int userId, int productId, String content, int rating, String time) {
		
		String sql = "update Comment set userId=? , productId = ? , content=? , time =? , rating = ? where commentId = ?";
		try {
			con = super.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, userId);
			ps.setInt(2, productId);
			ps.setString(3, content);
			ps.setString(4, time);
			ps.setInt(5, rating);
			ps.setInt(6, commentId);
			ps.executeUpdate();
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
	}

	@Override
	public void deleteComment(int commentId, int productId) {
		String sql = "delete from Comment where productId=?";
		try {
			con = super.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, productId);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public List<CommentModel> getAllCommentOfProduct(int productId) {
		
		String sql = "select * from Comment where productId = ?";
		IUserService user = new UserServiceImpl();
		List<CommentModel> comments = new ArrayList<>();
		try {
			con = super.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, productId);
			rs = ps.executeQuery();
			while(rs.next()) {
				CommentModel comment = new CommentModel();
				comment.setCommentId(rs.getInt("commentId"));
				comment.setContent(rs.getString("content"));
				comment.setProductId(rs.getInt("productId"));
				comment.setRating(rs.getInt("rating"));
				comment.setTime(rs.getString("time"));
				comment.setUserId(rs.getInt("userId"));
				comment.setUser(user.get("userId"));
				comments.add(comment);
			}
			return comments;
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<CommentModel> getNext6CommentOfProduct(int productId, int index) {
		
		String sql="with x as (select ROW_NUMBER() over (order by commentId ) as r\n"
				+ ",* from Comment where productId = ? )\n"
				+ "select * from x where r between ?*6-5 and ?*6";
		List<CommentModel> comments = new ArrayList<>();
		IUserService user = new UserServiceImpl();
		try {
			con = super.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, productId);
			ps.setInt(2, index);
			ps.setInt(3, index);
			rs = ps.executeQuery();
			while(rs.next()) {
				CommentModel comment = new CommentModel();
				comment.setCommentId(rs.getInt("commentId"));
				comment.setContent(rs.getString("content"));
				comment.setProductId(rs.getInt("productId"));
				comment.setRating(rs.getInt("rating"));
				comment.setTime(rs.getString("time"));
				comment.setUserId(rs.getInt("userId"));
				comment.setUser(user.get("userId"));
				comments.add(comment);
			}
			return comments;
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public int getNumberRatingOfStore(int sellerId) {
	
		int count = 0;
		String sql = "select * from Comment C join Product P \r\n"
				+ "		on C.productId = P.productId \r\n"
				+ "		where P.sellerId = ?";
		IUserService user = new UserServiceImpl();		
		try {
			
		con = super.getConnection();
		ps = con.prepareStatement(sql);
		ps.setInt(1, sellerId);
		rs = ps.executeQuery();
			while(rs.next()) {
				count++;
			}
	
		} catch (Exception e) {

				e.printStackTrace();
		}
		return count;
	}
		
}
