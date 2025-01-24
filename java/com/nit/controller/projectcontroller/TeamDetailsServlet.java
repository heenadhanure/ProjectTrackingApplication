package com.nit.controller.projectcontroller;

import java.io.IOException;
import java.util.List;

import com.nit.DAO.projectdao.TeamMemberDAO;
import com.nit.DAO.projectdao.TeamsDAO;
import com.nit.beans.TeamMembersBean;
import com.nit.beans.TeamsBean;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/teamDetails")
public class TeamDetailsServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {		
		String teamIdStr = req.getParameter("team_id");
		
		if(teamIdStr != null && !teamIdStr.isEmpty()) {
			int teamId = Integer.parseInt(teamIdStr);
			
			//fetch team details and team members
			TeamsBean teamDetails = TeamsDAO.getTeamDetails(teamId);
			List<TeamMembersBean> teamMembers = TeamMemberDAO.getTeamMembers(teamId);
			
			//set attributes to forward data to JSP
			req.setAttribute("teamDetails", teamDetails);
			req.setAttribute("teamMembers", teamMembers);
		}else {
			req.setAttribute("error", "Invalid Team ID");
		}
		
		req.getRequestDispatcher("JSP/TeamDetails.jsp").forward(req, resp);
	}
}
