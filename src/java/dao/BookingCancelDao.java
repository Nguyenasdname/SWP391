/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package dao;

import java.util.ArrayList;
import model.BookingCancel;

/**
 *
 * @author Admin
 */
public interface BookingCancelDao {
    BookingCancel getBookingCancelByID(int id); 
    ArrayList<BookingCancel> getAllBookingCancelList(); 
    void addBookingCancel(BookingCancel bookingCancel); 
    void updateBookingCancel(BookingCancel bookingCancel);
    void removeBookingCancelById(int id);
}
