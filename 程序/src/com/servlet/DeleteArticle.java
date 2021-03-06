package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.ArticleDao;
import com.dao.Article_comment_Dao;
import java.net.URLEncoder;
/**
 * Servlet implementation class DeleteArticle
 */
@WebServlet("/DeleteArticle")
public class DeleteArticle extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteArticle() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {	
			request.setCharacterEncoding("utf-8");
			int id = Integer.valueOf(request.getParameter("article_id"));
			//String brand=request.getParameter("brand");
			//HttpSession session = request.getSession();
			
			//session.setAttribute("brand", brand);
			System.out.println("lalalla");
			ArticleDao ad=new ArticleDao();
			ad.delete(id);//删除文章
			Article_comment_Dao acd=new Article_comment_Dao();
			acd.delete(id);  //删除改文章的所有评论
			PrintWriter out = response.getWriter();  //获取输出流
		    //响应用户
			String a = URLEncoder.encode("删除成功！", "UTF-8"); 

		    out.print("<script language='javascript'>alert(decodeURIComponent('"+a+"'))</script>");
		    out.println("<script>window.location.href='center/fabu_history.jsp'</script>");
		    out.close();
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
