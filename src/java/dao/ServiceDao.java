/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package dao;

import java.util.ArrayList;
import models.Service;

/**
 *
 * @author Admin
 */
public interface ServiceDao {
    Service getServiceByID(int id);
    ArrayList<Service> getAllServiceList();
    void addService(Service service);
    void updateService(Service service);
    void removeServiceById(int id);
}
