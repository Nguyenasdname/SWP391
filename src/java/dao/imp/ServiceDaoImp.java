package dao.imp;

import dao.ServiceDao;
import database.ConnectionDatabase;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.Service;

public class ServiceDaoImp implements ServiceDao {

    @Override
    public Service getServiceByID(int id) {
        Service s = null;
        String sql = "Select * From Services Where ServiceID = ?";
        try (Connection con = ConnectionDatabase.getConnection(); PreparedStatement preStatement = con.prepareStatement(sql)) {

            preStatement.setInt(1, id);

            try (ResultSet resultSet = preStatement.executeQuery()) {
                if (resultSet.next()) {
                    s = new Service(resultSet.getInt("ServiceID"), resultSet.getString("ServiceName"),
                            resultSet.getString("ServiceDescription"), resultSet.getDouble("ServicePrice"), resultSet.getDate("CreateDate"),
                            resultSet.getString("ServiceIMG"));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return s;
    }

    @Override
    public ArrayList<Service> getAllServiceList() {
        ArrayList<Service> listService = new ArrayList<>();
        String sql = "Select * From Services";
        try (Connection con = ConnectionDatabase.getConnection(); PreparedStatement preStatement = con.prepareStatement(sql)) {

            try (ResultSet resultSet = preStatement.executeQuery()) {
                while (resultSet.next()) {
                    Service s = new Service(resultSet.getInt("ServiceID"), resultSet.getString("ServiceName"),
                            resultSet.getString("ServiceDescription"), resultSet.getDouble("ServicePrice"), resultSet.getDate("CreateDate"),
                            resultSet.getString("ServiceIMG"));
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
        String sql = "INSERT INTO Services (ServiceName, ServiceDescription, ServiceIMG, ServicePrice) VALUES (?, ?, ?, ?)";
        try (Connection con = ConnectionDatabase.getConnection(); PreparedStatement preStatement = con.prepareStatement(sql)) {

            // Set parameters for the query
            preStatement.setString(1, service.getServiceName());
            preStatement.setString(2, service.getServiceDescription());
            preStatement.setString(3, service.getServiceIMG());
            preStatement.setDouble(4, service.getServicePrice());

            // Execute the update
            preStatement.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void updateService(Service service) {
        String sql = "UPDATE Services SET ServiceName = ?, ServiceDescription = ?, ServiceIMG = ?, ServicePrice = ? WHERE ServiceID = ?";
        try (Connection con = ConnectionDatabase.getConnection(); PreparedStatement preStatement = con.prepareStatement(sql)) {
            System.out.println(service);
            // Set parameters for the query
            preStatement.setString(1, service.getServiceName());
            preStatement.setString(2, service.getServiceDescription());
            preStatement.setString(3, service.getServiceIMG());
            preStatement.setDouble(4, service.getServicePrice());
            preStatement.setInt(5, service.getServiceId());

            System.out.println(preStatement.toString());
            // Execute the update
            preStatement.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void removeServiceById(int id) {
        String sql = "DELETE FROM Services WHERE ServiceID = ?";
        try (Connection con = ConnectionDatabase.getConnection(); PreparedStatement preStatement = con.prepareStatement(sql)) {

            // Set the service ID parameter for deletion
            preStatement.setInt(1, id);

            // Execute the deletion
            preStatement.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public String getServiceNameByServiceId(int serviceId) {
        String serviceName = "";
        String sql = "Select s.ServiceName From Services s Where s.ServiceID = ?";
        try (Connection con = ConnectionDatabase.getConnection(); PreparedStatement preStatement = con.prepareStatement(sql)) {

            preStatement.setInt(1, serviceId);

            try (ResultSet resultSet = preStatement.executeQuery()) {
                if (resultSet.next()) {
                    serviceName = resultSet.getString("ServiceName");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return serviceName;
    }
}
