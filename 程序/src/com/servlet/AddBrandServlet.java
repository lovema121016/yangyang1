package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.BrandDao;
import com.model.Brand;

/**
 * Servlet implementation class AddBrandServlet
 */
@WebServlet("/AddBrandServlet")
public class AddBrandServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddBrandServlet() {
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
      try
      {
        request.setCharacterEncoding("utf-8");
        String brand = request.getParameter("brand");
        String type = request.getParameter("type");
        String remark = request.getParameter("remark");
        //检验品牌名是否已存在
        BrandDao bd = new BrandDao();
        Brand bran=bd.load(brand);
        if(bran!=null)
        {
        	PrintWriter pWriter=response.getWriter();
            //响应用户
            pWriter.write("<script language='javaScript'>"+"alert('品牌已存在！');"+"document.location.href='examples/tables/brand_top.jsp';"+"</script>");
            pWriter.close();
        }
        else
        {
        	Brand br=new Brand();
        	br.setBrand(brand);
        	br.setRemark(remark);
        	br.setType(type);
        	bd.add(br);
        	PrintWriter pWriter=response.getWriter();
            //响应用户
            pWriter.write("<script language='javaScript'>"+"alert('Successful');"+"document.location.href='examples/tables/brand_top.jsp';"+"</script>");
            pWriter.close();
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
