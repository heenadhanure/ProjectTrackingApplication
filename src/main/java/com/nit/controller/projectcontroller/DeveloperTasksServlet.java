package com.nit.controller.projectcontroller;

import java.io.IOException;
import java.util.List;

import com.nit.DAO.projectdao.DeveloperDashboardDAO;
import com.nit.beans.TasksBean;
import com.nit.beans.UserBean;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/DeveloperTasks")
public class DeveloperTasksServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		
		// Assuming you have the username in the session
   	 	UserBean ub = (UserBean) session.getAttribute("ubean");
        String uname = ub.getUserName();
        
        // Fetch tasks from the database
        List<TasksBean> tasks = DeveloperDashboardDAO.fetchTasks(uname);
        
        int pendingCount = DeveloperDashboardDAO.fetchPendingTasksCount(uname);
        int inProgressCount = DeveloperDashboardDAO.fetchInProgressTasksCount(uname);
        int completedCount = DeveloperDashboardDAO.fetchCompletedTasksCount(uname);
        
        // Set attributes in request scope
        req.setAttribute("srList", tasks);
        session.setAttribute("pendingCount", pendingCount);
        session.setAttribute("inProgressCount", inProgressCount);
        session.setAttribute("completedCount", completedCount);
       
        // Forward to the JSP page
        req.getRequestDispatcher("JSP/DeveloperTasks.jsp").forward(req, resp);
  
    
	}
}
