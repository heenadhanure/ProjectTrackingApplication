package com.nit.controller.usercontroller;

import java.util.Properties;
import jakarta.mail.*;
import jakarta.mail.internet.*;

public class EmailService {
    public static void sendMail(String recipientEmail, String senderEmail, String senderPassword, String subject, String messageText) {
    	 String host = "smtp.gmail.com"; // SMTP server
         String username = "heena.dhanure@gmail.com";
         String password = "Gullu@2182"; // App-specific password if using Gmail
         String toEmail = "supriyaachkulwar45@gmail.com";

         // SMTP properties
         Properties props = new Properties();
         props.put("mail.smtp.host", host);
         props.put("mail.smtp.port", "587");
         props.put("mail.smtp.auth", "true");
         props.put("mail.smtp.starttls.enable", "true");

         // Session and message setup
         Session session = Session.getInstance(props, new Authenticator() {
             protected PasswordAuthentication getPasswordAuthentication() {
                 return new PasswordAuthentication(username, password);
             }
         });

         try {
             MimeMessage message = new MimeMessage(session);
             message.setFrom(new InternetAddress(username));
             message.addRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
             message.setSubject("Test Email");
             message.setText("This is a test message sent using JavaMail!");

             // Send the email
             Transport.send(message);
             System.out.println("Email sent successfully!");
         } catch (MessagingException e) {
             e.printStackTrace();
         }
    }
}
