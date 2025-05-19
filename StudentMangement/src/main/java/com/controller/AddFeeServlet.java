/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.controller;

import com.DAO.FeeDAO;
import com.model.Fee;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author dilshan
 */
public class AddFeeServlet extends HttpServlet {


 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
 
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int studentId = Integer.parseInt(request.getParameter("studentId"));
        int courseId = Integer.parseInt(request.getParameter("courseId"));
        double totalFee = Double.parseDouble(request.getParameter("totalFee"));
        double paidAmount = Double.parseDouble(request.getParameter("paidAmount"));
        double dueAmount = Double.parseDouble(request.getParameter("dueAmount"));

        Fee fee = new Fee();
        fee.setId(studentId);
        fee.setCourseId(courseId);
        fee.setTotalFee(totalFee);
        fee.setPaidAmount(paidAmount);
        fee.setDueAmount(dueAmount);

        FeeDAO dao = new FeeDAO();
        boolean isInserted = dao.addFee(fee);

        if (isInserted) {
            response.sendRedirect("feeList.jsp");
        } else {
            response.getWriter().println("Error adding fee record.");
        }
    }

}
