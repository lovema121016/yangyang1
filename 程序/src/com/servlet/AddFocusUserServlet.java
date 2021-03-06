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
import com.dao.GoodLikeDao;
import com.model.Focus_Users;
import com.model.GoodLike;
import com.model.User;

/**
 * Servlet implementation class AddFocusUserServlet
 */
@WebServlet("/AddFocusUserServlet")
public class AddFocusUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddFocusUserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Focus_UserDao gld = new Focus_UserDao();
		String article_username = "";
      try
      {
		try {
			article_username = request.getParameter("article_username");
			System.out.print(article_username);
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
			
			Focus_Users focus = new Focus_Users();
			focus.setUser_id(user.getId());
			focus.setFocus_username(article_username);
			gld.add(focus);
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
