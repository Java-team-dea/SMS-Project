/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.controller;

import com.DAO.CourseDAO;
import com.DAO.GradeDAO;
import com.model.Courses;
import com.model.Grade;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/gradeList")



public class GradeViewServlet extends HttpServlet {


//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//       
//        GradeDAO gradeDAO = new GradeDAO();
//        
//        try {
//            ArrayList<Grade> grade = gradeDAO.getAllGrade();
//            request.setAttribute("gradeList", grade);
//            
//            RequestDispatcher dispatcher = request.getRequestDispatcher("gradeList.jsp");
//            dispatcher.forward(request, response);
//            
//        } catch (Exception ex) {
//            ex.printStackTrace();
//            // You might want to add error handling here
//            request.setAttribute("errorMessage", "Error retrieving grade list");
//            request.getRequestDispatcher("errorPage.jsp").forward(request, response);
//        }
//        
//    }

    
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    GradeDAO gradeDAO = new GradeDAO();
    
    try {
        ArrayList<Grade> grades = gradeDAO.getAllGrade();
        System.out.println("Number of grades retrieved: " + grades.size()); // Add this line
        request.setAttribute("gradeList", grades);
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("gradeList.jsp");
        dispatcher.forward(request, response);
        
    } catch (Exception ex) {
        ex.printStackTrace();
        request.setAttribute("errorMessage", "Error retrieving grade list");
        request.getRequestDispatcher("errorPage.jsp").forward(request, response);
    }
}
    
    
   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        GradeDAO gradeDAO =new GradeDAO();
//        
//         try {
//            ArrayList<Grade> grade=gradeDAO.getAllGrade();
//            request.setAttribute("gradeList", grade);
//            
//            RequestDispatcher dispatcher =request.getRequestDispatcher("gradeList.jsp");
//            dispatcher.forward(request, response);
//            
//            
//            
//        } catch (Exception ex) {
//            ex.printStackTrace();
//            
//        }



}
    
}
