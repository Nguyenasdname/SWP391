/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package dao;

import java.util.ArrayList;
import model.Booking;

/**
 *
 * @author Admin
 */
public interface BookingDao {
    Booking getBookingByID(int id);
    Booking getBookingDetailByID(int bookingId);
    ArrayList<Booking> getAllBookingList();
    boolean addBooking(Booking booking);
    void updateBooking(Booking booking);
    void removeBookingById(int id);
    Booking getUserBookingVilla(int userId, int villaId, String bookingStatus);
    Booking getBookingStatus(int userId, String bookingStatus);
    Booking getBookingByUserId(int userId);
    ArrayList<Booking> getListBookingByUserId(int userId);
    void setBookingStatusCancel(int bookingId);
}
