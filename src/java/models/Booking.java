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
public class Booking {
    private int bookingId;
    private int userId;
    private int villaId;
    private Date checkIn;
    private Date checkOut;
    private String bookingStatus;
    private int promotionId;
    private Date createDate;

    public Booking(int bookingId, int userId, int villaId, Date checkIn, Date checkOut, String bookingStatus, int promotionId, Date createDate) {
        this.bookingId = bookingId;
        this.userId = userId;
        this.villaId = villaId;
        this.checkIn = checkIn;
        this.checkOut = checkOut;
        this.bookingStatus = bookingStatus;
        this.promotionId = promotionId;
        this.createDate = createDate;
    }

    public Booking() {
    }

    public int getBookingId() {
        return bookingId;
    }

    public void setBookingId(int bookingId) {
        this.bookingId = bookingId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getVillaId() {
        return villaId;
    }

    public void setVillaId(int villaId) {
        this.villaId = villaId;
    }

    public Date getCheckIn() {
        return checkIn;
    }

    public void setCheckIn(Date checkIn) {
        this.checkIn = checkIn;
    }

    public Date getCheckOut() {
        return checkOut;
    }

    public void setCheckOut(Date checkOut) {
        this.checkOut = checkOut;
    }

    public String getBookingStatus() {
        return bookingStatus;
    }

    public void setBookingStatus(String bookingStatus) {
        this.bookingStatus = bookingStatus;
    }

    public int getPromotionId() {
        return promotionId;
    }

    public void setPromotionId(int promotionId) {
        this.promotionId = promotionId;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    @Override
    public String toString() {
        return "Booking{" + "bookingId=" + bookingId + ", userId=" + userId + ", villaId=" + villaId + ", checkIn=" + checkIn + ", checkOut=" + checkOut + ", bookingStatus=" + bookingStatus + ", promotionId=" + promotionId + ", createDate=" + createDate + '}';
    }
    
    
}
