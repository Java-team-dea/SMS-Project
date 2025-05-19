package com.controller;

import com.DAO.CourseDAO;
import com.util.Database;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/deleteCourse")
public class DeleteCourseServlet extends HttpServlet {
    
    private static final Logger logger = Logger.getLogger(DeleteCourseServlet.class.getName());
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        Connection conn = null;
        try {
            String idParam = request.getParameter("id");
            logger.log(Level.INFO, "Attempting to delete course with ID: {0}", idParam);
            
            if (idParam == null || idParam.isEmpty()) {
                response.sendRedirect("courseList.jsp?error=Course ID is required");
                return;
            }
            
            int courseId = Integer.parseInt(idParam);
            conn = Database.getConnection();
            conn.setAutoCommit(false); // Start transaction
            
            // First check if course exists
            if (!courseExists(conn, courseId)) {
                response.sendRedirect("courseList.jsp?error=Course not found");
                return;
            }
            
            // Check for dependent records
            if (hasDependentRecords(conn, courseId)) {
                response.sendRedirect("courseList.jsp?error=Cannot delete course - it has related records in other tables");
                return;
            }
            
            // Delete the course
            CourseDAO courseDAO = new CourseDAO();
            boolean isDeleted = courseDAO.deleteCourse(conn, courseId);
            
            if (isDeleted) {
                conn.commit(); // Commit transaction
                logger.log(Level.INFO, "Successfully deleted course with ID: {0}", courseId);
                response.sendRedirect("courseList.jsp?success=Course deleted successfully");
            } else {
                conn.rollback(); // Rollback transaction
                logger.log(Level.WARNING, "Failed to delete course with ID: {0}", courseId);
                response.sendRedirect("courseList.jsp?error=Failed to delete course");
            }
            
        } catch (NumberFormatException e) {
            rollbackQuietly(conn);
            logger.log(Level.WARNING, "Invalid Course ID format: {0}", e.getMessage());
            response.sendRedirect("courseList.jsp?error=Invalid Course ID format");
        } catch (SQLException e) {
            rollbackQuietly(conn);
            logger.log(Level.SEVERE, "Database error deleting course: {0}", e.getMessage());
            response.sendRedirect("courseList.jsp?error=Database error occurred");
        } catch (Exception e) {
            rollbackQuietly(conn);
            logger.log(Level.SEVERE, "Error deleting course: {0}", e.getMessage());
            response.sendRedirect("courseList.jsp?error=An error occurred while deleting the course");
        } finally {
            closeQuietly(conn);
        }
    }
    
    private boolean courseExists(Connection conn, int courseId) throws SQLException {
        String sql = "SELECT 1 FROM courses WHERE CourseID = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, courseId);
            try (ResultSet rs = stmt.executeQuery()) {
                return rs.next();
            }
        }
    }
    
    private boolean hasDependentRecords(Connection conn, int courseId) throws SQLException {
        // Check attendance table
        String sql = "SELECT 1 FROM attendance WHERE CourseID = ? LIMIT 1";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, courseId);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) return true;
            }
        }
        
        // Check fees table
        sql = "SELECT 1 FROM fees WHERE CourseID = ? LIMIT 1";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, courseId);
            try (ResultSet rs = stmt.executeQuery()) {
                return rs.next();
            }
        }
    }
    
    private void rollbackQuietly(Connection conn) {
        if (conn != null) {
            try {
                conn.rollback();
            } catch (SQLException e) {
                logger.log(Level.WARNING, "Error during rollback: {0}", e.getMessage());
            }
        }
    }
    
    private void closeQuietly(Connection conn) {
        if (conn != null) {
            try {
                conn.setAutoCommit(true); // Reset auto-commit
                conn.close();
            } catch (SQLException e) {
                logger.log(Level.WARNING, "Error closing connection: {0}", e.getMessage());
            }
        }
    }
}