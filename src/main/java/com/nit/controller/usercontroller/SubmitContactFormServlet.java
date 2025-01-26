package com.nit.controller.usercontroller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/submitContactForm")
public class SubmitContactFormServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// Retrieve Form Data
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String message = req.getParameter("message");

        // Email Details
        String recipientEmail = "supriyaachkulwar45@gmail.com"; // Replace with the support email
        String senderEmail = "heena.dhanure@gmail.com"; // Your sender email (Gmail)
        String senderPassword = "Gullu@2182"; // Your email's app password

        String subject = "Contact Form Message from: " + name;
        String messageText = "Message from: " + name + "\nEmail: " + email + "\n\nMessage:\n" + message;

        // Send Email
        try {
            EmailService.sendMail(recipientEmail, senderEmail, senderPassword, subject, messageText);
            resp.getWriter().println("Message Sent Successfully!");
        } catch (Exception e) {
            resp.getWriter().println("Failed to Send Message: " + e.getMessage());
        }
	}
}
