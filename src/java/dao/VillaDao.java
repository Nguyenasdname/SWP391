/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package dao;

import java.util.ArrayList;
import models.Villa;

/**
 *
 * @author Admin
 */
public interface VillaDao {
    Villa getVillaByID(int id);
    ArrayList<Villa> getAllVillaList();
    void addVilla(Villa villa); 
    void updateVilla(Villa villa); 
    void removeVillaById(int id); 
}
