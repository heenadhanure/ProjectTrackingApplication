package com.nit.controller.projectcontroller;

import java.io.IOException;
import java.util.List;

import com.nit.DAO.projectdao.TeamsDAO;
import com.nit.beans.UserBean;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/addTeam")
public class AddTeamServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String projectId = request.getParameter("projectId"); // Get project ID from the hidden field
        String teamName = request.getParameter("teamName");
        String teamLead = request.getParameter("teamLead");
        int members = Integer.parseInt(request.getParameter("members"));
        String description = request.getParameter("description");
       
        List<UserBean> usersList = TeamsDAO.getAllUsers();
        System.out.println("users : "+usersList);
        
        int teamId = TeamsDAO.fetchTeamId();
        String teamIdString = String.valueOf(teamId);

        session.setAttribute("teamId", teamIdString);
        
        int result = TeamsDAO.createTeam(teamName,teamLead,projectId,members,description);
       
        if(result > 0) {
        	request.setAttribute("msg", "Team Created Successfully");
        	session.setAttribute("usersList", usersList);
        	request.getRequestDispatcher("JSP/AddTeamMembers.jsp").forward(request, response);
        }else {
        	request.setAttribute("msg", "Failed to create the team");
        	request.getRequestDispatcher("JSP/AddedTeam.jsp").forward(request, response);     	
        }
      
        
	} 
}

//        try {
//            // Get database connection
//            Connection con = DBConnection.getCon();
//            String query = "INSERT INTO teams (team_name, team_lead, project_id, members, description) VALUES (?, ?, ?, ?, ?)";
//            PreparedStatement ps = con.prepareStatement(query);
//
//            ps.setString(1, teamName);
//            ps.setString(2, teamLead);
//            ps.setString(3, projectId);
//            ps.setInt(4, members);
//            ps.setString(5, description);
//
//            int result = ps.executeUpdate();
//            if (result > 0) {
//                response.sendRedirect("fetchProjects?project_id=" + projectId);
//            } else {
//                response.getWriter().println("Failed to create the team. Please try again.");
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//            response.getWriter().println("Error: " + e.getMessage());
//        }
//