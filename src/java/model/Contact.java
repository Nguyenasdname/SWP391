/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

/**
 *
 * @author Admin
 */
public class Contact {
    private int contactId;
    private int userId;
    private String contactTitle;
    private String contactContent;
    private String contactStatus;
    private Date createDate;
    private String userEmail;
    private String userFullName;
    private String qrRefund;
    private String refundStatus;

    public Contact(int contactId, int userId, String contactTitle, String contactContent, String contactStatus, Date createDate, String refundStatus) {
        this.contactId = contactId;
        this.userId = userId;
        this.contactTitle = contactTitle;
        this.contactContent = contactContent;
        this.contactStatus = contactStatus;
        this.createDate = createDate;
        this.refundStatus = refundStatus;
    }

    public Contact() {
    }

    public int getContactId() {
        return contactId;
    }

    public void setContactId(int contactId) {
        this.contactId = contactId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getContactTitle() {
        return contactTitle;
    }

    public void setContactTitle(String contactTitle) {
        this.contactTitle = contactTitle;
    }

    public String getContactContent() {
        return contactContent;
    }

    public void setContactContent(String contactContent) {
        this.contactContent = contactContent;
    }

    public String getContactStatus() {
        return contactStatus;
    }

    public void setContactStatus(String contactStatus) {
        this.contactStatus = contactStatus;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public String getUserFullName() {
        return userFullName;
    }

    public void setUserFullName(String userFullName) {
        this.userFullName = userFullName;
    }

    public String getQrRefund() {
        return qrRefund;
    }

    public void setQrRefund(String qrRefund) {
        this.qrRefund = qrRefund;
    }

    public String getRefundStatus() {
        return refundStatus;
    }

    public void setRefundStatus(String refundStatus) {
        this.refundStatus = refundStatus;
    }
    
    @Override
    public String toString() {
        return "Contact{" + "contactId=" + contactId + ", userId=" + userId + ", contactTitle=" + contactTitle + ", contactContent=" + contactContent + ", contactStatus=" + contactStatus + ", createDate=" + createDate + ", userEmail=" + userEmail + ", usetFullName=" + userFullName + "}\n";
    }
    
    
}
