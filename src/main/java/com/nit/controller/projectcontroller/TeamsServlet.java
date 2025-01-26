package com.nit.controller.projectcontroller;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import com.nit.DAO.projectdao.TeamsDAO;
import com.nit.beans.ProjectsBean;
import com.nit.beans.TeamsBean;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/fetchProjects")
public class TeamsServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String projectName = req.getParameter("project_name");
//		System.out.println("Project Name: " + req.getParameter("project_name"));
//		System.out.println("Selected Project Name : "+projectName);
		List<TeamsBean> teams = null;
		
		//fetch teams
		if (projectName == null || projectName.isEmpty()) {
		 //   System.out.println("No project selected");
		    req.setAttribute("project", "None Selected");
		    session.setAttribute("teams", null);
		} else {
//		    System.out.println("Project name: " + projectName);
		    //fetch teams
		     teams = TeamsDAO.fetchTeams(projectName);
		}
		
		//fetch projects
        List<ProjectsBean> projectList = null;
        if (projectList == null) {
            projectList = TeamsDAO.fetchProjects();
            session.setAttribute("projects", projectList);
        }
        
        //set attributes
        session.setAttribute("projectName", projectName);
        session.setAttribute("teams", teams);
        
        req.getRequestDispatcher("JSP/teamOverview.jsp").forward(req, resp);
        
	}
}
