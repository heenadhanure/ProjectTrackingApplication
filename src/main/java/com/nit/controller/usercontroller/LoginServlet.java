package com.nit.controller.usercontroller;

import java.io.IOException;

import com.nit.DAO.userdao.LoginDAO;
import com.nit.beans.UserBean;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		UserBean ub = LoginDAO.login(req.getParameter("uname"),req.getParameter("pword"));
		
		if(ub==null){
			req.setAttribute("msg", "Invalid Username or Password...");
			req.getRequestDispatcher("/JSP/Msg.jsp").forward(req, res);
		}else {
			
		/*	ServletContext sct = req.getServletContext(); // Accessing context object reference
			sct.setAttribute("ubean", ub); // UserBean object reference added to context
			Cookie ck = new Cookie("fName",ub.getFirstName()); // Creating Cookie
			res.addCookie(ck);
			// i am seting value in servlet 
			//ServletContext sr = req.getServletContext();
			System.out.println("******"+ub.getUserName());
			sct.setAttribute("userName",ub.getUserName());
			String userRole = ub.getRole();
			// value set
			
			
			// Adding cookie to response
			// addCookie() performs serialization process
			//req.getRequestDispatcher("/JSP/Login.jsp").forward(req, res);	*/
			 
					
			HttpSession session = req.getSession();
			session.setAttribute("ubean", ub);
			
			String userRole = ub.getRole();
	      // session.setAttribute("userRole", userRole);

			
			if ("project manager".equals(userRole)) {
			    res.sendRedirect("ProjectManagerDashboard");
			} else if ("Team Lead".equals(userRole)) {
			    res.sendRedirect("TeamLeadDashboard");
			} else if("Developer".equals(userRole)){
			    res.sendRedirect("DeveloperDashboard");
			}
			
		}
	}
}
