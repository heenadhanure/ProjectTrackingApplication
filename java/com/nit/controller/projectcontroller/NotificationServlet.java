package com.nit.controller.projectcontroller;

import java.io.IOException;
import java.util.List;

import com.nit.DAO.projectdao.NotificationDAO;
import com.nit.beans.NotificationBean;
import com.nit.beans.UserBean;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/NotificationServlet")
public class NotificationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Assuming developer ID is stored in session
    	UserBean ub = (UserBean)request.getSession().getAttribute("ubean");
        String uname = ub.getUserName();
        System.out.println("Username : "+uname);
        
        // Fetch notifications
        List<NotificationBean> notifications = NotificationDAO.getNotifications(uname);
        request.setAttribute("notifications", notifications);
        request.getRequestDispatcher("JSP/notification.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        String action = request.getParameter("action");
        int notificationId = Integer.parseInt(request.getParameter("notificationId"));

        if ("markAsRead".equals(action)) {
            boolean success = NotificationDAO.markAsRead(notificationId);
            response.getWriter().write(success ? "success" : "failure");
        }
    }
}
