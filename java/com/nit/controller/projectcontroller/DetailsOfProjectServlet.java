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
@WebServlet("/DetailsOfProject")
public class DetailsOfProjectServlet extends HttpServlet{
		@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			String projectId = req.getParameter("id");
	        List<ProjectsBean> projects = ProjectDetailsDAO.fetchProjectById(projectId);
	        
	        if(projects != null) {
		        req.setAttribute("projects", projects);
		        req.getRequestDispatcher("JSP/DetailsOfProject.jsp").forward(req, resp);
	        }
	}
}
