package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.BrandDao;
import com.dao.UserDaoImpl;
import com.model.Brand;
import com.model.User;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
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
		request.setCharacterEncoding("utf-8");
        String username = request.getParameter("username1");
        String nickname = request.getParameter("nickname");
        String password = request.getParameter("pass");
        //
      try
      {
        UserDaoImpl userdao=new UserDaoImpl();
        User user=new User();
        user.setUsername(username);
        user.setNickname(nickname);
        user.setPassword(password);
        user.setStatus("1");
        userdao.add(user);
        
        PrintWriter pWriter=response.getWriter();
        //响应用户
        pWriter.write("<script language='javaScript'>"+"alert('Register Successful!');"+"document.location.href='login.jsp';"+"</script>");
        pWriter.close();
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
