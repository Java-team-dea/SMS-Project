//package com.controller;
//
//import com.DAO.StudentDAO;
//import com.google.protobuf.TextFormat.ParseException;
//import com.model.Student;
//import java.io.IOException;
//import java.sql.Date;
//import java.text.SimpleDateFormat;
//import java.util.Enumeration;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//@WebServlet(name = "UpdateStudentServlet1", urlPatterns = {"/UpdateStudentServlet1"})
//public class UpdateStudentServlet1 extends HttpServlet {
//
//   protected void doPost(HttpServletRequest request, HttpServletResponse response)
//        throws ServletException, IOException {
//    
//    System.out.println("UpdateStudentServlet1 - Starting update process");
//    
//    try {
//        // 1. Get and validate ID parameter
//        String idParam = request.getParameter("id");
//        if (idParam == null || idParam.isEmpty()) {
//            response.sendRedirect("studentList.jsp?error=Student+ID+is+required");
//            return;
//        }
//        int studentId = Integer.parseInt(idParam);
//        
//        // 2. Debug print all parameters
//        System.out.println("Received parameters:");
//        Enumeration<String> params = request.getParameterNames();
//        while(params.hasMoreElements()) {
//            String paramName = params.nextElement();
//            System.out.println(paramName + ": " + request.getParameter(paramName));
//        }
//        
//        // 3. Get and validate all form parameters with better date handling
//        String name = request.getParameter("name");
//        String gender = request.getParameter("gender");
//        String nic = request.getParameter("nic");
//        String email = request.getParameter("email");
//        String phone = request.getParameter("phone");
//        String address = request.getParameter("address");
////        String facultyName = request.getParameter("facultyName");
//         String facultyid = request.getParameter("FacultyID");
//        int departmentID = Integer.parseInt(request.getParameter("departmentID"));
//        
//        // Date handling with validation
//        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//        java.util.Date utilDob = sdf.parse(request.getParameter("dob"));
//        Date dob = new Date(utilDob.getTime());
//        
//        java.util.Date utilEnrollmentDate = sdf.parse(request.getParameter("enrollmentDate"));
//        Date enrollmentDate = new Date(utilEnrollmentDate.getTime());
//        
//        // 4. Create Student object with updated data
//        Student student = new Student();
//        student.setId(studentId);
//        student.setName(name);
//        student.setDob(dob);
//        student.setGender(gender);
//        student.setNic(nic);
//        student.setEmail(email);
//        student.setPhone(phone);
//        student.setAddress(address);
//        student.setEnrollmentDate(enrollmentDate);
////        student.setFacultyName(facultyName);
//        student.setDepartmentID(departmentID);
//        
//        System.out.println("Student object prepared for update: " + student.toString());
//        
//        // 5. Perform update
//        StudentDAO studentDAO = new StudentDAO();
//        boolean success = studentDAO.updateStudent(student);
//        
//        // 6. Handle result
//        if (success) {
//            System.out.println("Update successful for student ID: " + studentId);
//            response.sendRedirect("StudentListServlet?success=Student+updated+successfully");
//        } else {
//            System.out.println("Update failed for student ID: " + studentId);
//            response.sendRedirect("EditStudentServlet2?id=" + studentId + "&error=Update+failed");
//        }
//        
//    } catch (ParseException e) {
//        System.out.println("Date parsing error: " + e.getMessage());
//        response.sendRedirect("studentList.jsp?error=Invalid+date+format+Please+use+YYYY-MM-DD");
//    } catch (NumberFormatException e) {
//        System.out.println("Number format error: " + e.getMessage());
//        response.sendRedirect("studentList.jsp?error=Invalid+number+format");
//    } catch (Exception e) {
//        System.out.println("Unexpected error: " + e.getMessage());
//        e.printStackTrace();
//        response.sendRedirect("studentList.jsp?error=Unexpected+error+during+update");
//    }
//}
//}


package com.controller;

import com.DAO.StudentDAO;
import com.model.Student;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Enumeration;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "UpdateStudentServlet1", urlPatterns = {"/UpdateStudentServlet1"})
public class UpdateStudentServlet1 extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        System.out.println("UpdateStudentServlet1 - Starting update process");
        
        try {
            // 1. Get and validate ID parameter
            String idParam = request.getParameter("id");
            if (idParam == null || idParam.isEmpty()) {
                response.sendRedirect("studentList.jsp?error=Student+ID+is+required");
                return;
            }
            int studentId = Integer.parseInt(idParam);
            
            // 2. Debug print all parameters
            System.out.println("Received parameters:");
            Enumeration<String> params = request.getParameterNames();
            while(params.hasMoreElements()) {
                String paramName = params.nextElement();
                System.out.println(paramName + ": " + request.getParameter(paramName));
            }
            
            // 3. Get and validate all form parameters with better date handling
            String name = request.getParameter("name");
            String gender = request.getParameter("gender");
            String nic = request.getParameter("nic");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");
            int facultyID = Integer.parseInt(request.getParameter("facultyID"));
            int departmentID = Integer.parseInt(request.getParameter("departmentID"));
            int courseID = Integer.parseInt(request.getParameter("courseID"));
            
            // Date handling with validation
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date utilDob = sdf.parse(request.getParameter("dob"));
            Date dob = new Date(utilDob.getTime());
            
            java.util.Date utilEnrollmentDate = sdf.parse(request.getParameter("enrollmentDate"));
            Date enrollmentDate = new Date(utilEnrollmentDate.getTime());
            
            // 4. Create Student object with updated data
            Student student = new Student();
            student.setId(studentId);
            student.setName(name);
            student.setDob(dob);
            student.setGender(gender);
            student.setNic(nic);
            student.setEmail(email);
            student.setPhone(phone);
            student.setAddress(address);
            student.setEnrollmentDate(enrollmentDate);
            student.setFacultyID(facultyID);
            student.setDepartmentID(departmentID);
            student.setCourseID(courseID);
            
            System.out.println("Student object prepared for update: " + student.toString());
            
            // 5. Perform update
            StudentDAO studentDAO = new StudentDAO();
            boolean success = studentDAO.updateStudent(student);
            
            // 6. Handle result
            if (success) {
                System.out.println("Update successful for student ID: " + studentId);
                response.sendRedirect("StudentListServlet?success=Student+updated+successfully");
            } else {
                System.out.println("Update failed for student ID: " + studentId);
                response.sendRedirect("EditStudentServlet2?id=" + studentId + "&error=Update+failed");
            }
            
        } catch (java.text.ParseException e) {
            System.out.println("Date parsing error: " + e.getMessage());
            response.sendRedirect("studentList.jsp?error=Invalid+date+format+Please+use+YYYY-MM-DD");
        } catch (NumberFormatException e) {
            System.out.println("Number format error: " + e.getMessage());
            response.sendRedirect("studentList.jsp?error=Invalid+number+format");
        } catch (Exception e) {
            System.out.println("Unexpected error: " + e.getMessage());
            e.printStackTrace();
            response.sendRedirect("studentList.jsp?error=Unexpected+error+during+update");
        }
    }
}