/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.DAO;

import com.model.Fee;
import com.util.Database;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author oshee
 */
public class FeeDAO {
    
    public boolean addFee(Fee fee) {
        String sql = "INSERT INTO fees (id, CourseID, total_fee, paid_amount, due_amount) VALUES (?, ?, ?, ?, ?)";

        try (Connection conn = Database.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, fee.getId());
            ps.setInt(2, fee.getCourseId());
            ps.setDouble(3, fee.getTotalFee());
            ps.setDouble(4, fee.getPaidAmount());
            ps.setDouble(5, fee.getDueAmount());

            int result = ps.executeUpdate();
            return result > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }
    
    /**
     *
     * @return
     */
   public ArrayList<Fee> getFeeList() {
    try {
        ArrayList<Fee> feeList = new ArrayList<>();
        String query = "SELECT record, id, CourseID, total_fee, paid_amount, due_amount FROM fees";

        Statement statement = Database.getConnection().createStatement();
        ResultSet rs = statement.executeQuery(query);

        while (rs.next()) {
            Fee fee = new Fee();
            fee.setRecord(rs.getInt("record"));
            fee.setId(rs.getInt("id"));
            fee.setCourseId(rs.getInt("CourseID"));
            fee.setTotalFee(rs.getDouble("total_fee"));
            fee.setPaidAmount(rs.getDouble("paid_amount"));
            fee.setDueAmount(rs.getDouble("due_amount"));
            feeList.add(fee);
        }
        return feeList;
    } catch (Exception e) {
    }
    return null;
    
}
   public Fee getFeeByRecord(int recordId) {
    String sql = "SELECT record, id, CourseID, total_fee, paid_amount, due_amount FROM fees WHERE record = ?";
    
    try (Connection conn = Database.getConnection(); 
         PreparedStatement ps = conn.prepareStatement(sql)) {
        
        ps.setInt(1, recordId);
        ResultSet rs = ps.executeQuery();
        
        if (rs.next()) {
            Fee fee = new Fee();
            fee.setRecord(rs.getInt("record"));
            fee.setId(rs.getInt("id"));
            fee.setCourseId(rs.getInt("CourseID"));
            fee.setTotalFee(rs.getBigDecimal("total_fee").doubleValue());
            fee.setPaidAmount(rs.getBigDecimal("paid_amount").doubleValue());
            fee.setDueAmount(rs.getBigDecimal("due_amount").doubleValue());
            return fee;
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return null;
}

public boolean updateFee(Fee fee) {
    String sql = "UPDATE fees SET total_fee = ?, paid_amount = ?, due_amount = ? WHERE record = ?";
    
    try (Connection conn = Database.getConnection(); 
         PreparedStatement ps = conn.prepareStatement(sql)) {
        
        ps.setBigDecimal(1, BigDecimal.valueOf(fee.getTotalFee()));
        ps.setBigDecimal(2, BigDecimal.valueOf(fee.getPaidAmount()));
        ps.setBigDecimal(3, BigDecimal.valueOf(fee.getDueAmount()));
        ps.setInt(4, fee.getRecord());
        
        int result = ps.executeUpdate();
        return result > 0;
        
    } catch (Exception e) {
        e.printStackTrace();
    }
    return false;
}
   
   
    public boolean deleteFee(int recordId) {
    String sql = "DELETE FROM fees WHERE record = ?";
    
    try (Connection conn = Database.getConnection(); 
         PreparedStatement ps = conn.prepareStatement(sql)) {
        
        ps.setInt(1, recordId);
        int result = ps.executeUpdate();
        return result > 0;
        
    } catch (Exception e) {
    }
    
    return false;
}

    
}
