package mypack.Controller.web;

import java.io.IOException;
import java.util.*;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mypack.Impl.CommentServiceImpl;
import mypack.model.CommentModel;
import mypack.model.UserAccountModel;
import mypack.services.ICommentService;


@WebServlet("/CommentController")
public class CommentController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    String productId = null;
    ICommentService comments = new CommentServiceImpl();

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String seller = request.getParameter("sellerId");
		
		String rating = request.getParameter("rating");
		String content = request.getParameter("content");
		productId = request.getParameter("productId");
		Date dnow = new Date();
		SimpleDateFormat ft = new SimpleDateFormat("E dd.MM.yyyy 'at' hh:mm:ss");
		String time = ft.format(dnow);
		HttpSession session = request.getSession();
		UserAccountModel u = (UserAccountModel) session.getAttribute("account");
		comments.insertComment(u.getUserId(), Integer.parseInt(productId), content, Integer.parseInt(rating), time);
		response.sendRedirect(request.getContextPath() + "/ProductControllerWeb?id="+productId+"&userId="+seller+"");
	}

}
