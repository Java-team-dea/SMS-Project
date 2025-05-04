/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.controller;

import com.DAO.AdminDAO;
import com.model.Admin;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author dilshan
 */
public class AdminStudentView extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      
  AdminDAO adminDAO=new AdminDAO();
  ArrayList<Admin> admin=adminDAO.getAllStudent();
          request.setAttribute("studentList", admin);
    
         RequestDispatcher dispacher=request.getRequestDispatcher("studentList.jsp");
         dispacher.forward(request, response);
        
        

}
    
}