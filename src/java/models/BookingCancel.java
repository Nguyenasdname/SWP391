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
public class BookingCancel {
    private int cancelId;
    private int bookingId;
    private String cancelReason;
    private Date cancelDate;

    public BookingCancel(int cancelId, int bookingId, String cancelReason, Date cancelDate) {
        this.cancelId = cancelId;
        this.bookingId = bookingId;
        this.cancelReason = cancelReason;
        this.cancelDate = cancelDate;
    }

    public BookingCancel() {
    }

    public int getCancelId() {
        return cancelId;
    }

    public void setCancelId(int cancelId) {
        this.cancelId = cancelId;
    }

    public int getBookingId() {
        return bookingId;
    }

    public void setBookingId(int bookingId) {
        this.bookingId = bookingId;
    }

    public String getCancelReason() {
        return cancelReason;
    }

    public void setCancelReason(String cancelReason) {
        this.cancelReason = cancelReason;
    }

    public Date getCancelDate() {
        return cancelDate;
    }

    public void setCancelDate(Date cancelDate) {
        this.cancelDate = cancelDate;
    }

    @Override
    public String toString() {
        return "BookingCancel{" + "cancelId=" + cancelId + ", bookingId=" + bookingId + ", cancelReason=" + cancelReason + ", cancelDate=" + cancelDate + '}';
    }
    
    
}
