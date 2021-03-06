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

import com.dao.Article_comment_Dao;
import com.dao.Good_comment_Dao;
import com.model.Article_comment;
import com.model.Good_comment;
import com.model.User;

/**
 * Servlet implementation class AddArticleCommentServlet
 */
@WebServlet("/AddArticleCommentServlet")
public class AddArticleCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddArticleCommentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String html_head = "<html>\n" +
                "<head>\n" +
                "    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n" +
                "    <link rel=\"stylesheet\" href=\"layui/css/layui.css\">\n" +
                "    <script type=\"javascript\" src=\"layui/layui.js\" ></script>\n" +
                "    <title>Title</title>\n" +
                "</head>\n" +
                "<body>\n";
        String html_tail = "</body>\n" +
                "</html>";
        //或许页面信息
        request.setCharacterEncoding("utf-8");
       try
       {
        String content=request.getParameter("content");
        int article_id=Integer.valueOf(request.getParameter("article_id"));
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("user");
        if(user==null)
        {
        	PrintWriter pWriter=response.getWriter();
            //响应用户
            pWriter.write("<script language='javaScript'>"+"alert('您还未登录！');"+"document.location.href='detail.jsp';"+"</script>");
            pWriter.close();
        }
        else
        {
        //获取当前系统时间
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH-mm-ss");
		Date date = new Date();
		String time = simpleDateFormat.format(date);
		Article_comment_Dao acd=new Article_comment_Dao();
		Article_comment comment=new Article_comment();
		comment.setArticle_id(article_id);
		comment.setUsername(user.getUsername());
		comment.setContent(content);
		comment.setUp_time(time);
		acd.addComment(comment);
		PrintWriter writer = response.getWriter();
		writer.println("<script>window.location.href='detail.jsp?article_id="+article_id+"'</script>");
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
   

}
