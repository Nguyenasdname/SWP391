/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package test;

import dao.UserDao;
import dao.imp.UserDaoImp;
import model.User;

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
       User newUser = new User(1, "nguyentest", "nguyentest@gmail.com", null, null, null, "Active", 2, null, null, null, null);
       userDao.addUser(newUser);
       User user = userDao.getUserByUserName("nguyentest");
       System.out.print(newUser);
       
    }
    
}
