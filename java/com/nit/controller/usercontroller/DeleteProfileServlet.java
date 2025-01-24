package com.nit.controller.usercontroller;

import java.io.IOException;

import com.nit.DAO.userdao.DeleteProfileDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/deleteProfile")
public class DeleteProfileServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String uname = req.getParameter("uname");
		HttpSession session = req.getSession();
		int k = DeleteProfileDAO.delete(uname);
		
		if(k<=0) {
			session.setAttribute("msg", "User not found...");
			req.getRequestDispatcher("/JSP/Msg.jsp").forward(req, res);
		}else {
			session.setAttribute("msg","Profile Deleted Successfully...");
			req.getRequestDispatcher("/JSP/DeleteProfile.jsp").forward(req, res);
		}
		
	}
}
