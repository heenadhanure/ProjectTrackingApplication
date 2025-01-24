package com.nit.controller.projectcontroller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import com.nit.utils.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/addTeamMembers")
public class AddTeamMembersServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		  String teamId = req.getParameter("team_id");
	      String[] memberUsernames = req.getParameterValues("team_members"); // Selected usernames

	      Connection conn = null;
	        PreparedStatement ps = null;

	        try {
	            conn = DBConnection.getCon();
	            // Insert members into team_members table
	            String query = "INSERT INTO team_members (team_id, username, role) VALUES (?, ?, ?)";
	            ps = conn.prepareStatement(query);

	            for (String username : memberUsernames) {
	                ps.setInt(1, Integer.parseInt(teamId));
	                ps.setString(2, username);
	                ps.setString(3, "Member"); // Default role
	                ps.executeUpdate();
	            }
	            
	            if(teamId != null) {
	            	req.setAttribute("msg", "Team Members Added Successfully...");
	            	req.getRequestDispatcher("JSP/AddedTeam.jsp").forward(req, resp);
	            }else {
	            	req.setAttribute("msg", "Failed to add team members");
	            	req.getRequestDispatcher("JSP/AddedTeam.jsp").forward(req, resp);
	            }
//	            resp.sendRedirect("teamDetails.jsp?team_id=" + teamId);
	        } catch (Exception e) {
	            e.printStackTrace();
	            resp.getWriter().println("Error: " + e.getMessage());
	        } finally {
	            try { if (ps != null) ps.close(); if (conn != null) conn.close(); } catch (Exception e) {}
	        }
	}
}
