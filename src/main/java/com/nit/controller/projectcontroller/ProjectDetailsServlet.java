package com.nit.controller.projectcontroller;

import java.io.IOException;
import java.util.List;

import com.nit.DAO.projectdao.ProjectDetailsDAO;
import com.nit.beans.ProjectsBean;
import com.nit.beans.UserBean;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/projectsDetails")
public class ProjectDetailsServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		
		UserBean ub = (UserBean) session.getAttribute("ubean");
		String uname = ub.getUserName();
		
        List<ProjectsBean> projects = ProjectDetailsDAO.fetchProjects();
        
        if(projects != null) {
	        req.setAttribute("projects", projects);
	        req.getRequestDispatcher("JSP/Projects.jsp").forward(req, resp);
        }
        
	}
}
