package com.nit.controller.projectcontroller;

import java.io.IOException;
import java.util.List;

import com.nit.DAO.projectdao.CompletedTasksDAO;
import com.nit.beans.TasksBean;
import com.nit.beans.UserBean;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/CompletedTasks")
public class CompletedTasksServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// Assuming you have the username in the session
   	 	UserBean ub = (UserBean) req.getSession().getAttribute("ubean");
        String uname = ub.getUserName();
        
        // Fetch tasks from the database
        List<TasksBean> fetchCompletedTasks = CompletedTasksDAO.fetchCompletedTasks(uname);
        
        req.setAttribute("completedTasks", fetchCompletedTasks);
       
        // Forward to the JSP page
        req.getRequestDispatcher("JSP/CompletedTasks.jsp").forward(req, resp);
	}
}
