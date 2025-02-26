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
    public boolean addVilla(Villa villa) {
        String sql = "INSERT INTO Villas (VillaName, VillaDescription, VillaPrice, VillaLocation, VillaStatus, VillaIMG, VillaCapacity) \n"
                + "VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (
                Connection con = ConnectionDatabase.getConnection(); PreparedStatement preStatement = con.prepareStatement(sql);) {

            preStatement.setString(1, villa.getVillaName());
            preStatement.setString(2, villa.getVillaDescription());
            preStatement.setDouble(3, villa.getVillaPrice());
            preStatement.setString(4, villa.getVillaLocation());
            preStatement.setString(5, villa.getVillaStatus());
            preStatement.setString(6, villa.getVillaIMG());
            preStatement.setInt(7, villa.getVillaCapacity());

            return preStatement.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
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
    public ArrayList<Villa> getAllVillaAvailable(int villaCapacity, String fromDate, String toDate) {
        ArrayList<Villa> villaAvailableList = new ArrayList<>();
        String sql = "SELECT * FROM Villas v "
                + "WHERE v.VillaCapacity >= ? "
                + "AND v.VillaID NOT IN ( "
                + "    SELECT b.VillaID "
                + "    FROM Booking b "
                + "    WHERE b.BookingStatus IN ('Pending', 'Confirmed', 'Completed') "
                + "    AND ( ? < b.CheckOut AND ? > b.CheckIn) "
                + ")";

        try (Connection con = ConnectionDatabase.getConnection(); PreparedStatement preStatement = con.prepareStatement(sql)) {

            preStatement.setInt(1, villaCapacity);
            preStatement.setDate(2, java.sql.Date.valueOf(fromDate));
            preStatement.setDate(3, java.sql.Date.valueOf(toDate));

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
    public void setBookedVilla(int villaId) {
        String sql = "Update Villas \n"
                + "Set VillaStatus = 'Booked' Where VillaID = ?";
        try (
                Connection con = ConnectionDatabase.getConnection(); PreparedStatement preStatement = con.prepareStatement(sql);) {
            preStatement.setInt(1, villaId);

            preStatement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    @Override
    public void setAvailableVilla(int villaId) {
        String sql = "Update Villas \n"
                + "Set VillaStatus = 'Available' Where VillaID = ?";
        try (
                Connection con = ConnectionDatabase.getConnection(); PreparedStatement preStatement = con.prepareStatement(sql);) {
            preStatement.setInt(1, villaId);

            preStatement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    @Override
    public Villa getAvailableVilla(int villaId, String fromDate, String toDate) {
        Villa v = null;
        String sql = "SELECT v.*\n"
                + "FROM Villas v\n"
                + "WHERE v.VillaID = ?\n"
                + "And v.VillaID NOT IN (\n"
                + "    SELECT b.VillaID\n"
                + "    FROM Booking b\n"
                + "    WHERE \n"
                + "        b.BookingStatus IN ('Pending', 'Confirmed', 'Completed') \n"
                + "        AND (\n"
                + "            ? < b.CheckOut  \n"
                + "            AND ? > b.CheckIn\n"
                + "        )\n"
                + ");";
        try (Connection con = ConnectionDatabase.getConnection(); PreparedStatement preStatement = con.prepareStatement(sql)) {

            preStatement.setInt(1, villaId);
            preStatement.setDate(2, java.sql.Date.valueOf(fromDate));
            preStatement.setDate(3, java.sql.Date.valueOf(toDate));

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
}
