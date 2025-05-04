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
        
       

      
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        
         String email=request.getParameter("email");
        
        String password=request.getParameter("password");
        
         Admin admin=new Admin();
        admin.setEmail(request.getParameter("email"));
        admin.setPassword(request.getParameter("password"));
        
         
        AdminDAO admindao=new AdminDAO();

        try {
            boolean status=admindao.validateAdmin(admin);

            if (status) {
//                Admin admDetails=admindao.getOne(customer);
//                System.out.println("cusdetails"+cusDetails);
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("adminDashboard.jsp");
//                request.setAttribute("customer",admDetails);
                requestDispatcher.forward(request, response);
            }
            else {
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("login.jsp");
                requestDispatcher.forward(request, response);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        
        
        
    }

    
   
}
