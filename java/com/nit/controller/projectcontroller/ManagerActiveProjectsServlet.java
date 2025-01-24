package com.nit.controller.projectcontroller;

import java.io.IOException;
import java.util.List;

import com.nit.DAO.projectdao.ProjectDetailsDAO;
import com.nit.beans.ProjectsBean;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/ManagerActiveProjects")
public class ManagerActiveProjectsServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		List<ProjectsBean> activeProjects = ProjectDetailsDAO.fetchActiveProjects();
		if(activeProjects != null) {
			req.setAttribute("active", activeProjects);
			req.getRequestDispatcher("JSP/ManagerActiveProjects.jsp").forward(req, resp);
		}
	}
}
