package com.nit.controller.projectcontroller;

import java.io.IOException;
import java.util.List;

import com.nit.DAO.projectdao.ManagerTasksDAO;
import com.nit.DAO.projectdao.ProjectManagerDashboardDAO;
import com.nit.beans.ManagerTasksBean;
import com.nit.beans.ProjectsBean;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/ManagerAssignTask")
public class ManagerAssignTaskServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		
		List<ProjectsBean> projects = ProjectManagerDashboardDAO.fetchProjects();
		session.setAttribute("projects", projects);
		
//		List<TeamsBean> teamLeaders = ProjectManagerDashboardDAO.fetchTeams();
//		session.setAttribute("teamLeaders", teamLeaders);
		
		List<ManagerTasksBean> managerTasks = ManagerTasksDAO.fetchManagerTasks();
		session.setAttribute("managerTasks", managerTasks);
		
		req.getRequestDispatcher("JSP/ManagerAssignTask.jsp").forward(req, resp);
	}
}
