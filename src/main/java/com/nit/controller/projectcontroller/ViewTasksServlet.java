package com.nit.controller.projectcontroller;

import java.io.IOException;
import java.util.List;

import com.nit.DAO.projectdao.ManagerTasksDAO;
import com.nit.beans.TeamLeadTasksBean;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/viewTasks")
public class ViewTasksServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<TeamLeadTasksBean> tasksList = ManagerTasksDAO.fetchTasks();
		
		if(tasksList != null) {
			req.setAttribute("tasksList", tasksList);
			req.getRequestDispatcher("JSP/ProjectManagerTasks.jsp").forward(req, resp);
		}
	}
}
