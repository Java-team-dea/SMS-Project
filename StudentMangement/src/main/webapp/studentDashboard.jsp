<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


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
    <title>Student Portal | Dashboard</title>
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

        /* Dashboard Cards */
        .dashboard-card {
            background-color: rgba(255, 255, 255, 0.98);
            border-radius: 16px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.15);
            overflow: hidden;
            backdrop-filter: blur(10px);
            margin-bottom: 2rem;
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

        /* Stat Cards */
        .stat-card {
            background-color: #fff;
            border-radius: 12px;
            box-shadow: var(--shadow);
            padding: 1.5rem;
            position: relative;
            overflow: hidden;
            transition: all 0.3s ease;
            border-left: 4px solid var(--primary-color);
            height: 100%;
        }

        .stat-card:hover {
            transform: translateY(-5px);
            box-shadow: var(--shadow-md);
        }

        .stat-card.courses {
            border-left-color: var(--primary-color);
        }

        .stat-card.gpa {
            border-left-color: #10b981;
        }

        .stat-card.fees {
            border-left-color: #f59e0b;
        }

        .stat-icon {
            font-size: 2.5rem;
            margin-bottom: 1rem;
        }

        .stat-icon.courses {
            color: var(--primary-color);
        }

        .stat-icon.gpa {
            color: #10b981;
        }

        .stat-icon.fees {
            color: #f59e0b;
        }

        .stat-value {
            font-size: 2rem;
            font-weight: 700;
            line-height: 1.2;
            margin-bottom: 0.5rem;
            color: var(--dark-color);
        }

        .stat-label {
            font-size: 0.875rem;
            color: var(--gray-600);
            font-weight: 500;
        }

        /* Welcome Section */
        .welcome-section {
            padding: 2rem;
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            color: white;
            border-radius: 16px;
            margin-bottom: 1.5rem;
            position: relative;
            overflow: hidden;
            box-shadow: var(--shadow);
        }

        .welcome-section::before {
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

        .welcome-title {
            font-size: 1.5rem;
            font-weight: 700;
            margin-bottom: 0.5rem;
            position: relative;
            z-index: 1;
        }

        .welcome-subtitle {
            font-size: 1rem;
            opacity: 0.9;
            max-width: 600px;
            position: relative;
            z-index: 1;
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

        /* Quick Access Cards */
        .quick-access-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
            gap: 1rem;
            margin-top: 1.5rem;
        }

        .quick-card {
            background-color: white;
            border-radius: 12px;
            box-shadow: var(--shadow);
            padding: 1.5rem;
            transition: all 0.3s ease;
            display: flex;
            flex-direction: column;
            align-items: center;
            text-align: center;
            height: 100%;
        }

        .quick-card:hover {
            transform: translateY(-5px);
            box-shadow: var(--shadow-md);
            background-color: var(--accent-color);
        }

        .quick-icon {
            width: 2.5rem;
            height: 2.5rem;
            border-radius: 50%;
            background-color: var(--accent-color);
            color: var(--primary-color);
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 1rem;
            font-size: 1.25rem;
        }

        .quick-content h6 {
            font-weight: 600;
            margin-bottom: 0.25rem;
            font-size: 0.9375rem;
            color: var(--dark-color);
        }

        .quick-content p {
            font-size: 0.75rem;
            color: var(--gray-600);
            margin-bottom: 0;
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
            
            .dashboard-card {
                padding: 1.5rem;
            }
        }

        @media (max-width: 768px) {
            .university-brand {
                max-width: 200px;
            }
            
            .university-name {
                font-size: 1rem;
            }
            
            .welcome-section {
                padding: 1.5rem;
            }
            
            .welcome-title {
                font-size: 1.25rem;
            }
            
            .welcome-subtitle {
                font-size: 0.875rem;
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
                                <a href="studentDashboard.jsp" class="nav-link active">
                                    <i class="fas fa-tachometer-alt"></i> Dashboard
                                </a>
                                <a href="MyCoursesServlet" class="nav-link">
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
                    
                    <!-- Main Dashboard Area -->
                    <div class="col-lg-9">
                        <!-- Welcome Section -->
                        <div class="welcome-section">
                            <h2 class="welcome-title"><i class="fas fa-user-graduate me-2"></i> Welcome, ${sessionScope.student.name}</h2>
                            <p class="welcome-subtitle">Access all your academic information, course materials, and campus resources from your personalized dashboard.</p>
                        </div>
                        
                        <!-- Statistics Section -->
                        <div class="dashboard-card mb-4">
                            <div class="dashboard-header">
                                <h4><i class="fas fa-chart-pie me-2"></i> Academic Overview</h4>
                            </div>
                            <div class="dashboard-body">
                                <div class="row g-4">
                                    <div class="col-md-4">
                                        <div class="stat-card courses">
                                            <div class="stat-icon courses">
                                                <i class="fas fa-book-open"></i>
                                            </div>
                                            <div class="stat-value">${sessionScope.student.coursesCount}</div>
                                            <div class="stat-label">Courses Enrolled</div>
                                        </div>
                                    </div>
                                    
                                    <div class="col-md-4">
                                        <div class="stat-card gpa">
                                            <div class="stat-icon gpa">
                                                <i class="fas fa-medal"></i>
                                            </div>
                                            <div class="stat-value">${sessionScope.student.gpa}</div>
                                            <div class="stat-label">Current GPA</div>
                                        </div>
                                    </div>
                                    
                                    <div class="col-md-4">
                                        <div class="stat-card fees">
                                            <div class="stat-icon fees">
                                                <i class="fas fa-money-bill-wave"></i>
                                            </div>
                                            <div class="stat-value">${sessionScope.student.outstandingFees}</div>
                                            <div class="stat-label">Outstanding Fees</div>
                                        </div>
                                    </div>
                                </div>
                                
                                <!-- Quick Access Links -->
                                <div class="row mt-4">
                                    <div class="col-md-3 mb-3">
                                        <div class="quick-card h-100">
                                            <div class="quick-icon">
                                                <i class="fas fa-book"></i>
                                            </div>
                                            <div class="quick-content">
                                                <h6>View Courses</h6>
                                                <p>Access your course materials</p>
                                            </div>
                                            <a href="myCourses.jsp" class="btn btn-primary mt-auto">Go to Courses</a>
                                        </div>
                                    </div>
                                    
                                    <div class="col-md-3 mb-3">
                                        <div class="quick-card h-100">
                                            <div class="quick-icon">
                                                <i class="fas fa-file-alt"></i>
                                            </div>
                                            <div class="quick-content">
                                                <h6>Upcoming Exams</h6>
                                                <p>View exam schedule and details</p>
                                            </div>
                                            <a href="exams.jsp" class="btn btn-primary mt-auto">View Exams</a>
                                        </div>
                                    </div>
                                    
                                    <div class="col-md-3 mb-3">
                                        <div class="quick-card h-100">
                                            <div class="quick-icon">
                                                <i class="fas fa-calendar-check"></i>
                                            </div>
                                            <div class="quick-content">
                                                <h6>Attendance</h6>
                                                <p>Check your attendance records</p>
                                            </div>
                                            <a href="myAttendance.jsp" class="btn btn-primary mt-auto">View Records</a>
                                        </div>
                                    </div>
                                    
                                    <div class="col-md-3 mb-3">
                                        <div class="quick-card h-100">
                                            <div class="quick-icon">
                                                <i class="fas fa-credit-card"></i>
                                            </div>
                                            <div class="quick-content">
                                                <h6>Pay Fees</h6>
                                                <p>Make fee payments online</p>
                                            </div>
                                            <a href="myFees.jsp" class="btn btn-primary mt-auto">Pay Now</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <!-- Announcements Section -->
                        <div class="dashboard-card">
                            <div class="dashboard-header d-flex justify-content-between align-items-center">
                                <h4><i class="fas fa-bullhorn me-2"></i> Recent Announcements</h4>
                                <a href="#" class="btn btn-sm btn-primary">View All</a>
                            </div>
                            <div class="dashboard-body">
                                <div class="list-group">
                                    <a href="#" class="list-group-item list-group-item-action">
                                        <div class="d-flex w-100 justify-content-between">
                                            <h6 class="mb-1">Mid-Term Exam Schedule Released</h6>
                                            <small class="text-muted">3 days ago</small>
                                        </div>
                                        <p class="mb-1 text-secondary small">The mid-term examination schedule has been released. Please check your exam timetable.</p>
                                    </a>
                                    <a href="#" class="list-group-item list-group-item-action">
                                        <div class="d-flex w-100 justify-content-between">
                                            <h6 class="mb-1">Campus Event: Career Fair</h6>
                                            <small class="text-muted">1 week ago</small>
                                        </div>
                                        <p class="mb-1 text-secondary small">Annual career fair will be held next month. Prepare your resumes and meet with industry professionals.</p>
                                    </a>
                                    <a href="#" class="list-group-item list-group-item-action">
                                        <div class="d-flex w-100 justify-content-between">
                                            <h6 class="mb-1">Library Hours Extended</h6>
                                            <small class="text-muted">2 weeks ago</small>
                                        </div>
                                        <p class="mb-1 text-secondary small">The university library will remain open until 10 PM during exam period.</p>
                                    </a>
                                </div>
                            </div>
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