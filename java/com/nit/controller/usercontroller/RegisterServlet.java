package com.nit.controller.usercontroller;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import com.nit.DAO.userdao.RegisterDAO;
import com.nit.beans.UserBean;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@MultipartConfig
@SuppressWarnings("serial")
@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		PrintWriter pw= res.getWriter();
		RequestDispatcher rd;
		res.setContentType("text/html");
		UserBean ub = new UserBean();
		ub.setUserName(req.getParameter("uname"));
		ub.setFirstName(req.getParameter("fname"));
		ub.setLastName(req.getParameter("lname"));
		ub.setEmail(req.getParameter("email"));
		ub.setRole(req.getParameter("role"));
		ub.setPassword(req.getParameter("pass"));
		ub.setConfirmPassword(req.getParameter("conPass"));
		System.out.println(ub.toString());
        ub.setPhone(Long.parseLong(req.getParameter("phone")));		
		/* Phone number handling
		String phoneParam = req.getParameter("phone");
		if (phoneParam != null && !phoneParam.trim().isEmpty()) {
		    try {
		        long phNo = Long.parseLong(phoneParam); // Parse String to long
		        ub.setPhone(phNo); // Now set it in UserBean
		    } catch (NumberFormatException e) {
		        pw.println("<h2 style='color:red'>Invalid phone number format.</h2>");
		        rd = req.getRequestDispatcher("register.html");
		        rd.include(req, res);
		        System.out.println("Userdefined Error");
		        return;
		    }
		} else {
		    pw.println("<h2 style='color:red'>Phone number is required.</h2>");
		    rd = req.getRequestDispatcher("register.html");
		    rd.include(req, res);
		    return;
		}	*/
		
		// Profile Image Handling
	    InputStream setprofile = null;
	    try {
	        Part photoPart = req.getPart("setprofile");
	        if (photoPart != null && photoPart.getSize() > 0) {
	            InputStream setprofile1 = photoPart.getInputStream(); // Extract InputStream from Part
	            ub.setProfileImage(setprofile1); // Pass the InputStream to setProfileImage method
	        }
	    } catch (IOException | ServletException e) {
	        e.printStackTrace();
	    }

		// Registration Login
		String result = RegisterDAO.register(ub);
		
		if(result.equals("SUCCESS")) {
			req.setAttribute("msg", "<h2 style='color:green'>You have Registered Successfully....</h2>");
			req.getRequestDispatcher("/JSP/Register.jsp").forward(req, res);
		}else {
			req.setAttribute("msg", "<h2 style='color:red'>Sorry, something went wrong during the registration process.\nPlease try again or <a href=\"register.html\">go back to the registration page\nIf the issue persists, contact support </h2>");
			req.getRequestDispatcher("/JSP/Msg.jsp").forward(req, res);
		}
	}
}
