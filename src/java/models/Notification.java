/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

import java.util.Date;

/**
 *
 * @author Admin
 */
public class Notification {
    private int notificationId;
    private Integer userId;
    private String notificationMessage;
    private String notificationStatus;
    private Date createDate;

    public Notification(int notificationId, Integer userId, String notificationMessage, String notificationStatus, Date createDate) {
        this.notificationId = notificationId;
        this.userId = userId;
        this.notificationMessage = notificationMessage;
        this.notificationStatus = notificationStatus;
        this.createDate = createDate;
    }

    public Notification() {
    }

    public int getNotificationId() {
        return notificationId;
    }

    public void setNotificationId(int notificationId) {
        this.notificationId = notificationId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getNotificationMessage() {
        return notificationMessage;
    }

    public void setNotificationMessage(String notificationMessage) {
        this.notificationMessage = notificationMessage;
    }

    public String getNotificationStatus() {
        return notificationStatus;
    }

    public void setNotificationStatus(String notificationStatus) {
        this.notificationStatus = notificationStatus;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    @Override
    public String toString() {
        return "Notification{" + "notificationId=" + notificationId + ", userId=" + userId + ", notificationMessage=" + notificationMessage + ", notificationStatus=" + notificationStatus + ", createDate=" + createDate + '}';
    }
    
    
}
