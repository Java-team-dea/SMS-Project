<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Portal | Manage Grades</title>
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
            background-color: #3F51B5;
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

        /* Main Content Card */
        .content-card {
            background-color: rgba(255, 255, 255, 0.98);
            border-radius: 16px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.15);
            overflow: hidden;
            backdrop-filter: blur(10px);
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
        .table-responsive {
            border-radius: 8px;
            overflow: hidden;
        }

        .data-table {
            width: 100%;
            margin-bottom: 0;
            vertical-align: middle;
        }

        .data-table thead th {
            background-color: rgba(0, 146, 69, 0.1);
            color: var(--primary-color);
            font-weight: 600;
            border-bottom: 2px solid var(--primary-color);
            padding: 1rem;
            font-size: 0.9rem;
        }

        .data-table tbody tr {
            transition: all 0.3s ease;
        }

        .data-table tbody tr:hover {
            background-color: var(--accent-color);
        }

        .data-table td {
            padding: 1rem;
            vertical-align: middle;
            border-bottom: 1px solid var(--gray-200);
        }

        /* Action Buttons */
        .btn-action {
            padding: 0.4rem 0.75rem;
            border-radius: 6px;
            font-size: 0.85rem;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .btn-edit {
            background-color: rgba(0, 146, 69, 0.1);
            color: var(--primary-color);
            border: 1px solid rgba(0, 146, 69, 0.2);
        }

        .btn-edit:hover {
            background-color: var(--primary-color);
            color: white;
        }

        .btn-delete {
            background-color: rgba(239, 68, 68, 0.1);
            color: #ef4444;
            border: 1px solid rgba(239, 68, 68, 0.2);
        }

        .btn-delete:hover {
            background-color: #ef4444;
            color: white;
        }

        .btn-add {
            background: linear-gradient(135deg, var(--primary-color) 0%, var(--secondary-color) 100%);
            color: white;
            border: none;
            padding: 0.5rem 1.25rem;
            border-radius: 8px;
            font-weight: 600;
            display: flex;
            align-items: center;
            gap: 0.5rem;
            transition: all 0.3s ease;
        }

        .btn-add:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 146, 69, 0.3);
        }

        /* Badges */
        .grade-badge {
            padding: 0.35rem 0.75rem;
            border-radius: 30px;
            font-weight: 500;
            font-size: 0.85rem;
        }

        .grade-a {
            background-color: rgba(0, 200, 83, 0.1);
            color: #00c853;
        }

        .grade-b {
            background-color: rgba(0, 176, 255, 0.1);
            color: #00b0ff;
        }

        .grade-c {
            background-color: rgba(255, 171, 0, 0.1);
            color: #ffab00;
        }

        .grade-d {
            background-color: rgba(255, 109, 0, 0.1);
            color: #ff6d00;
        }

        .grade-f {
            background-color: rgba(239, 68, 68, 0.1);
            color: #ef4444;
        }

        /* Empty State */
        .empty-state {
            padding: 3rem 1.5rem;
            text-align: center;
        }

        .empty-icon {
            font-size: 3rem;
            color: var(--gray-300);
            margin-bottom: 1.5rem;
        }

        .empty-title {
            font-size: 1.25rem;
            font-weight: 600;
            color: var(--gray-600);
            margin-bottom: 0.5rem;
        }

        .empty-description {
            color: var(--gray-600);
            max-width: 500px;
            margin: 0 auto 1.5rem;
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

            .btn-add {
                width: 100%;
                justify-content: center;
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
                        <button class="btn profile-btn dropdown-toggle d-flex align-items-center gap-2" type="button" id="userMenu" data-bs-toggle="dropdown" aria-expanded="false">
                            <div class="d-flex align-items-center">
                                <div class="rounded-circle bg-primary text-white d-flex align-items-center justify-content-center" style="width: 32px; height: 32px;">
                                    A
                                </div>
                                <span class="ms-2 d-none d-md-inline">Admin</span>
                            </div>
                        </button>
                        <ul class="dropdown-menu dropdown-menu-end shadow border-0" aria-labelledby="userMenu">
                            <li><a class="dropdown-item" href="adminProfile.jsp"><i class="fas fa-user me-2 text-primary"></i> My Profile</a></li>
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
                                <a href="adminDashboard.jsp" class="nav-link">
                                    <i class="fas fa-tachometer-alt"></i> Dashboard
                                </a>
                                <a href="studentList.jsp" class="nav-link">
                                    <i class="fas fa-user-graduate"></i> Manage Students
                                </a>
                                <a href="courseList.jsp" class="nav-link">
                                    <i class="fas fa-book"></i> Manage Courses
                                </a>
                                <a href="attendanceList.jsp" class="nav-link">
                                    <i class="fas fa-calendar-check"></i> Manage Attendance
                                </a>
                                <a href="gradeList.jsp" class="nav-link active">
                                    <i class="fas fa-chart-line"></i> Manage Grades
                                </a>
                                <a href="feeList.jsp" class="nav-link">
                                    <i class="fas fa-money-bill-wave"></i> Manage Fees
                                </a>
                                <a href="faculty.jsp" class="nav-link">
                                    <i class="fas fa-chalkboard-teacher"></i> Manage Faculty
                                </a>
                                <a href="departments.jsp" class="nav-link">
                                    <i class="fas fa-building"></i> Manage Departments
                                </a>
                                <a href="LogoutServlet" class="nav-link logout">
                                    <i class="fas fa-sign-out-alt"></i> Logout
                                </a>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Main Content Area -->
                    <div class="col-lg-9">
                        <div class="content-card">
                            <div class="content-header">
                                <h4><i class="fas fa-chart-line me-2"></i> Manage Grades</h4>
                                <a href="addGrade.jsp" class="btn btn-add">
                                    <i class="fas fa-plus"></i> Add New Grade
                                </a>
                            </div>
                            <div class="content-body">
                                <c:choose>
                                    <c:when test="${empty gradeList}">
                                        <div class="empty-state">
                                            <div class="empty-icon">
                                                <i class="fas fa-chart-line"></i>
                                            </div>
                                            <h5 class="empty-title">No Grade Records Found</h5>
                                            <p class="empty-description">
                                                There are no grade records available in the system. 
                                                Click the button below to add a new grade record.
                                            </p>
                                            <a href="addGrade.jsp" class="btn btn-add">
                                                <i class="fas fa-plus"></i> Add First Grade
                                            </a>
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="table-responsive">
                                            <table class="table data-table">
                                                <thead>
                                                    <tr>
                                                        <th>Student Name</th>
                                                        <th>Course</th>
                                                        <th>Grade</th>
                                                        <th class="text-center">Actions</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach var="grade" items="${gradeList}">
                                                        <tr>
                                                            <td>
                                                                <div class="d-flex align-items-center">
                                                                    <div class="rounded-circle bg-light d-flex align-items-center justify-content-center" style="width: 40px; height: 40px;">
                                                                        <i class="fas fa-user-graduate text-primary"></i>
                                                                    </div>
                                                                    <div class="ms-3">
                                                                        <h6 class="mb-0">${grade.studentName}</h6>
                                                                        <small class="text-muted">ID: ${grade.studentId}</small>
                                                                    </div>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="d-flex align-items-center">
                                                                    <div class="rounded-circle bg-light d-flex align-items-center justify-content-center" style="width: 40px; height: 40px;">
                                                                        <i class="fas fa-book text-primary"></i>
                                                                    </div>
                                                                    <div class="ms-3">
                                                                        <h6 class="mb-0">${grade.course}</h6>
                                                                        <small class="text-muted">Code: ${grade.courseCode}</small>
                                                                    </div>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <c:choose>
                                                                    <c:when test="${grade.grade == 'A' || grade.grade == 'A+' || grade.grade == 'A-'}">
                                                                        <span class="grade-badge grade-a">${grade.grade}</span>
                                                                    </c:when>
                                                                    <c:when test="${grade.grade == 'B' || grade.grade == 'B+' || grade.grade == 'B-'}">
                                                                        <span class="grade-badge grade-b">${grade.grade}</span>
                                                                    </c:when>
                                                                    <c:when test="${grade.grade == 'C' || grade.grade == 'C+' || grade.grade == 'C-'}">
                                                                        <span class="grade-badge grade-c">${grade.grade}</span>
                                                                    </c:when>
                                                                    <c:when test="${grade.grade == 'D' || grade.grade == 'D+' || grade.grade == 'D-'}">
                                                                        <span class="grade-badge grade-d">${grade.grade}</span>
                                                                    </c:when>
                                                                    <c:when test="${grade.grade == 'F'}">
                                                                        <span class="grade-badge grade-f">${grade.grade}</span>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        ${grade.grade}
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </td>
                                                            <td class="text-center">
                                                                <div class="d-flex justify-content-center gap-2">
                                                                    <a href="editGrade.jsp?id=${grade.id}" class="btn btn-action btn-edit">
                                                                        <i class="fas fa-edit me-1"></i> Edit
                                                                    </a>
                                                                    <a href="deleteGrade?id=${grade.id}" onclick="return confirm('Are you sure you want to delete this grade record?')" class="btn btn-action btn-delete">
                                                                        <i class="fas fa-trash me-1"></i> Delete
                                                                    </a>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </c:otherwise>
                                </c:choose>
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