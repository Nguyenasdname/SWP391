/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package dao;

import java.util.ArrayList;
import models.User;

/**
 *
 * @author Admin
 */
public interface UserDao{
    User validateUser(String userName, String userPass);
    User getUserByID(int id); 
    ArrayList<User> getAllUserList(); 
    void addUser(User user); 
    void updateUser(User user); 
    void removeUserById(int id);
    User isUserExists(String userName, String userEmail);
    User getUserByUserName(String userName);
}
