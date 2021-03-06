package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.GoodDao;
import com.util.Java_Python_test2;

/**
 * Servlet implementation class UpdateBrandDataServlet
 */
@WebServlet("/UpdateBrandDataServlet")
public class UpdateBrandDataServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateBrandDataServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		request.setCharacterEncoding("utf-8");
	  try
	  {
		 PrintWriter out = response.getWriter();  //获取输出流
	    //响应用户
		 String a = URLEncoder.encode("这可能需要很长时间，请不要退出！", "UTF-8"); 
         
	     out.print("<script language='javascript'>alert(decodeURIComponent('"+a+"'))</script>");
	     
	     String brand=request.getParameter("brand");
	     Java_Python_test2 pt=new Java_Python_test2();
	     pt.UpdateData(brand);
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
		
//		String brand= request.getParameter("brand");
//		GoodDao gd=new GoodDao();
//		
//		//删除数据
//		gd.deleteBrandAllData(brand);
		
		//更新数据
		
		
	}

}
