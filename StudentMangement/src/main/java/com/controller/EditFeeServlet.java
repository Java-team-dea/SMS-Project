package com.controller;

import com.DAO.FeeDAO;
import com.model.Fee;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "EditFeeServlet", urlPatterns = {"/EditFeeServlet"})
public class EditFeeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    
    try {
        int recordId = Integer.parseInt(request.getParameter("id"));
        
        FeeDAO feeDAO = new FeeDAO();
        Fee fee = feeDAO.getFeeByRecord(recordId);
        
        if (fee == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Fee record not found");
            return;
        }
        
        request.setAttribute("fee", fee);
        RequestDispatcher dispatcher = request.getRequestDispatcher("editFee.jsp");
        dispatcher.forward(request, response);
    } catch (NumberFormatException e) {
        response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid fee record ID");
    }
}
    }
