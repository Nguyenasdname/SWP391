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
public class Payment {
    private int paymentId;
    private int userId;
    private int bookingId;
    private Double paymentAmount;
    private String paymentMethod;
    private String paymentStatus;
    private Date createDate;
    private int promotionId;

    public Payment() {
    }

    public Payment(int paymentId, Integer userId, Integer bookingId, Double paymentAmount, String paymentMethod, String paymentStatus, Date createDate, int promotionId) {
        this.paymentId = paymentId;
        this.userId = userId;
        this.bookingId = bookingId;
        this.paymentAmount = paymentAmount;
        this.paymentMethod = paymentMethod;
        this.paymentStatus = paymentStatus;
        this.createDate = createDate;
        this.promotionId = promotionId;
    }

    public int getPaymentId() {
        return paymentId;
    }

    public void setPaymentId(int paymentId) {
        this.paymentId = paymentId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getBookingId() {
        return bookingId;
    }

    public void setBookingId(int bookingId) {
        this.bookingId = bookingId;
    }

    public Double getPaymentAmount() {
        return paymentAmount;
    }

    public void setPaymentAmount(Double paymentAmount) {
        this.paymentAmount = paymentAmount;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public String getPaymentStatus() {
        return paymentStatus;
    }

    public void setPaymentStatus(String paymentStatus) {
        this.paymentStatus = paymentStatus;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public int getPromotionId() {
        return promotionId;
    }

    public void setPromotionId(int promotionId) {
        this.promotionId = promotionId;
    }

    @Override
    public String toString() {
        return "Payment{" + "paymentId=" + paymentId + ", userId=" + userId + ", bookingId=" + bookingId + ", paymentAmount=" + paymentAmount + ", paymentMethod=" + paymentMethod + ", paymentStatus=" + paymentStatus + ", createDate=" + createDate + ", promotionId=" + promotionId + '}';
    }
    
    
}
