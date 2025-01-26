package com.nit.controller.usercontroller;

import java.io.IOException;

import com.nit.DAO.userdao.UpdateProfileDAO;
import com.nit.beans.UserBean;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/update")
public class UpdateProfileServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        // Retrieve the current session, but do not create a new one if it doesn't exist
        HttpSession session = req.getSession(false);
        UserBean ub = (UserBean)session.getAttribute("ubean");
		String fName = ub.getFirstName();
		
        if (session == null || fName == null) {
            // Handle session expiration
            req.setAttribute("msg", "Session Expired...<br><br>");
            req.getRequestDispatcher("/JSP/Msg.jsp").forward(req, res);
        } else {
            /* Retrieve fName from the session
               String fName = (String) session.getAttribute("fName");
               req.setAttribute("name", fName);

            // Retrieve the UserBean object from the ServletContext
            ServletContext sct = req.getServletContext();
            UserBean ub = (UserBean) sct.getAttribute("ubean"); */

            // Update UserBean with form data
            ub.setUserName(req.getParameter("uname"));
            ub.setEmail(req.getParameter("email"));
            ub.setRole(req.getParameter("role"));
            // ub.setPhone(req.getParameter("phone")); // Uncomment if needed
           // ub.setProfileImage(req.getInputStream());

            // Update the profile using DAO
            int k = new UpdateProfileDAO().update(ub);

            if (k > 0) {
                req.setAttribute("msg", "Profile Updated Successfully...<br><br>");
                req.getRequestDispatcher("/JSP/UpdateProfile.jsp").forward(req, res);
            }
        }
    }
}