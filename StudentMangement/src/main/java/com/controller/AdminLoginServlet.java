/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.controller;

import com.DAO.AdminDAO;
import com.model.Admin;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author dilshan
 */
public class AdminLoginServlet extends HttpServlet {



  

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      try {
            Admin admin=new Admin();
            admin.setEmail(request.getParameter("email"));
            admin.setPassword(request.getParameter("password"));
            
            AdminDAO adminDAO=new AdminDAO();
            
            
            boolean status=adminDAO.validateAdmin(admin);

            if (status) {
                int count=adminDAO.countAllStudents();
                int dcount=adminDAO.countAllFaculty();
                int Ccount=adminDAO.countAllCourse();
                
                
                
                request.setAttribute("dcount", dcount);
                request.setAttribute("Ccount", Ccount);
                request.setAttribute("total", count);
                System.out.println("Test student count: " + count);
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("adminDashboard.jsp");
                
                requestDispatcher.forward(request, response);
            }
            else {
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("login.jsp");
                requestDispatcher.forward(request, response);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        
    }

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        
        
        try {
            Admin admin=new Admin();
            admin.setEmail(request.getParameter("email"));
            admin.setPassword(request.getParameter("password"));
            
            AdminDAO adminDAO=new AdminDAO();
            
            
            boolean status=adminDAO.validateAdmin(admin);

            if (status) {
                int count=adminDAO.countAllStudents();
                int dcount=adminDAO.countAllFaculty();
                int Ccount=adminDAO.countAllCourse();
                
                
                
                request.setAttribute("dcount", dcount);
                request.setAttribute("Ccount", Ccount);
                request.setAttribute("total", count);
                System.out.println("Test student count: " + count);
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("adminDashboard.jsp");
                
                requestDispatcher.forward(request, response);
            }
            else {
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("login.jsp");
                requestDispatcher.forward(request, response);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        

        } 
    }
        
        
      
    

  


