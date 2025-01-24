package com.nit.controller.usercontroller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/viewProfile")
public class ViewProfileServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		Cookie c[] = req.getCookies();
		if(c==null) {
			req.setAttribute("msg","Session Expired...<br><br>");
			req.getRequestDispatcher("/JSP/Msg.jsp").forward(req, res);
		}else {
			String fName = c[0].getValue();
			req.setAttribute("name", fName);
			req.getRequestDispatcher("/JSP/ViewProfile.jsp").forward(req, res);
		}
	}
}
