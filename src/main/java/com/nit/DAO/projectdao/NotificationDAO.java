package com.nit.DAO.projectdao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.nit.beans.NotificationBean;
import com.nit.utils.DBConnection;

public class NotificationDAO {

    public static List<NotificationBean> getNotifications(String uname) {
        List<NotificationBean> notifications = new ArrayList<>();
        String query = "SELECT NOTIFICATION_ID, MESSAGE, DEVELOPER_ID, CREATED_AT FROM notifications WHERE DEVELOPER_ID = ?";

        try (Connection con = DBConnection.getCon();
             PreparedStatement ps = con.prepareStatement(query)) {
             
            ps.setString(1, uname);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                NotificationBean notification = new NotificationBean();
                notification.setNotificationId(rs.getInt("NOTIFICATION_ID"));
                notification.setNotificationMessage(rs.getString("MESSAGE"));
                notification.setDeveloperId(rs.getString("developer_id"));
                notification.setCreatedAt(rs.getDate("CREATED_AT"));

                notifications.add(notification);
                System.out.println("Notifications : "+notifications);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return notifications;
    }

    public static boolean markAsRead(int notificationId) {
        String query = "DELETE FROM notifications WHERE NOTIFICATION_ID = ?";
        try {
        	Connection con = DBConnection.getCon();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, notificationId);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
