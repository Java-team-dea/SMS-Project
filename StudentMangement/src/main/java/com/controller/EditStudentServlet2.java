package com.controller;

import com.DAO.StudentDAO;
import com.model.Student;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "EditStudentServlet2", urlPatterns = {"/EditStudentServlet2"})
public class EditStudentServlet2 extends HttpServlet {

   protected void doGet(HttpServletRequest request, HttpServletResponse response) 
        throws ServletException, IOException {
    
    System.out.println("EditStudentServlet2 - Start processing request");
    
    try {
        String idParam = request.getParameter("id");
        System.out.println("Received student ID parameter: " + idParam);
        
        if (idParam == null || idParam.isEmpty()) {
            System.out.println("Error: No ID parameter provided");
            response.sendRedirect("studentList.jsp?error=Student+ID+is+required");
            return;
        }
        
        int studentId;
        try {
            studentId = Integer.parseInt(idParam);
            System.out.println("Parsed student ID: " + studentId);
        } catch (NumberFormatException e) {
            System.out.println("Error: Invalid student ID format");
            response.sendRedirect("studentList.jsp?error=Invalid+student+ID+format");
            return;
        }
        
        StudentDAO studentDAO = new StudentDAO();
        System.out.println("Attempting to fetch student with ID: " + studentId);
        
        Student student = studentDAO.getStudentById(studentId);
        
        if (student != null) {
            System.out.println("Successfully retrieved student: " + student.getName());
            request.setAttribute("student", student);
            System.out.println("Forwarding to editStudent.jsp");
            request.getRequestDispatcher("editStudent.jsp").forward(request, response);
        } else {
            System.out.println("Error: No student found with ID: " + studentId);
            response.sendRedirect("studentList.jsp?error=Student+not+found");
        }
    } catch (Exception e) {
        System.out.println("Unexpected error: " + e.getMessage());
        e.printStackTrace();
        response.sendRedirect("studentList.jsp?error=Unexpected+error");
    }
}
}