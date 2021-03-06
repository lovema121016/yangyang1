package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.BrandDao;
import com.dao.GoodDao;

/**
 * Servlet implementation class DeleteBrand
 */
@WebServlet("/DeleteBrand")
public class DeleteBrand extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteBrand() {
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
			String brand= request.getParameter("id");
			BrandDao bd=new BrandDao();
			bd.delete(brand);
			GoodDao gd=new GoodDao();
			gd.deleteBrand(brand);
			//response.sendRedirect("/kuoyelin/delete.jsp");
			PrintWriter out = response.getWriter();  //获取输出流
		    //响应用户
			 String a = URLEncoder.encode("品牌删除成功！", "UTF-8"); 

		     out.print("<script language='javascript'>alert(decodeURIComponent('"+a+"'))</script>");
		     out.println("<script>window.location.href='examples/tables/brand_top.jsp'</script>");
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
