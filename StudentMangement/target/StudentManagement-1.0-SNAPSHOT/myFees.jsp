<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Portal | My Fees</title>
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

        /* Fee Summary Cards */
        .fee-summary {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 1.5rem;
            margin-bottom: 2rem;
        }

        .fee-card {
            background-color: white;
            border-radius: 12px;
            box-shadow: var(--shadow);
            padding: 1.5rem;
            text-align: center;
            height: 100%;
            transition: all 0.3s ease;
        }

        .fee-card:hover {
            transform: translateY(-5px);
            box-shadow: var(--shadow-md);
        }

        .fee-card.total {
            border-top: 4px solid var(--primary-color);
        }

        .fee-card.paid {
            border-top: 4px solid #10b981;
        }

        .fee-card.due {
            border-top: 4px solid #f59e0b;
        }

        .fee-icon {
            font-size: 2rem;
            margin-bottom: 1rem;
            width: 60px;
            height: 60px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 1rem;
        }

        .fee-icon.total {
            color: var(--primary-color);
            background-color: var(--accent-color);
        }

        .fee-icon.paid {
            color: #10b981;
            background-color: rgba(16, 185, 129, 0.1);
        }

        .fee-icon.due {
            color: #f59e0b;
            background-color: rgba(245, 158, 11, 0.1);
        }

        .fee-amount {
            font-size: 1.75rem;
            font-weight: 700;
            margin-bottom: 0.5rem;
        }

        .fee-label {
            font-size: 0.875rem;
            color: var(--gray-600);
            font-weight: 500;
        }

        /* Fee Table */
        .fee-table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            margin-top: 1rem;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: var(--shadow);
        }

        .fee-table th {
            background-color: var(--primary-color);
            color: white;
            font-weight: 600;
            padding: 1rem;
            text-align: left;
            font-size: 0.9375rem;
        }

        .fee-table td {
            padding: 1rem;
            background-color: white;
            border-top: 1px solid var(--gray-200);
        }

        .fee-table tbody tr:hover td {
            background-color: var(--accent-color);
        }

        .fee-status {
            padding: 0.25rem 0.75rem;
            border-radius: 50px;
            font-size: 0.75rem;
            font-weight: 600;
            display: inline-block;
        }

        .fee-status.paid {
            background-color: rgba(16, 185, 129, 0.1);
            color: #10b981;
        }

        .fee-status.pending {
            background-color: rgba(245, 158, 11, 0.1);
            color: #f59e0b;
        }

        .fee-status.overdue {
            background-color: rgba(239, 68, 68, 0.1);
            color: #ef4444;
        }

        /* Payment Cards */
        .payment-options {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
            gap: 1.5rem;
            margin-top: 2rem;
        }

        .payment-card {
            background-color: white;
            border-radius: 12px;
            box-shadow: var(--shadow);
            padding: 1.5rem;
            text-align: center;
            transition: all 0.3s ease;
            border-left: 4px solid var(--primary-color);
        }

        .payment-card:hover {
            transform: translateY(-5px);
            box-shadow: var(--shadow-md);
            background-color: var(--accent-color);
        }

        .payment-icon {
            font-size: 2rem;
            color: var(--primary-color);
            margin-bottom: 1rem;
        }

        .payment-card h5 {
            font-weight: 600;
            margin-bottom: 0.5rem;
            font-size: 1.1rem;
        }

        .payment-card p {
            font-size: 0.875rem;
            color: var(--gray-600);
            margin-bottom: 1rem;
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
            
            .footer-content {
                flex-direction: column;
                gap: 1rem;
                text-align: center;
            }

            .fee-summary {
                grid-template-columns: 1fr;
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
                                <a href="myGrades.jsp" class="nav-link">
                                    <i class="fas fa-chart-line"></i> Grades
                                </a>
                                <a href="myFees.jsp" class="nav-link active">
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
                    
                    <!-- Main Fees Area -->
                    <div class="col-lg-9">
                        <!-- Page Header -->
                        <div class="dashboard-card mb-4">
                            <div class="dashboard-header d-flex justify-content-between align-items-center">
                                <h4><i class="fas fa-money-bill-wave me-2"></i> Fee Management</h4>
                                <a href="#" class="btn btn-primary">
                                    <i class="fas fa-download me-2"></i> Download Statement
                                </a>
                            </div>
                            
                            <div class="dashboard-body">
                                <!-- Fee Summary Cards -->
                                <div class="fee-summary">
                                    <c:set var="totalAmount" value="0" />
                                    <c:set var="paidAmount" value="0" />
                                    <c:set var="dueAmount" value="0" />
                                    
                                    <c:forEach var="fee" items="${feeList}">
                                        <c:set var="totalAmount" value="${totalAmount + fee.total}" />
                                        <c:set var="paidAmount" value="${paidAmount + fee.paid}" />
                                        <c:set var="dueAmount" value="${dueAmount + fee.due}" />
                                    </c:forEach>
                                    
                                    <div class="fee-card total">
                                        <div class="fee-icon total">
                                            <i class="fas fa-dollar-sign"></i>
                                        </div>
                                        <div class="fee-amount">$${totalAmount}</div>
                                        <div class="fee-label">Total Fees</div>
                                    </div>
                                    
                                    <div class="fee-card paid">
                                        <div class="fee-icon paid">
                                            <i class="fas fa-check"></i>
                                        </div>
                                        <div class="fee-amount">$${paidAmount}</div>
                                        <div class="fee-label">Paid Amount</div>
                                    </div>
                                    
                                    <div class="fee-card due">
                                        <div class="fee-icon due">
                                            <i class="fas fa-exclamation-circle"></i>
                                        </div>
                                        <div class="fee-amount">$${dueAmount}</div>
                                        <div class="fee-label">Outstanding Balance</div>
                                    </div>
                                </div>
                                
                                <!-- Fee History Table -->
                                <div class="dashboard-card mb-4">
                                    <div class="dashboard-header">
                                        <h4><i class="fas fa-history me-2"></i> Fee Details</h4>
                                    </div>
                                    <div class="dashboard-body table-responsive">
                                        <table class="fee-table">
                                            <thead>
                                                <tr>
                                                    <th>#</th>
                                                    <th>Description</th>
                                                    <th>Total Amount</th>
                                                    <th>Paid Amount</th>
                                                    <th>Due Amount</th>
                                                    <th>Status</th>
                                                    <th>Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="fee" items="${feeList}" varStatus="status">
                                                    <tr>
                                                        <td>${status.index + 1}</td>
                                                        <td>Semester ${status.index + 1} Fee</td>
                                                        <td>$${fee.total}</td>
                                                        <td>$${fee.paid}</td>
                                                        <td>$${fee.due}</td>
                                                        <td>
                                                            <c:choose>
                                                                <c:when test="${fee.due == 0}">
                                                                    <span class="fee-status paid">Paid</span>
                                                                </c:when>
                                                                <c:when test="${fee.due < fee.total * 0.5}">
                                                                    <span class="fee-status pending">Partial</span>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <span class="fee-status overdue">Outstanding</span>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </td>
                                                        <td>
                                                            <c:if test="${fee.due > 0}">
                                                                <button class="btn btn-sm btn-primary">Pay Now</button>
                                                            </c:if>
                                                            <c:if test="${fee.due == 0}">
                                                                <button class="btn btn-sm btn-outline-success">View Receipt</button>
                                                            </c:if>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                
                                <!-- Payment Options -->
                                <div class="dashboard-card">
                                    <div class="dashboard-header">
                                        <h4><i class="fas fa-credit-card me-2"></i> Payment Methods</h4>
                                    </div>
                                    <div class="dashboard-body">
                                        <div class="payment-options">
                                            <div class="payment-card">
                                                <div class="payment-icon">
                                                    <i class="fas fa-credit-card"></i>
                                                </div>
                                                <h5>Credit/Debit Card</h5>
                                                <p>Pay securely using Visa, MasterCard, or American Express</p>
                                                <button class="btn btn-primary">Pay with Card</button>
                                            </div>
                                            
                                            <div class="payment-card">
                                                <div class="payment-icon">
                                                    <i class="fas fa-university"></i>
                                                </div>
                                                <h5>Bank Transfer</h5>
                                                <p>Pay directly from your bank account via bank transfer</p>
                                                <button class="btn btn-primary">Bank Details</button>
                                            </div>
                                            
                                            <div class="payment-card">
                                                <div class="payment-icon">
                                                    <i class="fas fa-wallet"></i>
                                                </div>
                                                <h5>E-Wallet</h5>
                                                <p>Pay using your preferred electronic wallet service</p>
                                                <button class="btn btn-primary">Pay with E-Wallet</button>
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