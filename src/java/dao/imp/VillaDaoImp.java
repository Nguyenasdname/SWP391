/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao.imp;

import dao.VillaDao;
import database.ConnectionDatabase;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.Villa;

/**
 *
 * @author Admin
 */
public class VillaDaoImp implements VillaDao {

    @Override
    public Villa getVillaByID(int id) {
        Villa v = null;
        String sql = "Select * From Villas Where VillaID = ?";
        try (
                Connection con = ConnectionDatabase.getConnection(); PreparedStatement preStatement = con.prepareStatement(sql);) {

            preStatement.setInt(1, id);

            try (ResultSet resultSet = preStatement.executeQuery()) {
                if (resultSet.next()) {
                    v = new Villa(resultSet.getInt("VillaID"),
                            resultSet.getString("VillaName"),
                            resultSet.getString("VillaDescription"),
                            resultSet.getDouble("VillaPrice"),
                            resultSet.getString("VillaLocation"),
                            resultSet.getString("VillaStatus"),
                            resultSet.getString("VillaIMG"),
                            resultSet.getDate("CreateDate"),
                            resultSet.getInt("VillaCapacity")
                      
                    );
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return v;
    }

    @Override
    public ArrayList<Villa> getAllVillaList() {
        ArrayList<Villa> villaAvailableList = new ArrayList();
        String sql = "SELECT * FROM Villas";
        try (
                Connection con = ConnectionDatabase.getConnection(); PreparedStatement preStatement = con.prepareStatement(sql);) {

            try (ResultSet resultSet = preStatement.executeQuery()) {
                while (resultSet.next()) {
                    Villa villa = new Villa();
                    villa.setVillaId(resultSet.getInt("VillaID"));
                    villa.setVillaName(resultSet.getString("VillaName"));
                    villa.setVillaDescription(resultSet.getString("VillaDescription"));
                    villa.setVillaPrice(resultSet.getDouble("VillaPrice"));
                    villa.setVillaStatus(resultSet.getString("VillaStatus"));
                    villa.setVillaIMG(resultSet.getString("VillaIMG"));
                    villa.setVillaCapacity(resultSet.getInt("VillaCapacity"));

                    villaAvailableList.add(villa);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return villaAvailableList;
    }

    @Override
    public void addVilla(Villa villa) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void updateVilla(Villa villa) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void removeVillaById(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Villa> getAllVillaAvailable(int villaCapacity) {
        ArrayList<Villa> villaAvailableList = new ArrayList();
        String sql = "SELECT * FROM Villas WHERE VillaStatus = 'Available' AND VillaCapacity >= ?";
        try (
                Connection con = ConnectionDatabase.getConnection(); PreparedStatement preStatement = con.prepareStatement(sql);) {
            preStatement.setInt(1, villaCapacity);

            try (ResultSet resultSet = preStatement.executeQuery()) {
                while (resultSet.next()) {
                    Villa villa = new Villa();
                    villa.setVillaId(resultSet.getInt("VillaID"));
                    villa.setVillaName(resultSet.getString("VillaName"));
                    villa.setVillaDescription(resultSet.getString("VillaDescription"));
                    villa.setVillaPrice(resultSet.getDouble("VillaPrice"));
                    villa.setVillaStatus(resultSet.getString("VillaStatus"));
                    villa.setVillaIMG(resultSet.getString("VillaIMG"));
                    villa.setVillaCapacity(resultSet.getInt("VillaCapacity"));

                    villaAvailableList.add(villa);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return villaAvailableList;
    }

}
