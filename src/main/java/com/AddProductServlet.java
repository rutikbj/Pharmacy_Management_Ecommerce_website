package com;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import java.sql.*;
 
@WebServlet("/AddProductServlet")
@MultipartConfig(fileSizeThreshold=1024*1024*2, // 2MB
                 maxFileSize=1024*1024*10,      // 10MB
                 maxRequestSize=1024*1024*50)   // 50MB
public class AddProductServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
	response.setContentType("text/html");
	PrintWriter out = response.getWriter();	
	try{
	        String appPath = request.getServletContext().getRealPath("/");

		Class.forName("org.postgresql.Driver");

		Connection con = DriverManager.getConnection("jdbc:postgresql:pharma","postgres","root");

		ResultSet rs = con.createStatement().executeQuery("select last_value from medicine_medicine_id_seq");
		rs.next();
		int id = rs.getInt(1);
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

		con.createStatement().executeUpdate("INSERT INTO medicine (medicine_title, medicine_brand, medicine_cat, medicine_details, medicine_tags, medicine_image, medicine_quantity, medicine_price, mfg_date, exp_date) VALUES('"+name+"' ,'"+brand+"' ,'"+cat+"' ,'"+details+"' ,'"+tags+"' ,'"+image+"',"+quantity+","+price+",'"+mfg_date+"','"+exp_date+"')");

		con.createStatement().executeQuery("SELECT pg_catalog.setval('medicine_medicine_id_seq',"+(id+1)+" , true);");
		
	        for (Part part : request.getParts()) {
	            String fileName = extractFileName(part);

		    if(!fileName.equals(""))
		    {
                    	part.write(appPath + "images/"+id+".jpg");
		    }
	    }
	    
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
