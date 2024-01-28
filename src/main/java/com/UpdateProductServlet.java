package com;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import java.sql.*;
 
@WebServlet("/UpdateProductServlet")
@MultipartConfig(fileSizeThreshold=1024*1024*2, // 2MB
                 maxFileSize=1024*1024*10,      // 10MB
                 maxRequestSize=1024*1024*50)   // 50MB
public class UpdateProductServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
	response.setContentType("text/html");
	PrintWriter out = response.getWriter();	
	try{
	        String appPath = request.getServletContext().getRealPath("/");

		Class.forName("org.postgresql.Driver");

		Connection con = DriverManager.getConnection("jdbc:postgresql:pharma","postgres","root");

		String id = request.getParameter("id");
		String name = request.getParameter("name").trim();
		String brand = request.getParameter("brand").trim();
		String cat = request.getParameter("cat").trim();
		String tags = request.getParameter("tags").trim();
		String image = id+".jpg";
		String quantity = request.getParameter("quantity").trim();
		String price = request.getParameter("price").trim();
		String details = request.getParameter("details").trim();
		String mfg_date = request.getParameter("mfg_date").trim();
		String exp_date = request.getParameter("exp_date").trim();

		boolean f = false;
		
	    for (Part part : request.getParts()) {
	    	String fileName = extractFileName(part);

		    if(!fileName.equals("")){
		    	java.io.File d = new java.io.File(appPath + "images/"+id+".jpg");
		    	d.delete();
                part.write(appPath + "images/"+id+".jpg");
                f = true;
		    }
	    }
	    if(f)
	    	con.createStatement().executeUpdate("UPDATE medicine SET medicine_title='"+name+"', medicine_brand='"+brand+"', medicine_cat='"+cat+"', medicine_details='"+details+"', medicine_tags='"+tags+"', medicine_image='"+image+"', medicine_quantity="+quantity+", medicine_price="+price+", mfg_date='"+mfg_date+"', exp_date='"+exp_date+"' WHERE medicine_id='"+id+"'");
	    else
	    	con.createStatement().executeUpdate("UPDATE medicine SET medicine_title='"+name+"', medicine_brand='"+brand+"', medicine_cat='"+cat+"', medicine_details='"+details+"', medicine_tags='"+tags+"', medicine_quantity="+quantity+", medicine_price="+price+", mfg_date='"+mfg_date+"', exp_date='"+exp_date+"' WHERE medicine_id='"+id+"'");
		response.sendRedirect("products.jsp");
	}
	catch(Exception e){
		out.println("<h4>"+e+"</h4>");
	}	
    }
    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length()-1);
            }
        }
        return "";
    }
}
