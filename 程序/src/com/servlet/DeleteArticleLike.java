package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.ArticleDao;
import com.dao.ArticleLikeDao;
import com.model.Article;
import com.model.ArticleLike;
import com.model.User;

/**
 * Servlet implementation class DeleteArticleLike
 */
@WebServlet("/DeleteArticleLike")
public class DeleteArticleLike extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteArticleLike() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ArticleLikeDao gld = new ArticleLikeDao();
		int article_id = 0;
	 try
	 {
		//SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM");
       // String currentDate = dateFormat.format(new Date());//获取当前时间
		try {
			article_id = Integer.parseInt(request.getParameter("article_id"));
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		if (user == null || user.getId() == 0) {
			response.setContentType("text/html");
			PrintWriter writer = response.getWriter();
			writer.print("NO_LOGIN");
			return;
		}else {
			System.out.print("yaoyao");
			gld.delete(user.getId(), article_id);
			response.setContentType("text/html");
			PrintWriter writer = response.getWriter();
			writer.print("OK");
		}
	 }catch (Exception e)//当捕捉的异常与代码发生的异常相同时，程序可继续执行catch里的代码，括号内放的是异常的对象
	    { 
	    	String a="login.jsp";
	    	PrintWriter out = response.getWriter();  //获取输出流
	    	out.println("<script>window.location.href='error.jsp?id="+a+"'</script>");
	    	out.close();
	    } finally
	    { 
	    	
	    }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
