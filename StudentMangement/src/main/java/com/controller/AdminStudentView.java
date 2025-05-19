/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.controller;

//import com.DAO.AdminDAO;
//import com.model.Admin;
//import com.model.Student;
//
//import java.io.IOException;
//import java.util.ArrayList;
//import javax.servlet.RequestDispatcher;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//@WebServlet(name = "ViewServlet", urlPatterns = {"/view", "/view/*"})
//public class AdminStudentView extends HttpServlet {
//
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//
//           AdminDAO adminDAO = new AdminDAO();
//        ArrayList<Student> student = adminDAO.getAllStudent();
//        request.setAttribute("studentList", student);
//
//        RequestDispatcher dispacher = request.getRequestDispatcher("studentList.jsp");
//        dispacher.forward(request, response);
//        
//    }
//
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//
//        AdminDAO adminDAO = new AdminDAO();
//        ArrayList<Student> student = adminDAO.getAllStudent();
//        request.setAttribute("studentList", student);
//
//        RequestDispatcher dispacher = request.getRequestDispatcher("studentList.jsp");
//        dispacher.forward(request, response);
//
//    }
//
//}






import com.DAO.AdminDAO;
import com.model.Admin;
import com.model.Student;

import java.io.IOException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ViewServlet", urlPatterns = {"/view", "/view/*"})
public class AdminStudentView extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            AdminDAO adminDAO = new AdminDAO();
            ArrayList<Student> student = adminDAO.getAllStudent();
            request.setAttribute("studentList", student);
            
            RequestDispatcher dispacher = request.getRequestDispatcher("studentList.jsp");
            dispacher.forward(request, response);
        } catch (Exception ex) {
            Logger.getLogger(AdminStudentView.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            AdminDAO adminDAO = new AdminDAO();
            ArrayList<Student> student = adminDAO.getAllStudent();
            request.setAttribute("studentList", student);
            
            RequestDispatcher dispacher = request.getRequestDispatcher("studentList.jsp");
            dispacher.forward(request, response);
        } catch (Exception ex) {
            Logger.getLogger(AdminStudentView.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}