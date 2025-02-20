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
public class Promotion {
    private int promotionId;
    private String promotionCode;
    private Double discountPercent;
    private Date startDate;
    private Date endDate;
    private String promotionStatus;

    public Promotion(int promotionId, String promotionCode, Double discountPercent, Date startDate, Date endDate, String promotionStatus) {
        this.promotionId = promotionId;
        this.promotionCode = promotionCode;
        this.discountPercent = discountPercent;
        this.startDate = startDate;
        this.endDate = endDate;
        this.promotionStatus = promotionStatus;
    }

    public Promotion() {
    }

    
    
    public int getPromotionId() {
        return promotionId;
    }

    public void setPromotionId(int promotionId) {
        this.promotionId = promotionId;
    }

    public String getPromotionCode() {
        return promotionCode;
    }

    public void setPromotionCode(String promotionCode) {
        this.promotionCode = promotionCode;
    }

    public Double getDiscountPercent() {
        return discountPercent;
    }

    public void setDiscountPercent(Double discountPercent) {
        this.discountPercent = discountPercent;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public String getPromotionStatus() {
        return promotionStatus;
    }

    public void setPromotionStatus(String promotionStatus) {
        this.promotionStatus = promotionStatus;
    }

    @Override
    public String toString() {
        return "Promotion{" + "promotionId=" + promotionId + ", promotionCode=" + promotionCode + ", discountPercent=" + discountPercent + ", startDate=" + startDate + ", endDate=" + endDate + ", promotionStatus=" + promotionStatus + '}';
    }
    
    
}
