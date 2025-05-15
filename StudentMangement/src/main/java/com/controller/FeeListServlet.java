/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.controller;

import com.DAO.FeeDAO;
import com.model.Fee;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author oshee
 */
@WebServlet(name = "FeeListServlet", urlPatterns = {"/FeeListServlet"})
public class FeeListServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        FeeDAO FeeDAO = new FeeDAO();
        
        ArrayList<Fee> feeList = FeeDAO.getFeeList();
        request.setAttribute("feeList", feeList);

        RequestDispatcher dispacher = request.getRequestDispatcher("feeList.jsp");
        dispacher.forward(request, response);

    }

}
