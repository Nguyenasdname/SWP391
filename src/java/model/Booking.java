/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;
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
    private Date createDate;
    private double bookingTotal;
    private ArrayList<BookingService> bookingService;

    public Booking(int bookingId, int userId, int villaId, Date checkIn, Date checkOut, String bookingStatus, Date createDate, double bookingTotal) {
        this.bookingId = bookingId;
        this.userId = userId;
        this.villaId = villaId;
        this.checkIn = checkIn;
        this.checkOut = checkOut;
        this.bookingStatus = bookingStatus;
        this.createDate = createDate;
        this.bookingTotal = bookingTotal;
    }

    public Booking() {
    }

    public int getBookingId() {
        return bookingId;
    }

    public void setBookingId(int bookingId) {
        this.bookingId = bookingId;
    }

    public double getBookingTotal() {
        return bookingTotal;
    }

    public void setBookingTotal(double bookingTotal) {
        this.bookingTotal = bookingTotal;
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

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public ArrayList<BookingService> getBookingService() {
        return bookingService;
    }

    public void setBookingService(ArrayList<BookingService> bookingService) {
        this.bookingService = bookingService;
    }

    @Override
    public String toString() {
        return "Booking{" + "bookingId=" + bookingId + ", userId=" + userId + ", villaId=" + villaId + ", checkIn=" + checkIn + ", checkOut=" + checkOut + ", bookingStatus=" + bookingStatus + ", createDate=" + createDate + ", bookingTotal= " + bookingTotal + '}';
    }
    
    
}
