package com.nit.controller.usercontroller;

import java.io.IOException;

import com.nit.beans.UserBean;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/editProfile")
public class EditProfileServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession session = req.getSession();
		UserBean ub = (UserBean)session.getAttribute("ubean");
		String fName = ub.getFirstName();
		
		if(session == null || fName == null) {
			req.setAttribute("msg", "Session Expired...");
			req.getRequestDispatcher("/JSP/Msg.jsp").forward(req, res);
		}else {
			req.setAttribute("name", fName);
			req.getRequestDispatcher("/JSP/EditProfile.jsp").forward(req, res);
		}
		/*	Cookie c[] = req.getCookies();
		if(c==null) {
			req.setAttribute("msg","Session Expired...<br><br>");
			req.getRequestDispatcher("Msg.jsp").forward(req, res);
		}else {
			String fName = c[0].getValue();
			req.setAttribute("name",fName);
			req.getRequestDispatcher("/JSP/EditProfile.jsp").forward(req, res);
		}	*/
	}	
}
