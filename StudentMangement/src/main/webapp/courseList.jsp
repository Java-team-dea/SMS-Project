<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Portal | Manage Courses</title>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        :root {
            --primary-color: #009245;
            --secondary-color: #00692f;
            --accent-color: #e8f5e9;
            --dark-color: #212529;
            --light-color: #f8f9fa;
            --gray-100: #f0f2f5;
            --gray-200: #e5e7eb;
            --gray-300: #d1d5db;
            --gray-600: #6c757d;
            --shadow-sm: 0 2px 4px rgba(0, 0, 0, 0.05);
            --shadow: 0 4px 15px rgba(0, 0, 0, 0.08);
            --shadow-md: 0 8px 25px rgba(0, 0, 0, 0.12);
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: var(--gray-100);
            position: relative;
            min-height: 100vh;
        }
        
        body::before {
            content: '';
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: linear-gradient(135deg, rgba(0, 146, 69, 0.7) 0%, rgba(0, 105, 47, 0.7) 100%);
            z-index: -1;
        }

        .app-wrapper {
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        /* Header Styles */
        .app-header {
            background-color: rgba(255, 255, 255, 0.95);
            border-bottom: 3px solid var(--primary-color);
            box-shadow: 0 2px 15px rgba(0, 0, 0, 0.1);
            position: relative;
            z-index: 100;
        }

        .university-brand {
            display: flex;
            align-items: center;
        }

        .university-logo {
            height: 45px;
            width: auto;
        }

        .university-name {
            color: var(--primary-color);
            font-weight: 700;
            font-size: 1.2rem;
            letter-spacing: 0.5px;
            margin-bottom: 0;
        }

        .university-system {
            font-size: 0.75rem;
            color: var(--gray-600);
            margin-bottom: 0;
        }

        .admin-badge {
            background-color: #3949AB;
            font-size: 0.7rem;
            padding: 0.25rem 0.5rem;
            border-radius: 30px;
            font-weight: 500;
            color: white;
            margin-left: 0.5rem;
            letter-spacing: 0.5px;
        }

        /* Content Area */
        .content-wrapper {
            flex: 1;
            padding: 2rem 0;
            position: relative;
            z-index: 10;
        }

        /* Main Content Card */
        .content-card {
            background-color: rgba(255, 255, 255, 0.98);
            border-radius: 16px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.15);
            overflow: hidden;
            backdrop-filter: blur(10px);
            margin-bottom: 2rem;
        }

        .content-header {
            padding: 1.25rem 1.5rem;
            border-bottom: 1px solid var(--gray-200);
            position: relative;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .content-header:after {
            content: '';
            position: absolute;
            bottom: -1px;
            left: 1.5rem;
            width: 50px;
            height: 3px;
            background: linear-gradient(90deg, var(--primary-color), var(--secondary-color));
        }

        .content-header h4 {
            font-weight: 600;
            font-size: 1.25rem;
            margin-bottom: 0;
        }

        .content-body {
            padding: 1.5rem;
        }

        /* Table Styles */
        .table {
            margin-bottom: 0;
        }

        .table thead th {
            background-color: var(--accent-color);
            color: var(--dark-color);
            font-weight: 600;
            border-top: none;
            border-bottom: 2px solid var(--primary-color);
        }

        .table tbody tr:hover {
            background-color: rgba(232, 245, 233, 0.5);
        }

        /* Action Buttons */
        .btn-action {
            padding: 0.25rem 0.5rem;
            font-size: 0.8125rem;
            border-radius: 6px;
            margin-right: 0.25rem;
        }

        .btn-edit {
            background-color: #10b981;
            color: white;
        }

        .btn-edit:hover {
            background-color: #059669;
            color: white;
        }

        .btn-delete {
            background-color: #ef4444;
            color: white;
        }

        .btn-delete:hover {
            background-color: #dc2626;
            color: white;
        }

        /* Add Button */
        .btn-add {
            background: linear-gradient(135deg, var(--primary-color) 0%, var(--secondary-color) 100%);
            color: white;
            border: none;
            font-weight: 600;
            padding: 0.5rem 1rem;
            border-radius: 8px;
            transition: all 0.3s ease;
        }
        
        .btn-add:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 146, 69, 0.3);
            background: linear-gradient(135deg, var(--primary-color) 20%, var(--secondary-color) 100%);
            color: white;
        }

        /* Footer */
        .app-footer {
            background-color: rgba(33, 37, 41, 0.95);
            padding: 1.5rem 0;
            color: white;
            position: relative;
            z-index: 10;
            margin-top: auto;
        }

        .footer-content {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .footer-copyright {
            font-size: 0.875rem;
            opacity: 0.8;
        }

        /* Responsive Adjustments */
        @media (max-width: 768px) {
            .university-brand {
                max-width: 200px;
            }
            
            .university-name {
                font-size: 1rem;
            }
            
            .content-header {
                flex-direction: column;
                align-items: flex-start;
                gap: 1rem;
            }
            
            .footer-content {
                flex-direction: column;
                gap: 1rem;
                text-align: center;
            }
        }
    </style>
</head>
<body>
    <div class="app-wrapper">
        <!-- Header -->
        <header class="app-header py-3">
            <div class="container">
                <div class="d-flex justify-content-between align-items-center">
                    <a href="adminDashboard.jsp" class="text-decoration-none university-brand">
                        <img src="images/university-logo.png" alt="University Logo" class="university-logo me-3">
                        <div>
                            <h1 class="university-name">NSBM GREEN UNIVERSITY</h1>
                            <div class="d-flex align-items-center">
                                <p class="university-system">Student Management System</p>
                                <span class="admin-badge">ADMIN PORTAL</span>
                            </div>
                        </div>
                    </a>
                    
                    <div class="dropdown">
                        <button class="btn btn-light dropdown-toggle d-flex align-items-center gap-2" type="button" id="userMenu" data-bs-toggle="dropdown" aria-expanded="false">
                            <div class="d-flex align-items-center">
                                <div class="rounded-circle bg-primary text-white d-flex align-items-center justify-content-center" style="width: 32px; height: 32px;">
                                    A
                                </div>
                                <span class="ms-2 d-none d-md-inline">Admin</span>
                            </div>
                        </button>
                        <ul class="dropdown-menu dropdown-menu-end shadow border-0" aria-labelledby="userMenu">
                            <li><a class="dropdown-item" href="#"><i class="fas fa-user me-2 text-primary"></i> My Profile</a></li>
                            <li><a class="dropdown-item" href="#"><i class="fas fa-cog me-2 text-primary"></i> Settings</a></li>
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item text-danger" href="LogoutServlet"><i class="fas fa-sign-out-alt me-2"></i> Logout</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </header>

        <!-- Main Content -->
        <main class="content-wrapper">
            <div class="container">
                <div class="content-card">
                    <div class="content-header">
                        <h4><i class="fas fa-book me-2"></i> Manage Courses</h4>
                        <a href="addCourse.jsp" class="btn btn-add">
                            <i class="fas fa-plus me-2"></i> Add New Course
                        </a>
                    </div>
                    <div class="content-body">
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                     
                                        <th>Course Name</th>
                                        <th>Duration</th>
                                        <th>Credits</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>  
                                <form action="CourseViewServlet" method="post">
                                    <button type="submit" class="btn btn-success">View</button>
                                </form>
                                    
                                    
                                    <c:forEach var="course" items="${courseList}">
                                        <tr>
                                            <td>${course.name}</td>
                                            <td>${course.duration}</td>
                                            <td>${course.credits}</td>
                                            <td>
                                                <a href="EditCourseServlet1?id=${course.courseID}" class="btn btn-action btn-edit">
                                                    <i class="fas fa-edit"></i> Edit
                                                </a>
                                                <a href="deleteCourse?id=${course.courseID}" class="btn btn-action btn-delete" 
                                                   onclick="return confirm('Are you sure you want to delete this course?')">
                                                    <i class="fas fa-trash-alt"></i> Delete
                                                </a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </main>

        <!-- Footer -->
        <footer class="app-footer">
            <div class="container">
                <div class="footer-content">
                    <div class="footer-copyright">
                        © 2025 NSBM Green University. All Rights Reserved.
                    </div>
                </div>
            </div>
        </footer>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
      
    <script>
        <%
            String successMessage = (String) request.getAttribute("successMessage");
            if (successMessage != null) {
        %>
                swal("Success!", "<%= successMessage %>", "success");
        <%
            }
            
            String errorMessage = (String) request.getAttribute("errorMessage");
            if (errorMessage != null) {
        %>
                swal("Error!", "<%= errorMessage %>", "error");
        <%
            }
        %>
    </script>
    
</body>
</html>