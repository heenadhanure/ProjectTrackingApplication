package com.nit.controller.projectcontroller;

import java.io.IOException;
import java.util.List;

import com.nit.DAO.projectdao.InProgressTasksDAO;
import com.nit.beans.TasksBean;
import com.nit.beans.UserBean;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/InprogressTasks")
public class InProgressTasksServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		UserBean ub = (UserBean)req.getSession().getAttribute("ubean");
		String uname = ub.getUserName();
		
		List<TasksBean> fetchInprogressTasks = InProgressTasksDAO.fetchInprogressTasks(uname);
		
		req.setAttribute("InProgressTasks", fetchInprogressTasks);
		
		req.getRequestDispatcher("JSP/InprogressTasks.jsp").forward(req, resp);
	}
}
