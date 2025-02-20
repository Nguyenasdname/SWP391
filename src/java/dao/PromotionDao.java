/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package dao;

import java.util.ArrayList;
import model.Promotion;

/**
 *
 * @author Admin
 */
public interface PromotionDao {
    Promotion getPromotionByID(int id);
    ArrayList<Promotion> getAllPromotionList();
    void addPromotion(Promotion promotion); 
    void updatePromotion(Promotion promotion);
    void removePromotionById(int id);
}
