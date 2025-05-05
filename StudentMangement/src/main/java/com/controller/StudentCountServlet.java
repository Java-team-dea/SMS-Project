///*
// * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
// * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
// */
//package com.controller;
//
//import com.DAO.AdminDAO;
//import java.io.IOException;
//import java.io.PrintWriter;
//import java.util.logging.Level;
//import java.util.logging.Logger;
//import javax.servlet.RequestDispatcher;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//
//public class StudentCountServlet extends HttpServlet {
//
//
//
//    
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        
//              AdminDAO admindao= new AdminDAO();
//        try {
//            int count=admindao.countAllStudents();
//            System.out.println(count);
//            
//          request.setAttribute("count", count);
//            
//            RequestDispatcher dispatcher=request.getRequestDispatcher("adminDashboard.jsp");
//            dispatcher.forward(request, response);
//            
//        } 
//        
//        catch (Exception ex) {
//            
//        }
//    }
//
//    
//    
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        
//  
//        
//        
//        
//        
//    }
//
//   
//
//}
