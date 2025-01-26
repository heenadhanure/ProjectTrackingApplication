package com.nit.controller.projectcontroller;

import java.io.IOException;
import java.util.List;

import com.nit.DAO.projectdao.DeveloperDashboardDAO;
import com.nit.beans.BugBean;
import com.nit.beans.DocumentationBean;
import com.nit.beans.NotificationBean;
import com.nit.beans.ProjectsBean;
import com.nit.beans.TasksBean;
import com.nit.beans.UserBean;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/DeveloperDashboard")
public class DeveloperDashboardServlet extends HttpServlet {
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
        
        // Fetch projects from database
        List<ProjectsBean> projects = DeveloperDashboardDAO.fetchProjects(uname);
        
        // Fetch tasks from the database
           List<TasksBean> tasks = DeveloperDashboardDAO.fetchTasks(uname);
     
        // Fetch notifications from the database
           List<NotificationBean> notifications = DeveloperDashboardDAO.fetchNotifications(uname);       
    
        // Fetch bugs from the database
           List<BugBean> bugs = DeveloperDashboardDAO.fetchBugs(uname);

        // fetch links from the database
           List<DocumentationBean> documents = DeveloperDashboardDAO.fetchDocuments(uname);
           
        // Set attributes in request scope
        request.setAttribute("projects", projects);
        request.setAttribute("srList", tasks);
        request.setAttribute("notifications", notifications);
        request.setAttribute("bugs", bugs);
        request.setAttribute("documents", documents);
       
        // Forward to the JSP page
        request.getRequestDispatcher("JSP/Login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        doGet(request, response);
    }
}
