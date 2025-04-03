/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

/**
 *
 * @author Admin
 */
public class Villa {
    private int villaId;
    private String villaName;
    private String villaDescription;
    private Double villaPrice;
    private String villaLocation;
    private String villaStatus;
    private String villaIMG;
    private Date createDate;
    private int villaCapacity;

    public Villa(int villaId, String villaName, String villaDescription, Double villaPrice, String villaLocation, String villaStatus, String villaIMG, Date createDate, int villaCapacity) {
        this.villaId = villaId;
        this.villaName = villaName;
        this.villaDescription = villaDescription;
        this.villaPrice = villaPrice;
        this.villaLocation = villaLocation;
        this.villaStatus = villaStatus;
        this.villaIMG = villaIMG;
        this.createDate = createDate;
        this.villaCapacity = villaCapacity;
    }

    public Villa() {
    }

    public int getVillaCapacity() {
        return villaCapacity;
    }

    public void setVillaCapacity(int villaCapacity) {
        this.villaCapacity = villaCapacity;
    }
    
    public int getVillaId() {
        return villaId;
    }

    public void setVillaId(int villaId) {
        this.villaId = villaId;
    }

    public String getVillaName() {
        return villaName;
    }

    public void setVillaName(String villaName) {
        this.villaName = villaName;
    }

    public String getVillaDescription() {
        return villaDescription;
    }

    public void setVillaDescription(String villaDescription) {
        this.villaDescription = villaDescription;
    }

    public Double getVillaPrice() {
        return villaPrice;
    }

    public void setVillaPrice(Double villaPrice) {
        this.villaPrice = villaPrice;
    }

    public String getVillaLocation() {
        return villaLocation;
    }

    public void setVillaLocation(String villaLocation) {
        this.villaLocation = villaLocation;
    }

    public String getVillaStatus() {
        return villaStatus;
    }

    public void setVillaStatus(String villaStatus) {
        this.villaStatus = villaStatus;
    }

    public String getVillaIMG() {
        return villaIMG;
    }

    public void setVillaIMG(String villaIMG) {
        this.villaIMG = villaIMG;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    
    @Override
    public String toString() {
        return "Villa{" + "villaId=" + villaId + ", villaName=" + villaName + ", villaDescription=" + villaDescription + ", villaPrice=" + villaPrice + ", villaLocation=" + villaLocation + ", villaStatus=" + villaStatus + ", villaIMG=" + villaIMG + ", createDate=" + createDate +'}' + "\n";
    }
    
}
