# Student Management System - NSBM Green University

A comprehensive web-based system designed to eliminate common issues faced by universities in handling student data manually—delays, mistakes, and inefficiency.

## Introduction

The Student Management System (SMS) is designed to eliminate the common issues faced by universities in handling student data manually—delay, mistakes, and inefficiency. With key features like course enrollment, attendance records, and record-keeping automated, the system improves accuracy, conserves time, and enables better academic decision-making. Developed with Java EE technologies, the web-based system ensures convenient accessibility, real-time tracking, and enhanced communication among students, lecturers, and administrators.

## Problem Statement

Universities today face numerous challenges in managing student information efficiently and securely:

- **Lack of real-time data communication and dynamic management**: Traditional student record systems often rely on static or offline methods, which delay updates and limit timely access to crucial information.
  
- **Data security concerns**: The system implements multiple protection layers including secure form submission methods and back-end encapsulation.

- **SQL injection prevention**: The application uses prepared statements for all database queries, ensuring user inputs are treated as data rather than executable code.

- **User experience enhancement**: The system incorporates real-time feedback mechanisms such as popup confirmation messages and alerts.

## Target Users

### Students
- Self-service portal for registration
- Access to core services (personal profiles, courses, attendance records, grades, payment records)

### Administrators
- Full control over the system
- Management of student records, courses, grades, finances, and reports
- Approval of registrations, management of payments, and updating of sensitive scholastic details

## Key Functional Features

- **Student Registration and Profile Management**: Students can register, update personal details, and track scholastic progress.
- **Course Management**: Course creator, updater, or remover and student assignments.
- **Grade and Result Management**: Secure grade input and release.
- **Attendance Tracking**: Electronic attendance marking with real-time status.
- **Payment and Installment Management**: Management of partial payments in installments.
- **Safe Login and Role-Based Access**: Separate dashboards for different user roles.

## System Architecture

The Student Management System is built on the Model-View-Controller (MVC) architecture, which separates business logic, user interface, and data control into three distinct layers. The application is based on Java EE technologies such as Servlets and JSP, and the relational database employed is MySQL.

### Component Interaction
- **Java EE**: Implements application logic through Servlets and JSPs
- **MySQL Database**: Sustains relational data with integrity and reliability
- **Prepared Statements**: Used for database operations to prevent SQL injection attacks

### Package Structure
- **com.sms.controller**: Responds to routing and request handling
- **com.sms.model**: Stores JavaBeans (POJOs) with getter and setter methods
- **com.sms.dao**: Performs database activities (CRUD) through Prepared Statements
- **com.sms.util**: Stores utility classes such as DBConnection.java

## Database Schema

The database contains 10 main tables:

1. **Admin**: Stores administrator controls and credentials
2. **Faculty**: Stores faculty member profiles and departments
3. **Department**: Defines academic departments
4. **Student**: Stores student registration details
5. **Courses**: Lists course offerings by department
6. **Attendance**: Stores student attendance history
7. **Grade**: Stores exam scores and GPA information
8. **Fees**: Stores student payments and installment plans
9. **Modules**: Defines subject-level modules in each course
10. **Other related tables**

## Technologies Used

- **JSP (JavaServer Pages) and Servlets**: For frontend request and backend logic processing
- **JDBC (Java Database Connectivity)**: For database communication using MySQL
- **CSS, JavaScript, Bootstrap, and jQuery**: For responsive and interactive user interface
- **Maven**: For dependency management and project structure

## Development Tools

- **NetBeans IDE**: Main development environment
- **Apache Tomcat**: Container for the servlet
- **MySQL**: Relational database system
- **Git & GitHub**: Version control and codebase management

## Challenges Faced

- **Increased Code Complexity**: Raw servlets contained more lines of code compared to modern frameworks
- **Bug Fixing and Debugging**: Issues with servlet mapping, session management, and MVC integration
- **Learning Curve**: Gaining first-hand experience with Java EE architecture and team collaboration

## Future Enhancements

- **SMS or email notification system**: For sending automatic reminders about deadlines, exams, etc.
- **Mobile-friendly version or Android application**: For improved accessibility
- **Role-based dashboards**: Tailored interfaces for different users
- **Report generator module**: For exporting records as PDF reports
- **Integration with newer technologies**: Such as Spring Boot and Hibernate
- **Parent access portal**: To view their child's details
- **Additional modules**: Including automated course scheduling, improved reporting dashboards, and integration with web-based learning tools

## Team Members

| Student ID | Name | Contribution |
|------------|------|--------------|
| 34227 | D T D Wijerathna | Database design, Student/Course/Grade features, GitHub management |
| 32511 | G W L Madhuranga | Homepage and admin JSPs |
| 32774 | A A H Eranga | Student area JSPs |
| 34222 | R O M Jayawardhana | Attendance and fees management |
| 32360 | M K S I Matharage | Student Dashboard backend |
| 34223 | T A S Madhusanka | Admin Dashboard update/edit features |
| 34244 | M H S Perera | Admin Dashboard delete features |
| 32453 | M K R M Deshapriya | JSPs, servlets, UML diagrams, reports |
| 32563 | R G A C Mandira | Servlet debugging, database design support |
| 34210 | G B R Laksara | Report writing, database/servlet debugging |

## Demo Videos

- [Student Management](https://youtu.be/t-Xa3jjgfiQ?si=KHZzrK-ANQ_z4IaV)
- [Course Management](https://youtu.be/XZb6pvg3SHE?si=KW19etxpy-nFAnas)
- [Grade Management](https://youtu.be/KcYwG9BjyIc?si=2AkGXg-Cgt3cMrY8)
- [Fee Management](https://youtu.be/FJcSeXzXLIE?si=ziu8PeYT-jJK45ZF)
- [Attendance Management](https://youtu.be/BRskEY9H-jk?si=sxLNOdA9qAO20GaN)
