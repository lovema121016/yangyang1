package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.Good_comment_Dao;
import com.model.Good_comment;
import com.model.User;
import java.text.SimpleDateFormat;
import java.util.Date;
/**
 * Servlet implementation class UpGComment
 */
@WebServlet("/UpGComment")
public class UpGComment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpGComment() {
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
		//HTML框架
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
      try {
        request.setCharacterEncoding("utf-8");
        String content=request.getParameter("comment");
        int good_id=Integer.valueOf(request.getParameter("good_id"));
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("user");
        if(user==null)
        {
        	PrintWriter pWriter=response.getWriter();
            //响应用户
            pWriter.write("<script language='javaScript'>"+"alert('您还未登录！');"+"document.location.href='detail2.jsp';"+"</script>");
            pWriter.close();
        }
        else
        {
        //获取当前系统时间
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH-mm-ss");
		Date date = new Date();
		String time = simpleDateFormat.format(date);
		Good_comment comment=new Good_comment();
		comment.setGood_id(good_id);
		comment.setUsername(user.getUsername());
		comment.setContent(content);
		comment.setUp_time(time);
		Good_comment_Dao dd=new Good_comment_Dao();
		dd.addComment(comment);
		PrintWriter writer = response.getWriter();
		writer.println("<script>window.location.href='detail2.jsp'</script>");
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
