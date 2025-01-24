package com.nit.controller.projectcontroller;

import java.io.IOException;
import java.util.List;

import com.nit.DAO.projectdao.ActiveProjectsDAO;
import com.nit.DAO.projectdao.OnHoldProjectsDAO;
import com.nit.beans.ProjectsBean;
import com.nit.beans.UserBean;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/OnHoldProjects")
public class OnHoldProjectsServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		
		UserBean ub = (UserBean) session.getAttribute("ubean");
		String uname = ub.getUserName();
		
        List<ProjectsBean> projects = OnHoldProjectsDAO.fetchProjects(uname);
        
        req.setAttribute("projects", projects);
        req.getRequestDispatcher("JSP/OnHoldProjects.jsp").forward(req, resp);

	}
}
