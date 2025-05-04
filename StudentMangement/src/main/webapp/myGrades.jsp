<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Portal | My Grades</title>
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

        /* Grades Table */
        .grades-table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: var(--shadow);
        }

        .grades-table th {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            color: white;
            font-weight: 600;
            padding: 1rem;
            text-align: left;
            border: none;
        }

        .grades-table td {
            padding: 1rem;
            border-top: 1px solid var(--gray-200);
            background-color: white;
        }

        .grades-table tr:hover td {
            background-color: var(--accent-color);
        }

        .grade-badge {
            padding: 0.35rem 0.65rem;
            border-radius: 30px;
            font-weight: 600;
            font-size: 0.8rem;
            display: inline-block;
            text-align: center;
            min-width: 60px;
        }

        .grade-a {
            background-color: #d1fae5;
            color: #047857;
        }

        .grade-b {
            background-color: #dbeafe;
            color: #1d4ed8;
        }

        .grade-c {
            background-color: #fef3c7;
            color: #b45309;
        }

        .grade-d {
            background-color: #ffedd5;
            color: #c2410c;
        }

        .grade-f {
            background-color: #fee2e2;
            color: #b91c1c;
        }

        .gpa-value {
            font-weight: 600;
        }

        /* Summary Card */
        .summary-card {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            color: white;
            border-radius: 16px;
            padding: 1.5rem;
            margin-bottom: 1.5rem;
            position: relative;
            overflow: hidden;
        }

        .summary-card::before {
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

        .summary-title {
            font-size: 1.25rem;
            font-weight: 700;
            margin-bottom: 0.75rem;
            position: relative;
            z-index: 1;
        }

        .summary-stats {
            display: flex;
            flex-wrap: wrap;
            gap: 2rem;
            position: relative;
            z-index: 1;
        }

        .summary-stat {
            flex: 1;
            min-width: 150px;
        }

        .summary-value {
            font-size: 2rem;
            font-weight: 700;
            margin-bottom: 0.25rem;
        }

        .summary-label {
            font-size: 0.875rem;
            opacity: 0.9;
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
            
            .summary-stats {
                flex-direction: column;
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
                    <a href="index.jsp" class="text-decoration-none university-brand">
                        <img src="images/university-logo.png" alt="University Logo" class="university-logo me-3">
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
                                <a href="myCourses.jsp" class="nav-link">
                                    <i class="fas fa-book"></i> My Courses
                                </a>
                                <a href="myAttendance.jsp" class="nav-link">
                                    <i class="fas fa-calendar-check"></i> Attendance
                                </a>
                                <a href="myGrades.jsp" class="nav-link active">
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
                    
                    <!-- Main Grades Area -->
                    <div class="col-lg-9">
                        <!-- GPA Summary Section -->
                        <div class="summary-card">
                            <h2 class="summary-title"><i class="fas fa-chart-line me-2"></i> Academic Performance</h2>
                            <div class="summary-stats">
                                <div class="summary-stat">
                                    <div class="summary-value">${sessionScope.student.gpa}</div>
                                    <div class="summary-label">Overall GPA</div>
                                </div>
                                <div class="summary-stat">
                                    <div class="summary-value">${sessionScope.student.coursesCount}</div>
                                    <div class="summary-label">Completed Courses</div>
                                </div>
                                <div class="summary-stat">
                                    <div class="summary-value">${sessionScope.student.creditsEarned}</div>
                                    <div class="summary-label">Credits Earned</div>
                                </div>
                            </div>
                        </div>
                        
                        <!-- Grades Table Section -->
                        <div class="dashboard-card">
                            <div class="dashboard-header d-flex justify-content-between align-items-center">
                                <h4><i class="fas fa-graduation-cap me-2"></i> Course Grades</h4>
                                <button class="btn btn-sm btn-primary"><i class="fas fa-download me-1"></i> Download Report</button>
                            </div>
                            <div class="dashboard-body">
                                <c:choose>
                                    <c:when test="${empty gradeList}">
                                        <div class="alert alert-info">
                                            <i class="fas fa-info-circle me-2"></i> No grades available at the moment.
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="table-responsive">
                                            <table class="grades-table">
                                                <thead>
                                                    <tr>
                                                        <th>Course Code</th>
                                                        <th>Course Name</th>
                                                        <th>Grade</th>
                                                        <th>GPA</th>
                                                        <th>Credits</th>
                                                        <th>Status</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach var="grade" items="${gradeList}">
                                                        <tr>
                                                            <td>${grade.courseCode}</td>
                                                            <td>${grade.courseName}</td>
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
                                                                    <c:otherwise>
                                                                        <span class="grade-badge grade-f">${grade.grade}</span>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </td>
                                                            <td><span class="gpa-value">${grade.gpa}</span></td>
                                                            <td>${grade.credits}</td>
                                                            <td>
                                                                <c:choose>
                                                                    <c:when test="${grade.gpa >= 2.0}">
                                                                        <span class="badge bg-success">Passed</span>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <span class="badge bg-danger">Failed</span>
                                                                    </c:otherwise>
                                                                </c:choose>
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
                        
                        <!-- GPA Calculation Info -->
                        <div class="dashboard-card">
                            <div class="dashboard-header">
                                <h4><i class="fas fa-info-circle me-2"></i> GPA Information</h4>
                            </div>
                            <div class="dashboard-body">
                                <div class="row g-4">
                                    <div class="col-md-6">
                                        <h5 class="mb-3">Grading Scale</h5>
                                        <div class="table-responsive">
                                            <table class="table table-sm table-striped">
                                                <thead>
                                                    <tr>
                                                        <th>Grade</th>
                                                        <th>GPA</th>
                                                        <th>Range</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td>A+</td>
                                                        <td>4.0</td>
                                                        <td>90-100</td>
                                                    </tr>
                                                    <tr>
                                                        <td>A</td>
                                                        <td>4.0</td>
                                                        <td>85-89</td>
                                                    </tr>
                                                    <tr>
                                                        <td>A-</td>
                                                        <td>3.7</td>
                                                        <td>80-84</td>
                                                    </tr>
                                                    <tr>
                                                        <td>B+</td>
                                                        <td>3.3</td>
                                                        <td>75-79</td>
                                                    </tr>
                                                    <tr>
                                                        <td>B</td>
                                                        <td>3.0</td>
                                                        <td>70-74</td>
                                                    </tr>
                                                    <tr>
                                                        <td>C+</td>
                                                        <td>2.3</td>
                                                        <td>65-69</td>
                                                    </tr>
                                                    <tr>
                                                        <td>C</td>
                                                        <td>2.0</td>
                                                        <td>60-64</td>
                                                    </tr>
                                                    <tr>
                                                        <td>D</td>
                                                        <td>1.0</td>
                                                        <td>50-59</td>
                                                    </tr>
                                                    <tr>
                                                        <td>F</td>
                                                        <td>0.0</td>
                                                        <td>0-49</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <h5 class="mb-3">GPA Calculation</h5>
                                        <p>Your GPA is calculated using the following formula:</p>
                                        <div class="alert alert-secondary">
                                            <p class="mb-2">GPA = Total Grade Points / Total Credits</p>
                                            <p class="mb-0 small">Where Grade Points = GPA Value × Credit Value for each course</p>
                                        </div>
                                        <div class="mt-4">
                                            <h5 class="mb-3">Academic Standing</h5>
                                            <div class="table-responsive">
                                                <table class="table table-sm table-striped">
                                                    <thead>
                                                        <tr>
                                                            <th>GPA Range</th>
                                                            <th>Standing</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td>3.5 - 4.0</td>
                                                            <td>First Class</td>
                                                        </tr>
                                                        <tr>
                                                            <td>3.0 - 3.49</td>
                                                            <td>Second Class Upper</td>
                                                        </tr>
                                                        <tr>
                                                            <td>2.5 - 2.99</td>
                                                            <td>Second Class Lower</td>
                                                        </tr>
                                                        <tr>
                                                            <td>2.0 - 2.49</td>
                                                            <td>Pass</td>
                                                        </tr>
                                                        <tr>
                                                            <td>< 2.0</td>
                                                            <td>Fail</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
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
