/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.controller;

import com.DAO.CourseDAO;
import com.model.Courses;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(
    name = "CourseViewServlet",
    urlPatterns = {"/CourseViewServlet"})




public class CourseViewServlet extends HttpServlet {

    
   

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
            CourseDAO courseDAO =new CourseDAO();
        try {
            ArrayList<Courses> course=courseDAO.getAllCourses();
            request.setAttribute("courseList", course);
            
            RequestDispatcher dispatcher =request.getRequestDispatcher("courseList.jsp");
            dispatcher.forward(request, response);
            
            
            
        } catch (Exception ex) {
            ex.printStackTrace();
            
        }
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CourseDAO courseDAO =new CourseDAO();
        try {
            ArrayList<Courses> course=courseDAO.getAllCourses();
            request.setAttribute("courseList", course);
            
            RequestDispatcher dispatcher =request.getRequestDispatcher("courseList.jsp");
            dispatcher.forward(request, response);
            
            
            
        } catch (Exception ex) {
            ex.printStackTrace();
            
        }
        
        
    }

  
  
}
