<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Student Portal | Manage Attendance</title>
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

            /* Content Card */
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
                background-color: var(--light-color);
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
                color: var(--dark-color);
            }

            .content-body {
                padding: 1.5rem;
            }

            /* Table Styles */
            .attendance-table {
                width: 100%;
                border-collapse: separate;
                border-spacing: 0;
            }

            .attendance-table th {
                background-color: var(--accent-color);
                color: var(--primary-color);
                font-weight: 600;
                padding: 0.75rem 1rem;
                text-align: left;
                border-bottom: 2px solid var(--primary-color);
                font-size: 0.9rem;
            }

            .attendance-table td {
                padding: 0.75rem 1rem;
                border-bottom: 1px solid var(--gray-200);
                vertical-align: middle;
                font-size: 0.9rem;
            }

            .attendance-table tbody tr:hover {
                background-color: var(--accent-color);
            }

            .attendance-table tbody tr:last-child td {
                border-bottom: none;
            }

            /* Status Badges */
            .status-badge {
                padding: 0.25rem 0.75rem;
                border-radius: 20px;
                font-weight: 500;
                font-size: 0.8rem;
                display: inline-block;
            }

            .status-present {
                background-color: #d1fae5;
                color: #047857;
            }

            .status-absent {
                background-color: #fee2e2;
                color: #b91c1c;
            }

            .status-late {
                background-color: #fef3c7;
                color: #92400e;
            }

            /* Action Links */
            .action-link {
                color: var(--primary-color);
                font-weight: 500;
                text-decoration: none;
                transition: all 0.2s ease;
                margin-right: 0.75rem;
                display: inline-flex;
                align-items: center;
            }

            .action-link:hover {
                color: var(--secondary-color);
                text-decoration: underline;
            }

            .action-link i {
                margin-right: 0.25rem;
                font-size: 0.85rem;
            }

            .delete-link {
                color: #ef4444;
            }

            .delete-link:hover {
                color: #b91c1c;
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

            .new-attendance-btn {
                display: flex;
                align-items: center;
                gap: 0.5rem;
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

            /* Search and Filter Controls */
            .controls-wrapper {
                display: flex;
                justify-content: space-between;
                margin-bottom: 1rem;
                flex-wrap: wrap;
                gap: 1rem;
            }

            .search-box {
                position: relative;
                max-width: 300px;
            }

            .search-box input {
                padding-left: 2.5rem;
                border-radius: 8px;
                border: 1px solid var(--gray-300);
                padding: 0.5rem 1rem 0.5rem 2.5rem;
                width: 100%;
            }

            .search-box i {
                position: absolute;
                left: 0.75rem;
                top: 50%;
                transform: translateY(-50%);
                color: var(--gray-600);
            }

            .filter-controls {
                display: flex;
                gap: 0.75rem;
            }

            /* Responsive Adjustments */
            @media (max-width: 992px) {
                .controls-wrapper {
                    flex-direction: column;
                    align-items: stretch;
                }

                .search-box {
                    max-width: 100%;
                }

                .filter-controls {
                    flex-wrap: wrap;
                }
            }

            @media (max-width: 768px) {
                .content-wrapper {
                    padding: 1rem 0;
                }

                .attendance-table {
                    display: block;
                    overflow-x: auto;
                }

                .footer-content {
                    flex-direction: column;
                    gap: 1rem;
                    text-align: center;
                }
            }

            /* No Records Message */
            .no-records {
                text-align: center;
                padding: 2rem;
                color: var(--gray-600);
            }

            .no-records i {
                font-size: 3rem;
                margin-bottom: 1rem;
                color: var(--gray-300);
            }

            .no-records p {
                font-size: 1.1rem;
                margin-bottom: 1.5rem;
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
                            <img src="images/nsbm-logo.png" alt="University Logo" class="university-logo me-3">
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
                    <div class="content-card">
                        <div class="content-header d-flex justify-content-between align-items-center">
                            <h4><i class="fas fa-calendar-check me-2"></i> Manage Attendance</h4>
                            <a href="markAttendance.jsp" class="btn btn-primary new-attendance-btn">
                                <i class="fas fa-plus"></i> Mark New Attendance
                            </a>
                        </div>
                        <div class="content-body">
                            <div class="content-body">
    <!-- Success/Error Messages -->
    <c:if test="${not empty successMessage}">
        <div class="alert alert-success alert-dismissible fade show" role="alert">
            ${successMessage}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    </c:if>
    <c:if test="${not empty errorMessage}">
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
            ${errorMessage}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    </c:if>
    
    <!-- Rest of your content -->
                            <!-- Search and Filter Controls -->
                            <div class="controls-wrapper">
                                <div class="search-box">
                                    <i class="fas fa-search"></i>
                                    <input type="text" class="form-control" placeholder="Search students...">
                                </div>
                                <div class="filter-controls">
                                    <select class="form-select">
                                        <option value="">All Courses</option>
                                        <option value="java">Java Programming</option>
                                        <option value="database">Database Systems</option>
                                        <option value="web">Web Development</option>
                                    </select>
                                    <select class="form-select">
                                        <option value="">All Status</option>
                                        <option value="present">Present</option>
                                        <option value="absent">Absent</option>
                                        <option value="late">Late</option>
                                    </select>
                                    <input type="date" class="form-control">
                                </div>
                            </div>

                            <!-- Attendance Table -->
                            <div class="table-responsive">
                                <table class="attendance-table">
                                    <thead>
                                        <tr>
                                            <th>Student</th>
                                            <th>Module</th>
                                            <th>Status</th>
                                            <th>Date</th>
                                            <th>Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <form action="AttendanceListServlet" method="post">
                                        <button type="submit" class="btn btn-success">View</button>
                                    </form>

                                    <c:forEach var="attendance" items="${list}">
                                        <tr>
                                            <td>${attendance.studentId}</td>
                                            <td>${attendance.moduleid}</td>

                                            <td>
                                                <span class="status-badge 
                                                      ${attendance.status eq 'Present' ? 'status-present' : 
                                                        attendance.status eq 'Absent' ? 'status-absent' : 'status-late'}">
                                                          ${attendance.status}
                                                      </span>
                                                </td>
                                                <td>${attendance.date}</td>
                                                <td>
                                                    <a href="editAttendance.jsp?id=${attendance.studentId}" class="action-link">
                                                        <i class="fas fa-edit"></i> Edit
                                                    </a>
                                                    <a href="deleteAttendance?id=${attendance.studentId}&moduleid=${attendance.moduleid}&date=${attendance.date}" 
                                                       onclick="return confirm('Are you sure you want to delete this attendance record?')" 
                                                       class="action-link delete-link">
                                                        <i class="fas fa-trash-alt"></i> Delete
                                                    </a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                            

                                        </tbody>
                                    </table>
                                </div>

                                <!-- Pagination -->
                                <nav aria-label="Page navigation" class="mt-4">
                                    <ul class="pagination justify-content-center">
                                        <li class="page-item disabled">
                                            <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
                                        </li>
                                        <li class="page-item active"><a class="page-link" href="#">1</a></li>
                                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                                        <li class="page-item">
                                            <a class="page-link" href="#">Next</a>
                                        </li>
                                    </ul>
                                </nav>
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