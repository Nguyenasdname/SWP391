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
    ArrayList<Booking> getAllBookingList();
    void addBooking(Booking booking);
    void updateBooking(Booking booking);
    void removeBookingById(int id);
}
