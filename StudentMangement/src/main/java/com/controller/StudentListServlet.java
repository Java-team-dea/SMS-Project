package com.controller;

import com.DAO.StudentDAO;
import com.model.Student;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "StudentListServlet", urlPatterns = {"/StudentListServlet"})
public class StudentListServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            StudentDAO studentDAO = new StudentDAO();
            ArrayList<Student> studentList = studentDAO.getAllStudents();
            
            request.setAttribute("studentList", studentList);
            RequestDispatcher dispatcher = request.getRequestDispatcher("studentList.jsp");
            dispatcher.forward(request, response);
            
        } catch (Exception ex) {
            ex.printStackTrace();
            response.sendRedirect("studentList.jsp?error=Error+loading+students");
        }
    }
}