/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Invalidate the session if one exists (logout the student)
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();  // Logout the student
        }

        // Prevent the browser from caching the profile page or other pages after logout
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
        response.setHeader("Pragma", "no-cache"); // HTTP 1.0
        response.setDateHeader("Expires", 0); // Proxies

        // Redirect to the login page
        response.sendRedirect("studentLogin.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Logs out the student by invalidating the session and redirecting to the login page";
    }
}
