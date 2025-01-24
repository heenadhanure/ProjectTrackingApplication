package com.nit.controller.projectcontroller;

import java.io.IOException;

import com.nit.DAO.projectdao.ManagerTasksDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/AddManagerTask")
public class AddManagerTaskServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// Retrieve form data
		
        String clientName = req.getParameter("clientName");
        String projectName = req.getParameter("projectName");
        String taskTitle = req.getParameter("taskTitle");
        String taskDescription = req.getParameter("taskDescription");
        String priority = req.getParameter("priority");
        String dueDate = req.getParameter("taskDueDate");
        
        int result = ManagerTasksDAO.addTask(clientName,projectName,taskTitle,taskDescription,priority,dueDate);
        if(result>0) {
        	req.setAttribute("msg", "Task Added Succesfully...");
        	req.getRequestDispatcher("JSP/ProjectManagerTasks.jsp").forward(req, resp);
        }else {
        	req.setAttribute("msg", "Failed to Assign Task...");
        	req.getRequestDispatcher("JSP/ProjectManagerTasks.jsp").forward(req, resp);
        }
	}
}
