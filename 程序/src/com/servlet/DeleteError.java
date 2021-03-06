package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.GoodDao;



/**
 * Servlet implementation class DeleteErrod
 */
@WebServlet("/DeleteErrod")
public class DeleteError extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteError() {
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
			int id = Integer.valueOf(request.getParameter("id"));
			//String brand=request.getParameter("brand");
			//HttpSession session = request.getSession();
			
			//session.setAttribute("brand", brand);
			//System.out.println(brand);
			GoodDao gd=new GoodDao();
			gd.delete(id);
			//response.sendRedirect("/kuoyelin/delete.jsp");
			PrintWriter out = response.getWriter();  //获取输出流
		    //响应用户
			String a = URLEncoder.encode("异常数据删除成功！", "UTF-8"); 

		    out.print("<script language='javascript'>alert(decodeURIComponent('"+a+"'))</script>");
		    out.println("<script>window.location.href='examples/tables/errordata.jsp'</script>");
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
