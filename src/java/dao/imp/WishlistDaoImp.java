/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao.imp;

import dao.WishlistDao;
import database.ConnectionDatabase;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.Wishlist;

/**
 *
 * @author Admin
 */
public class WishlistDaoImp implements WishlistDao {

    @Override
    public ArrayList<Wishlist> getWishlistByUserID(int userId) {
        ArrayList<Wishlist> wishlist = new ArrayList();
        String sql = "Select * From Wishlist Where UserID = ?";
        try (Connection con = ConnectionDatabase.getConnection(); PreparedStatement preStatement = con.prepareStatement(sql)) {
            preStatement.setInt(1, userId);

            try (ResultSet resultSet = preStatement.executeQuery()) {
                while (resultSet.next()) {
                    Wishlist w = new Wishlist(resultSet.getInt("UserId"),
                            resultSet.getInt("VillaId")
                    );
                    wishlist.add(w);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return wishlist;
    }

    @Override
    public ArrayList<Wishlist> getAllWishlist() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void addWishlist(Wishlist wishlist) {
        String sql = "Insert Into Wishlist(UserID, VillaID) Values(?, ?)";
        try (Connection con = ConnectionDatabase.getConnection(); PreparedStatement preStatement = con.prepareStatement(sql)){
            
            preStatement.setInt(1, wishlist.getUserId());
            preStatement.setInt(2, wishlist.getVillaId());
            
            preStatement.executeUpdate();
            
        } catch (Exception e){
            e.printStackTrace();
        }
    }

    @Override
    public void updateWishlist(Wishlist wishlist) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void removeWishlistById(Wishlist wishlist) {
        String sql = "Delete From Wishlist Where UserID = ? And VillaID = ?";
        try (Connection con = ConnectionDatabase.getConnection(); PreparedStatement preStatement = con.prepareStatement(sql)){
            
            preStatement.setInt(1, wishlist.getUserId());
            preStatement.setInt(2, wishlist.getVillaId());
            
            preStatement.executeUpdate();
            
        } catch (Exception e){
            e.printStackTrace();
        }
    }

    @Override
    public ArrayList<Wishlist> getWishlistByVillaID(int villaId) {
        ArrayList<Wishlist> wishlist = new ArrayList();
        String sql = "Select * From Wishlist Where VillaID = ?";
        try (Connection con = ConnectionDatabase.getConnection(); PreparedStatement preStatement = con.prepareStatement(sql)) {
            preStatement.setInt(1, villaId);

            try (ResultSet resultSet = preStatement.executeQuery()) {
                while (resultSet.next()) {
                    Wishlist w = new Wishlist(resultSet.getInt("UserId"),
                            resultSet.getInt("VillaId")
                    );
                    wishlist.add(w);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return wishlist;
    }

    @Override
    public Wishlist getWishlistByUserVillaId(int userId, int villaId) {
        Wishlist w = null;
        String sql = "Select * From Wishlist Where UserID = ? And VillaID = ?";
        try (Connection con = ConnectionDatabase.getConnection(); PreparedStatement preStatement = con.prepareStatement(sql)){
            
            preStatement.setInt(1, userId);
            preStatement.setInt(2, villaId);
            
            try (ResultSet resultSet = preStatement.executeQuery()){
                if(resultSet.next()){
                    w = new Wishlist(resultSet.getInt("UserID"),
                            resultSet.getInt("VillaID")
                    );
                }
            }
            
        } catch (Exception e){
            e.printStackTrace();
        }
        return w;
    }

}
