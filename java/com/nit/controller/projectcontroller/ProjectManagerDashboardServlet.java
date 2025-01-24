package com.nit.controller.projectcontroller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import com.nit.DAO.projectdao.ProjectManagerDashboardDAO;
import com.nit.beans.ProjectsBean;
import com.nit.beans.TasksBean;
import com.nit.beans.UserBean;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/ProjectManagerDashboard")
public class ProjectManagerDashboardServlet extends HttpServlet  {
	private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
    	
    	// Assuming you have the username in the session
    	 UserBean ub = (UserBean) request.getSession().getAttribute("ubean");
        String uname = ub.getUserName();
        if (uname == null) {
            // If the username is not found, redirect to login page
            response.sendRedirect("login.html");
            return;
        }
        
        //fetch progress
        List<ProjectsBean> projectProgressList = ProjectManagerDashboardDAO.projectProgress();
        // Fetch team performance
        Map<String, Integer> teamPerformance = ProjectManagerDashboardDAO.getTeamPerformance(uname);
        List<TasksBean> deadlines = ProjectManagerDashboardDAO.getUpcomingDeadlines(uname);       

        request.setAttribute("projectProgressList", projectProgressList);
        request.setAttribute("teamPerformance", teamPerformance);
        request.setAttribute("deadlines", deadlines);
        
        request.getRequestDispatcher("JSP/Login.jsp").forward(request, response);
    }
}
