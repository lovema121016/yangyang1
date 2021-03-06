package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDaoImpl;
import com.model.User;

import java.io.File;
import java.io.PrintWriter;
/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	//HTML框架
    private String html_head = "<html>\n" +
            "<head>\n" +
            "    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n" +
            "    <link rel=\"stylesheet\" href=\"layui/css/layui.css\">\n" +
            "    <script type=\"javascript\" src=\"layui/layui.js\" ></script>\n" +
            "    <title>Title</title>\n" +
            "</head>\n" +
            "<body>\n";
    private String html_tail = "</body>\n" +
            "</html>";
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String absolute = getServletConfig().getServletContext().getRealPath("/");
        File china_json = new File(absolute + "js\\china.js");

        request.setAttribute("err_msg","非法请求，请以正规方式登陆系统");
        request.getRequestDispatcher("error.jsp").forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username = request.getParameter("username");
        String password = request.getParameter("password");
//        if(username.equals("admin")&&password.equals("admin"))
//        {
//        	response.sendRedirect("examples/index.jsp");
//        }
      try
      {
        UserDaoImpl userDao = new UserDaoImpl();
        User user = userDao.load(username,password);
        if (user == null)
        {
        	/***user为null，输出错误信息 ***/
			response.setContentType("text/html");
			String docType =
				      "<!doctype html public \"-//w3c//dtd html 4.0 " +
				      "transitional//en\">\n";
			PrintWriter writer = response.getWriter();
			writer.println(docType);
			writer.println("<script>alert('用户不存在或密码错误!')</script>");
			HttpSession session = request.getSession();
			session.setAttribute("number", username);
			writer.println("<script>window.location.href='login.jsp'</script>");
        }else if(user.getStatus().equals("1")){
            HttpSession session = request.getSession();
            session.setAttribute("user",user);
            request.getRequestDispatcher("index.jsp").forward(request,response);
        }else {
        	HttpSession session = request.getSession();
            session.setAttribute("user",user);
            response.sendRedirect("./examples/tables/brand_top.jsp");
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
