package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.Focus_UserDao;
import com.dao.UserDaoImpl;
import com.model.Focus_Users;
import com.model.User;

/**
 * Servlet implementation class PanDuanServlet
 */
@WebServlet("/PanDuanServlet")
public class PanDuanServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PanDuanServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// TOString username = "";
		String username="";
	try
	{
		try {
			username = request.getParameter("username");
			System.out.print(username);
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
		UserDaoImpl userdao=new UserDaoImpl();
		User user=userdao.load(username);
		if (user == null || user.getId() == 0) {
			response.setCharacterEncoding("utf-8");
			PrintWriter writer = response.getWriter();
			writer.print("NO_OK");
			return;
		}else {
			response.setCharacterEncoding("utf-8");
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
