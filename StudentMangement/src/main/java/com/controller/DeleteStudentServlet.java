package com.controller;

import com.util.Database;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet("/deleteStudent")
public class DeleteStudentServlet extends HttpServlet {
    private static final Logger LOGGER = Logger.getLogger(DeleteStudentServlet.class.getName());
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idStr = request.getParameter("id");
        
        if (idStr == null || idStr.trim().isEmpty()) {
            response.sendRedirect("studentList.jsp");
            return;
        }
        
        try {
            int id = Integer.parseInt(idStr);
            boolean success = deleteStudentWithDependencies(id);
            
            HttpSession session = request.getSession();
            if (success) {
                session.setAttribute("successMessage", "Student deleted successfully!");
            } else {
                session.setAttribute("errorMessage", "Failed to delete student. Please try again.");
            }
            
        } catch (NumberFormatException e) {
            LOGGER.log(Level.WARNING, "Invalid student ID format", e);
            HttpSession session = request.getSession();
            session.setAttribute("errorMessage", "Invalid student ID");
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error deleting student", e);
            HttpSession session = request.getSession();
            session.setAttribute("errorMessage", "An error occurred while deleting the student");
        }
        
        response.sendRedirect("studentList.jsp");
    }
    
    private boolean deleteStudentWithDependencies(int id) throws Exception {
        Connection conn = null;
        try {
            conn = Database.getConnection();
            conn.setAutoCommit(false); // Start transaction
            
            // Delete from grade table first
            deleteFromTable(conn, "DELETE FROM grade WHERE studentid = ?", id);
            
            // Delete from module table
            deleteFromTable(conn, "DELETE FROM module WHERE id = ?", id);
            
            // Delete from attendance table
            deleteFromTable(conn, "DELETE FROM attendance WHERE id = ?", id);
            
            // Delete from fees table
            deleteFromTable(conn, "DELETE FROM fees WHERE id = ?", id);
            
            // Finally delete from students table
            boolean studentDeleted = deleteFromTable(conn, "DELETE FROM Student WHERE id = ?", id);
            
            if (studentDeleted) {
                conn.commit();
                return true;
            } else {
                conn.rollback();
                return false;
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Transaction failed", e);
            if (conn != null) {
                try {
                    conn.rollback();
                } catch (SQLException ex) {
                    LOGGER.log(Level.SEVERE, "Rollback failed", ex);
                }
            }
            return false;
        } finally {
            if (conn != null) {
                try {
                    conn.setAutoCommit(true);
                    conn.close();
                } catch (SQLException e) {
                    LOGGER.log(Level.SEVERE, "Error closing connection", e);
                }
            }
        }
    }
    
    private boolean deleteFromTable(Connection conn, String sql, int id) throws SQLException {
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            LOGGER.log(Level.WARNING, "Error executing delete: " + sql, e);
            throw e;
        }
    }
}