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

import com.model.Good;
import com.model.GoodLike;
import com.model.User;
import com.util.DaoFactory;
import com.dao.GoodDao;
import com.dao.GoodLikeDao;
/**
 * Servlet implementation class AddGoodLike
 */
@WebServlet("/AddGoodLike")
public class AddGoodLike extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddGoodLike() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		GoodLikeDao gld = new GoodLikeDao();
		int good_id = 0;
	  try
	  {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM");
        String currentDate = dateFormat.format(new Date());//获取当前时间
		try {
			good_id = Integer.parseInt(request.getParameter("goodid"));
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
			
			GoodDao gd=new GoodDao();
			Good good=gd.load(good_id);
			GoodLike gl = new GoodLike();
			gl.setGood_id(good_id);
			gl.setGood_name(good.getName());
			gl.setUser_id(user.getId());
			gl.setFocus_time(currentDate);
			gl.setBrand(good.getBrand());
			gld.add(gl);
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
