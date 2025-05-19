/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.controller;

import com.DAO.GradeDAO;
import com.model.Grade;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//@WebServlet(
//    name = "ManageGradesServlet",
//    urlPatterns = {"/ManageGradesServlet"}
//  
//)
public class ManageGradesServlet extends HttpServlet {


    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

  
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
       
        
        int stuid=Integer.parseInt(request.getParameter("studentId"));
        
        String moduleid=request.getParameter("moduleid");
        
        String value=request.getParameter("grade");
        

        
        Grade grade=new Grade();
       grade.setGrade(value);
       grade.setModuleid(moduleid);
       grade.setStudentid(stuid);
       
       GradeDAO gradeDAO= new GradeDAO();
        try {
            gradeDAO.addGrade(grade);
        } catch (Exception ex) {
                
            
            ex.printStackTrace();
                
        }
       
        RequestDispatcher dispacher=request.getRequestDispatcher("gradeList.jsp");
         dispacher.forward(request, response);
      
    }

  

}
