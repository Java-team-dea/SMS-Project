<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Portal | Examination Schedule</title>
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

        /* Exam Main Content */
        .exams-card {
            background-color: rgba(255, 255, 255, 0.98);
            border-radius: 16px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.15);
            overflow: hidden;
            backdrop-filter: blur(10px);
            margin-bottom: 1.5rem;
        }

        .exams-header {
            padding: 1.25rem 1.5rem;
            border-bottom: 1px solid var(--gray-200);
            position: relative;
        }

        .exams-header:after {
            content: '';
            position: absolute;
            bottom: -1px;
            left: 1.5rem;
            width: 50px;
            height: 3px;
            background: linear-gradient(90deg, var(--primary-color), var(--secondary-color));
        }

        .exams-header h4 {
            font-weight: 600;
            font-size: 1.25rem;
            margin-bottom: 0;
        }

        .exams-body {
            padding: 1.5rem;
        }

        /* Info alerts */
        .alert-panel {
            border-left: 4px solid var(--primary-color);
            background-color: var(--accent-color);
            padding: 1rem;
            border-radius: 8px;
            margin-bottom: 1rem;
        }
        
        .alert-panel.warning {
            border-left-color: #ff9800;
            background-color: #fff3e0;
        }
        
        .alert-panel.danger {
            border-left-color: #f44336;
            background-color: #ffebee;
        }
        
        .alert-panel.info {
            border-left-color: #2196f3;
            background-color: #e3f2fd;
        }
        
        .alert-panel h5 {
            color: var(--primary-color);
            margin-bottom: 0.5rem;
            font-weight: 600;
            font-size: 1rem;
        }
        
        .alert-panel.warning h5 {
            color: #e65100;
        }
        
        .alert-panel.danger h5 {
            color: #b71c1c;
        }
        
        .alert-panel.info h5 {
            color: #0d47a1;
        }
        
        .alert-panel p {
            margin-bottom: 0;
            font-size: 0.9rem;
        }
        
        /* Timeline styles */
        .timeline {
            position: relative;
            padding: 0;
            list-style: none;
            margin-bottom: 0;
        }

        .timeline:before {
            content: '';
            position: absolute;
            top: 0;
            bottom: 0;
            left: 20px;
            width: 3px;
            background: var(--gray-200);
        }

        .timeline-item {
            position: relative;
            margin-bottom: 1.5rem;
            padding-left: 45px;
        }

        .timeline-item:last-child {
            margin-bottom: 0;
        }

        .timeline-badge {
            position: absolute;
            top: 0;
            left: 0;
            width: 40px;
            height: 40px;
            border-radius: 50%;
            text-align: center;
            line-height: 40px;
            background-color: var(--primary-color);
            color: white;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .timeline-badge i {
            font-size: 1rem;
        }

        .timeline-panel {
            padding: 1rem;
            border-radius: 10px;
            background-color: white;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
        }

        .timeline-date {
            display: block;
            font-size: 0.85rem;
            color: var(--gray-600);
            margin-bottom: 0.5rem;
        }

        .timeline-title {
            margin-bottom: 0.35rem;
            font-weight: 600;
            font-size: 1rem;
        }

        .timeline-details {
            margin-bottom: 0;
            font-size: 0.9rem;
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
            
            .timeline:before {
                left: 15px;
            }
            
            .timeline-item {
                padding-left: 40px;
            }
            
            .timeline-badge {
                width: 30px;
                height: 30px;
                line-height: 30px;
            }
            
            .timeline-badge i {
                font-size: 0.8rem;
            }
        }
        
        /* File download link styles */
        .file-link {
            display: inline-flex;
            align-items: center;
            padding: 0.5rem 1rem;
            background-color: var(--gray-100);
            border-radius: 8px;
            color: var(--dark-color);
            text-decoration: none;
            font-weight: 500;
            font-size: 0.9rem;
            margin-top: 1rem;
            transition: all 0.2s ease;
        }
        
        .file-link:hover {
            background-color: var(--accent-color);
            transform: translateY(-2px);
        }
        
        .file-link i {
            margin-right: 0.5rem;
            color: var(--primary-color);
        }
        
        /* Action buttons */
        .action-btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            padding: 0.5rem 1rem;
            border-radius: 8px;
            font-weight: 500;
            transition: all 0.3s ease;
            text-decoration: none;
            margin-top: 1rem;
            font-size: 0.9rem;
        }
        
        .action-btn-primary {
            background: linear-gradient(135deg, var(--primary-color) 0%, var(--secondary-color) 100%);
            color: white;
            border: none;
        }
        
        .action-btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 146, 69, 0.3);
            color: white;
        }
        
        .action-btn-secondary {
            background-color: var(--light-color);
            color: var(--dark-color);
            border: 1px solid var(--gray-200);
        }
        
        .action-btn-secondary:hover {
            background-color: var(--gray-100);
            color: var(--dark-color);
        }
        
        .action-btn i {
            margin-right: 0.5rem;
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
                                <a href="MyCoursesServlet" class="nav-link">
                                    <i class="fas fa-book"></i> My Courses
                                </a>
                                <a href="myAttendance.jsp" class="nav-link">
                                    <i class="fas fa-calendar-check"></i> Attendance
                                </a>
                                <a href="myGrades.jsp" class="nav-link">
                                    <i class="fas fa-chart-line"></i> Grades
                                </a>
                                <a href="myFees.jsp" class="nav-link">
                                    <i class="fas fa-money-bill-wave"></i> Fees
                                </a>
                                <a href="exams.jsp" class="nav-link active">
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
                    
                    <!-- Main Exams Area -->
                    <div class="col-lg-9">
                        <!-- Exam Announcements Section -->
                        <div class="exams-card">
                            <div class="exams-header">
                                <h4><i class="fas fa-bullhorn me-2"></i> Examination Announcements</h4>
                            </div>
                            <div class="exams-body">
                                <!-- Primary Announcement -->
                                <div class="alert-panel">
                                    <div class="d-flex">
                                        <div class="me-3">
                                            <i class="fas fa-bullhorn fa-2x text-success"></i>
                                        </div>
                                        <div>
                                            <h5>End of Semester Examinations</h5>
                                            <p>End of Semester Exams for 2025 are scheduled from June 5 to June 25, 2025. Please ensure you've registered for all required exams and paid any outstanding exam fees.</p>
                                            <a href="#" class="file-link">
                                                <i class="fas fa-file-pdf"></i> Complete Exam Schedule
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                
                                <!-- Warning Announcement -->
                                <div class="alert-panel warning">
                                    <div class="d-flex">
                                        <div class="me-3">
                                            <i class="fas fa-exclamation-triangle fa-2x text-warning"></i>
                                        </div>
                                        <div>
                                            <h5>Important Deadline Reminder</h5>
                                            <p>Exam registration deadline is May 25, 2025. Students with attendance below 80% must apply for special consideration by May 20, 2025.</p>
                                            <a href="#" class="action-btn action-btn-primary mt-2">
                                                <i class="fas fa-edit"></i> Register for Exams
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                
                                <!-- Urgent Announcement -->
                                <div class="alert-panel danger">
                                    <div class="d-flex">
                                        <div class="me-3">
                                            <i class="fas fa-exclamation-circle fa-2x text-danger"></i>
                                        </div>
                                        <div>
                                            <h5>Venue Change Notice</h5>
                                            <p>Due to ongoing renovations, all examinations previously scheduled for Main Hall B have been relocated to the New Auditorium. This affects PHYS301, CHEM202, and BIO105 exams. Please check your hall tickets for updated venue information.</p>
                                        </div>
                                    </div>
                                </div>
                                
                                <!-- Info Announcement -->
                                <div class="alert-panel info">
                                    <div class="d-flex">
                                        <div class="me-3">
                                            <i class="fas fa-info-circle fa-2x text-info"></i>
                                        </div>
                                        <div>
                                            <h5>Examination Regulations</h5>
                                            <p>Students are required to bring their university ID cards and hall tickets to all exams. Electronic devices are strictly prohibited in examination halls except for approved calculators. Please review the complete examination regulations on the university website.</p>
                                            <a href="#" class="file-link">
                                                <i class="fas fa-file-alt"></i> Exam Regulations
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                
                                <!-- Success Announcement -->
                                <div class="alert-panel">
                                    <div class="d-flex">
                                        <div class="me-3">
                                            <i class="fas fa-chalkboard-teacher fa-2x text-success"></i>
                                        </div>
                                        <div>
                                            <h5>Exam Preparation Workshops</h5>
                                            <p>The Student Success Center is offering pre-exam review workshops for core subjects from May 20-30, 2025. Sessions will cover exam strategies, practice questions, and key topic reviews. Registration is required as seats are limited.</p>
                                            <div class="mt-2">
                                                <a href="#" class="action-btn action-btn-primary me-2">
                                                    <i class="fas fa-calendar-check"></i> Register for Workshops
                                                </a>
                                                <a href="#" class="action-btn action-btn-secondary">
                                                    <i class="fas fa-list"></i> View Schedule
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <!-- Exam Timeline Card -->
                        <div class="exams-card">
                            <div class="exams-header">
                                <h4><i class="fas fa-calendar-alt me-2"></i> Examination Timeline</h4>
                            </div>
                            <div class="exams-body">
                                <ul class="timeline">
                                    <li class="timeline-item">
                                        <div class="timeline-badge">
                                            <i class="fas fa-edit"></i>
                                        </div>
                                        <div class="timeline-panel">
                                            <span class="timeline-date">May 15 - May 25, 2025</span>
                                            <h5 class="timeline-title">Exam Registration Period</h5>
                                            <p class="timeline-details">Students must register for all exams through the student portal. Late registration will incur additional fees.</p>
                                        </div>
                                    </li>
                                    <li class="timeline-item">
                                        <div class="timeline-badge">
                                            <i class="fas fa-money-bill"></i>
                                        </div>
                                        <div class="timeline-panel">
                                            <span class="timeline-date">May 15 - May 27, 2025</span>
                                            <h5 class="timeline-title">Exam Fee Payment Deadline</h5>
                                            <p class="timeline-details">All examination fees must be paid by this date. Students with outstanding fees will not be permitted to sit for exams.</p>
                                        </div>
                                    </li>
                                    <li class="timeline-item">
                                        <div class="timeline-badge">
                                            <i class="fas fa-ticket-alt"></i>
                                        </div>
                                        <div class="timeline-panel">
                                            <span class="timeline-date">May 30 - June 3, 2025</span>
                                            <h5 class="timeline-title">Hall Ticket Distribution</h5>
                                            <p class="timeline-details">Hall tickets will be available for download via the student portal. Physical copies can be collected from the examination office.</p>
                                        </div>
                                    </li>
                                    <li class="timeline-item">
                                        <div class="timeline-badge">
                                            <i class="fas fa-file-alt"></i>
                                        </div>
                                        <div class="timeline-panel">
                                            <span class="timeline-date">June 5 - June 25, 2025</span>
                                            <h5 class="timeline-title">Examination Period</h5>
                                            <p class="timeline-details">All end-of-semester examinations will be conducted during this period as per the published schedule.</p>
                                        </div>
                                    </li>
                                    <li class="timeline-item">
                                        <div class="timeline-badge">
                                            <i class="fas fa-chart-line"></i>
                                        </div>
                                        <div class="timeline-panel">
                                            <span class="timeline-date">July 15, 2025</span>
                                            <h5 class="timeline-title">Result Announcement</h5>
                                            <p class="timeline-details">Examination results will be published on the student portal. SMS notifications will also be sent to registered mobile numbers.</p>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        
                        <!-- Quick Access Links -->
                        <div class="exams-card">
                            <div class="exams-header">
                                <h4><i class="fas fa-link me-2"></i> Quick Access</h4>
                            </div>
                            <div class="exams-body">
                                <div class="row g-3">
                                    <div class="col-md-4">
                                        <a href="#" class="card text-center p-3 h-100 text-decoration-none">
                                            <div class="mb-2">
                                                <i class="fas fa-clipboard-list fa-3x text-success"></i>
                                            </div>
                                            <h5 class="mb-1">Exam Registration</h5>
                                            <p class="text-muted small mb-0">Register for upcoming exams</p>
                                        </a>
                                    </div>
                                    <div class="col-md-4">
                                        <a href="#" class="card text-center p-3 h-100 text-decoration-none">
                                            <div class="mb-2">
                                                <i class="fas fa-print fa-3x text-primary"></i>
                                            </div>
                                            <h5 class="mb-1">Hall Tickets</h5>
                                            <p class="text-muted small mb-0">Download your exam hall tickets</p>
                                        </a>
                                    </div>
                                    <div class="col-md-4">
                                        <a href="#" class="card text-center p-3 h-100 text-decoration-none">
                                            <div class="mb-2">
                                                <i class="fas fa-question-circle fa-3x text-warning"></i>
                                            </div>
                                            <h5 class="mb-1">Exam Support</h5>
                                            <p class="text-muted small mb-0">Get help with exam-related issues</p>
                                        </a>
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
                        &copy; 2025 NSBM Green University. All rights reserved.
                    </div>
                    <div class="social-icons">
                        <a href="#"><i class="fab fa-facebook-f"></i></a>
                        <a href="#"><i class="fab fa-twitter"></i></a>
                        <a href="#"><i class="fab fa-instagram"></i></a>
                        <a href="#"><i class="fab fa-linkedin-in"></i></a>
                    </div>
                </div>
            </div>
        </footer>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@