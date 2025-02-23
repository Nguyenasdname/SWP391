/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package test;

import dao.BookingDao;
import dao.BookingServiceDao;
import dao.PromotionDao;
import dao.ServiceDao;
import dao.UserDao;
import dao.VillaDao;
import dao.imp.BookingDaoImp;
import dao.imp.BookingServiceDaoImp;
import dao.imp.PromotionDaoImp;
import dao.imp.ServiceDaoImp;
import dao.imp.UserDaoImp;
import dao.imp.VillaDaoImp;
import java.util.ArrayList;
import model.Booking;
import model.BookingService;
import model.Promotion;
import model.Service;
import model.User;
import model.Villa;

/**
 *
 * @author Admin
 */
public class NewMain {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        UserDao userDao = new UserDaoImp();
//       User user = userDao.validateUser("nguyenkuhaku@gmail.com", "123");
//       System.out.print(user);
//       User newUser = new User(1, "nguyentest", "nguyentest@gmail.com", null, null, null, "Active", 2, null, null, null, null);
//       userDao.addUser(newUser);
//       User user = userDao.getUserByUserName("nguyentest");
//       System.out.print(newUser);
//        VillaDao villaDao = new VillaDaoImp();
////      ArrayList<Villa> availableVilla = villaDao.getAllVillaList();
////       
//
//        Villa v = villaDao.getVillaByID(1);
//        System.out.print(v);
//        PromotionDao promotionDao = new PromotionDaoImp();
//        ArrayList<Promotion> listPromotion = promotionDao.getAllPromotionList();
//        
//        System.out.print(listPromotion);
//        ServiceDao serviceDao = new ServiceDaoImp();
//        
//        Service s = serviceDao.getServiceByID(1);
//        
//        System.out.print(s);
          BookingDao bookingDao = new BookingDaoImp();
          ArrayList<Booking> bookingList = bookingDao.getListBookingByUserId(1);
          
          System.out.print(bookingList);
          
          
    }

}
