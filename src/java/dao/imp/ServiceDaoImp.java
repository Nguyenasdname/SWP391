/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao.imp;

import dao.ServiceDao;
import database.ConnectionDatabase;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.Service;

/**
 *
 * @author Admin
 */
public class ServiceDaoImp implements ServiceDao {

    @Override
    public Service getServiceByID(int id) {
        Service s = null;
        String sql = "Select * From Services Where ServiceID = ?";
        try (
                Connection con = ConnectionDatabase.getConnection(); PreparedStatement preStatement = con.prepareStatement(sql);) {
            
            preStatement.setInt(1, id);

            try (ResultSet resultSet = preStatement.executeQuery()) {
                if (resultSet.next()) {
                    s = new Service(resultSet.getInt("ServiceID"),
                            resultSet.getString("ServiceName"),
                            resultSet.getString("ServiceDescription"),
                            resultSet.getDouble("ServicePrice"),
                            resultSet.getDate("CreateDate"),
                            resultSet.getString("ServiceIMG")
                    );
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return s;
    }

    @Override
    public ArrayList<Service> getAllServiceList() {
        ArrayList<Service> listService = new ArrayList();
        String sql = "Select * From Services";
        try (
                Connection con = ConnectionDatabase.getConnection(); PreparedStatement preStatement = con.prepareStatement(sql);) {

            try (ResultSet resultSet = preStatement.executeQuery()) {
                while (resultSet.next()) {
                    Service s = new Service(resultSet.getInt("ServiceID"),
                            resultSet.getString("ServiceName"),
                            resultSet.getString("ServiceDescription"),
                            resultSet.getDouble("ServicePrice"),
                            resultSet.getDate("CreateDate"),
                            resultSet.getString("ServiceIMG")
                    );
                    listService.add(s);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return listService;
    }

    @Override
    public void addService(Service service) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void updateService(Service service) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void removeServiceById(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
