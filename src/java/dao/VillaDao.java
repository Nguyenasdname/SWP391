/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package dao;

import java.util.ArrayList;
import model.Villa;

/**
 *
 * @author Admin
 */
public interface VillaDao {
    Villa getVillaByID(int id);
    ArrayList<Villa> getAllVillaList();
    boolean addVilla(Villa villa); 
    void updateVilla(Villa villa); 
    void removeVillaById(int id); 
    ArrayList<Villa> getAllVillaAvailable(int VillaCapacity, String fromDate, String toDate);
    void setBookedVilla(int villaId);
    void setAvailableVilla(int villaId);
    Villa getAvailableVilla(int villaId, String fromDate, String toDate);
    ArrayList<Villa> getFiveVilla(int page, ArrayList<Villa> villaList);
    ArrayList<Villa> getVillaByWishlist(int userId);
}
    