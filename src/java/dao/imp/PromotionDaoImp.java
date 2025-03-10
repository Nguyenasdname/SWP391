/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao.imp;

import dao.PromotionDao;
import database.ConnectionDatabase;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.Promotion;

/**
 *
 * @author Admin
 */
public class PromotionDaoImp implements PromotionDao{

    @Override
    public Promotion getPromotionByID(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Promotion> getAllPromotionList() {
        ArrayList<Promotion> promotionList = new ArrayList();
        String sql = "Select * From Promotions";
        try (
                Connection con = ConnectionDatabase.getConnection(); PreparedStatement preStatement = con.prepareStatement(sql);) {

            try (ResultSet resultSet = preStatement.executeQuery()) {
                while (resultSet.next()) {
                    Promotion p = new Promotion(resultSet.getInt("PromotionID"),
                            resultSet.getString("PromotionCode"),
                            resultSet.getDouble("DiscountPercent"),
                            resultSet.getDate("StartDate"),
                            resultSet.getDate("EndDate"),
                            resultSet.getString("PromotionStatus")
                    );
                    promotionList.add(p);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return promotionList;
    }

    @Override
    public void addPromotion(Promotion promotion) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void updatePromotion(Promotion promotion) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void removePromotionById(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
}
