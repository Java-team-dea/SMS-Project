<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    // Prevent browser caching
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0
    response.setDateHeader("Expires", 0); // Proxies

    // Check if student is logged in
    if (session.getAttribute("student") == null) {
        response.sendRedirect("studentLogin.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Student Portal | My Courses</title>
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

            .student-badge {
                background-color: #FF5722;
                font-size: 0.7rem;
                padding: 0.25rem 0.5rem;
                border-radius: 30px;
                font-weight: 500;
                color: white;
                margin-left: 0.5rem;
                letter-spacing: 0.5px;
            }

            .profile-btn {
                background-color: var(--light-color);
                border: 1px solid var(--gray-200);
                transition: all 0.3s ease;
            }

            .profile-btn:hover {
                background-color: var(--accent-color);
            }

            /* Content Area */
            .content-wrapper {
                flex: 1;
                padding: 2rem 0;
                position: relative;
                z-index: 10;
            }

            /* Sidebar */
            .sidebar {
                background-color: rgba(255, 255, 255, 0.98);
                border-radius: 16px;
                box-shadow: 0 10px 30px rgba(0, 0, 0, 0.15);
                overflow: hidden;
                backdrop-filter: blur(10px);
            }

            .sidebar-header {
                padding: 1.25rem 1.5rem;
                border-bottom: 1px solid var(--gray-200);
                position: relative;
            }

            .sidebar-header:after {
                content: '';
                position: absolute;
                bottom: -1px;
                left: 1.5rem;
                width: 50px;
                height: 3px;
                background: linear-gradient(90deg, var(--primary-color), var(--secondary-color));
            }

            .sidebar-header h5 {
                font-weight: 600;
                font-size: 1rem;
                margin-bottom: 0;
            }

            .sidebar-nav {
                padding: 1rem 0;
            }

            .nav-link {
                color: var(--dark-color);
                padding: 0.75rem 1.5rem;
                font-weight: 500;
                display: flex;
                align-items: center;
                border-left: 3px solid transparent;
                transition: all 0.3s ease;
            }

            .nav-link i {
                width: 1.25rem;
                margin-right: 0.75rem;
                text-align: center;
                color: var(--primary-color);
            }

            .nav-link:hover {
                background-color: var(--accent-color);
                color: var(--primary-color);
            }

            .nav-link.active {
                color: var(--primary-color);
                background-color: var(--accent-color);
                border-left-color: var(--primary-color);
                font-weight: 600;
            }

            .nav-link.logout {
                color: #ef4444;
            }

            .nav-link.logout:hover {
                background-color: #fee2e2;
                color: #ef4444;
            }

            /* Card Styles */
            .dashboard-card {
                background-color: rgba(255, 255, 255, 0.98);
                border-radius: 16px;
                box-shadow: 0 10px 30px rgba(0, 0, 0, 0.15);
                overflow: hidden;
                backdrop-filter: blur(10px);
                margin-bottom:.2rem;
            }

            .dashboard-header {
                padding: 1.25rem 1.5rem;
                border-bottom: 1px solid var(--gray-200);
                position: relative;
            }

            .dashboard-header:after {
                content: '';
                position: absolute;
                bottom: -1px;
                left: 1.5rem;
                width: 50px;
                height: 3px;
                background: linear-gradient(90deg, var(--primary-color), var(--secondary-color));
            }

            .dashboard-header h4 {
                font-weight: 600;
                font-size: 1.25rem;
                margin-bottom: 0;
            }

            .dashboard-body {
                padding: 1.5rem;
            }

            /* Raw Course Display */
            .raw-enrollment-container {
                border-left: 4px solid var(--primary-color);
                background-color: white;
                border-radius: 8px;
                box-shadow: var(--shadow);
            }

            .enrollment-header {
                background-color: var(--gray-100);
                padding: 1rem 1.5rem;
                border-bottom: 1px solid var(--gray-200);
                display: flex;
                justify-content: space-between;
                align-items: center;
            }

            .course-title {
                font-size: 1.25rem;
                font-weight: 600;
                color: var(--primary-color);
                margin-bottom: 0;
            }

            .course-code {
                font-size: 0.9rem;
                color: var(--gray-600);
                font-weight: 500;
            }

            .enrollment-body {
                padding: 1.5rem;
            }

            .course-info {
                display: flex;
                flex-wrap: wrap;
                gap: 1.5rem;
                margin-bottom: 1rem;
            }

            .info-item {
                flex: 1;
                min-width: 150px;
            }

            .info-label {
                font-size: 0.85rem;
                color: var(--gray-600);
                margin-bottom: 0.25rem;
                text-transform: uppercase;
                letter-spacing: 0.5px;
            }

            .info-value {
                font-size: 1.1rem;
                font-weight: 500;
            }

            .course-description {
                margin-top: 1.5rem;
                padding-top: 1.5rem;
                border-top: 1px solid var(--gray-200);
            }

            .status-badge {
                padding: 0.35rem 1rem;
                border-radius: 30px;
                font-weight: 600;
                font-size: 0.8rem;
                text-transform: uppercase;
                letter-spacing: 0.5px;
            }

            .status-active {
                background-color: #e8f5e9;
                color: var(--primary-color);
                border: 1px solid var(--primary-color);
            }

            /* Page Title */
            .page-title-wrapper {
                background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
                color: white;
                border-radius: 16px;
                margin-bottom: 1.5rem;
                padding: 1.5rem;
                position: relative;
                overflow: hidden;
            }

            .page-title-wrapper::before {
                content: '';
                position: absolute;
                top: 0;
                right: 0;
                width: 300px;
                height: 100%;
                background-image: url('data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMzAwIiBoZWlnaHQ9IjIwMCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48cGF0aCBkPSJNMTc2LjExNSAwSDBWMjAwaDMwMFYwSDE3Ni4xMTVaTTI1LjQyMyAxNjcuMDc2QzEyLjgxOCAxMzUuNDY3IDQxLjY1NyA5OC43MTkgNzUuMTc5IDExMC41MDRjMzMuNTIyIDExLjc4NSA3OC41OTYtMTYuNTQgOTcuNDI5LTU2LjM4NUM5MS4yNjMgNDIuMjA3IDEzOC41MzYgMS4zNDkgMTg4LjM5MyA5LjQ1MmM0OS44NTYgOC4xMDIgOTIuNTIgNzcuMjI0IDEwMS4wOTcgMTQzLjM5NC04LjU3NyA2Ni4xNy05Ni4yMDQgODkuNzg3LTE2Mi42NjggNjYuOTU3LTY2LjQ2NS0yMi44My02OS45OTUtMTQuNzcyLTEwMS4zOTktNTIuNzI3WiIgZmlsbD0icmdiYSgyNTUsIDI1NSwgMjU1LCAwLjEpIi8+PC9zdmc+');
                background-repeat: no-repeat;
                background-position: right top;
                opacity: 0.3;
            }

            .page-title {
                font-size: 1.5rem;
                font-weight: 700;
                margin-bottom: 0.5rem;
                position: relative;
                z-index: 1;
            }

            .page-subtitle {
                font-size: 1rem;
                opacity: 0.9;
                max-width: 600px;
                position: relative;
                z-index: 1;
            }

            /* Empty State */
            .empty-state {
                padding: 3rem;
                text-align: center;
            }

            .empty-state i {
                font-size: 3rem;
                color: var(--gray-300);
                margin-bottom: 1rem;
            }

            .empty-state h5 {
                font-weight: 600;
                color: var(--gray-600);
            }

            .empty-state p {
                color: var(--gray-600);
                max-width: 400px;
                margin: 0 auto;
            }

            /* Footer */
            .app-footer {
                background-color: rgba(33, 37, 41, 0.95);
                padding: 1.5rem 0;
                color: white;
                position: relative;
                z-index: 10;
                margin-top: 2rem;
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

            .social-icons {
                display: flex;
                gap: 1rem;
            }

            .social-icons a {
                color: white;
                opacity: 0.7;
                transition: all 0.3s ease;
                width: 2rem;
                height: 2rem;
                display: flex;
                align-items: center;
                justify-content: center;
                border-radius: 50%;
                background-color: rgba(255, 255, 255, 0.1);
            }

            .social-icons a:hover {
                opacity: 1;
                transform: translateY(-3px);
                background-color: var(--primary-color);
            }

            /* Button styles */
            .btn-primary {
                background: linear-gradient(135deg, var(--primary-color) 0%, var(--secondary-color) 100%);
                border: none;
                font-weight: 600;
                padding: 0.5rem 1rem;
                border-radius: 8px;
                transition: all 0.3s ease;
            }

            .btn-primary:hover {
                transform: translateY(-2px);
                box-shadow: 0 5px 15px rgba(0, 146, 69, 0.3);
                background: linear-gradient(135deg, var(--primary-color) 20%, var(--secondary-color) 100%);
            }

            /* Responsive Adjustments */
            @media (max-width: 992px) {
                .content-wrapper {
                    padding: 1.5rem 0;
                }
            }

            @media (max-width: 768px) {
                .university-brand {
                    max-width: 200px;
                }

                .university-name {
                    font-size: 1rem;
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
                        <a href="index.jsp" class="text-decoration-none university-brand">
                            <img src="images/nsbm-logo.png" alt="University Logo" class="university-logo me-3">
                            <div>
                                <h1 class="university-name">NSBM GREEN UNIVERSITY</h1>
                                <div class="d-flex align-items-center">
                                    <p class="university-system">Student Management System</p>
                                    <span class="student-badge">STUDENT PORTAL</span>
                                </div>
                            </div>
                        </a>

                        <div class="dropdown">
                            <button class="btn profile-btn dropdown-toggle d-flex align-items-center gap-2" type="button" id="userMenu" data-bs-toggle="dropdown" aria-expanded="false">
                                <div class="d-flex align-items-center">
                                    <div class="rounded-circle bg-primary text-white d-flex align-items-center justify-content-center" style="width: 32px; height: 32px;">
                                        ${sessionScope.student.name.charAt(0)}
                                    </div>
                                    <span class="ms-2 d-none d-md-inline">${sessionScope.student.name}</span>
                                </div>
                            </button>
                            <ul class="dropdown-menu dropdown-menu-end shadow border-0" aria-labelledby="userMenu">
                                <li><a class="dropdown-item" href="profile.jsp"><i class="fas fa-user me-2 text-primary"></i> My Profile</a></li>
                                <li><a class="dropdown-item" href="#"><i class="fas fa-bell me-2 text-primary"></i> Notifications</a></li>
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
                    <div class="row g-4">
                        <!-- Sidebar -->
                        <div class="col-lg-3">
                            <div class="sidebar">
                                <div class="sidebar-header">
                                    <h5><i class="fas fa-th-large me-2"></i> Navigation</h5>
                                </div>
                                <div class="sidebar-nav">
                                    <a href="studentDashboard.jsp" class="nav-link">
                                        <i class="fas fa-tachometer-alt"></i> Dashboard
                                    </a>
                                    <a href="MyCoursesServlet" class="nav-link active">
                                        <i class="fas fa-book"></i> My Courses
                                    </a>
                                    <a href="AttendanceServlet" class="nav-link">
                                        <i class="fas fa-calendar-check"></i> Attendance
                                    </a>
                                    <a href="myGrades.jsp" class="nav-link">
                                        <i class="fas fa-chart-line"></i> Grades
                                    </a>
                                    <a href="myFees.jsp" class="nav-link">
                                        <i class="fas fa-money-bill-wave"></i> Fees
                                    </a>
                                    <a href="exams.jsp" class="nav-link">
                                        <i class="fas fa-file-alt"></i> Exams
                                    </a>
                                    <a href="profile.jsp" class="nav-link">
                                        <i class="fas fa-user"></i> Profile
                                    </a>
                                    <a href="LogoutServlet" class="nav-link logout">
                                        <i class="fas fa-sign-out-alt"></i> Logout
                                    </a>
                                </div>
                            </div>
                        </div>

                        <!-- Main Course Area -->
                        <div class="col-lg-9">
                            <!-- Page Title -->
                            <div class="page-title-wrapper">
                                <h2 class="page-title"><i class="fas fa-book-open me-2"></i> My Courses</h2>
                                <p class="page-subtitle">View your enrolled course</p>
                            </div>

                            <!-- Course Details (if a course is found) - MODIFIED SECTION -->
                            <c:if test="${not empty enrolledCourse}">
                                <div class="dashboard-card mb-4">
                                    <div class="dashboard-header d-flex justify-content-between align-items-center">
                                        <h4><i class="fas fa-graduation-cap me-2"></i> Current Enrollment</h4>
                                        <span class="status-badge status-active">Active</span>
                                    </div>
                                    <div class="dashboard-body">
                                        <div class="raw-enrollment-container">
                                            <div class="enrollment-header">
                                                <div>
                                                    <h3 class="course-title">${enrolledCourse.name}</h3>
                                                    <div class="course-code">Course Code: ${enrolledCourse.courseID}</div>
                                                </div>
                                            </div>
                                            <div class="enrollment-body">
                                                <div class="course-info">
                                                    <div class="info-item">
                                                        <div class="info-label">Credits</div>
                                                        <div class="info-value">${enrolledCourse.credits} Credits</div>
                                                    </div>
                                                    <div class="info-item">
                                                        <div class="info-label">Duration</div>
                                                        <div class="info-value">${enrolledCourse.duration} Weeks</div>
                                                    </div>
                                                </div>
                                                <div class="course-description">
                                                    <div class="info-label">Description</div>
                                                    <p>${enrolledCourse.description}</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:if>

                            <!-- Empty State (if no course is found) -->
                            <c:if test="${empty enrolledCourse}">
                                <div class="dashboard-card">
                                    <div class="dashboard-header">
                                        <h4><i class="fas fa-graduation-cap me-2"></i> Enrolled Courses</h4>
                                    </div>
                                    <div class="dashboard-body">
                                        <div class="empty-state">
                                            <i class="fas fa-book-open"></i>
                                            <h5>No courses enrolled yet</h5>
                                            <p>You haven't enrolled in any courses. Please contact your academic advisor for course enrollment assistance.</p>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
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
                        <div class="social-icons">
                            <a href="#" aria-label="Facebook"><i class="fab fa-facebook-f"></i></a>
                            <a href="#" aria-label="Twitter"><i class="fab fa-twitter"></i></a>
                            <a href="#" aria-label="Instagram"><i class="fab fa-instagram"></i></a>
                            <a href="#" aria-label="LinkedIn"><i class="fab fa-linkedin-in"></i></a>
                        </div>
                    </div>
                </div>
            </footer>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>