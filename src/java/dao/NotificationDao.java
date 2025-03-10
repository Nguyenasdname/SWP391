/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package dao;

import java.util.ArrayList;
import model.Notification;

/**
 *
 * @author Admin
 */
public interface NotificationDao {
    Notification getNotificationByID(int id);
    ArrayList<Notification> getAllNotificationList();
    void addNotification(Notification notification);
    void updateNotification(Notification notification);
    void removeNotificationById(int id);
}
