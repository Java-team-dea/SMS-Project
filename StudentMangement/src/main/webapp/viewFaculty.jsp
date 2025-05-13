<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Faculty Members | NSBM Green University</title>
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

        /* Faculty Cards */
        .faculty-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 1.5rem;
        }

        .faculty-card {
            background-color: white;
            border-radius: 12px;
            box-shadow: var(--shadow);
            overflow: hidden;
            transition: all 0.3s ease;
            border-left: 4px solid var(--primary-color);
            height: 100%;
        }

        .faculty-card:hover {
            transform: translateY(-5px);
            box-shadow: var(--shadow-md);
        }

        .faculty-avatar {
            width: 64px;
            height: 64px;
            background-color: var(--primary-color);
            color: white;
            font-size: 1.5rem;
            font-weight: 600;
        }

        .faculty-info h5 {
            font-weight: 600;
            font-size: 1.1rem;
            margin-bottom: 0.25rem;
            color: var(--dark-color);
        }

        .faculty-info p {
            font-size: 0.875rem;
            color: var(--gray-600);
            margin-bottom: 0;
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

        /* Search Bar */
        .search-container {
            max-width: 500px;
            margin-bottom: 2rem;
        }

        .search-input {
            border-radius: 30px;
            padding-left: 1rem;
            border: 2px solid var(--gray-200);
            box-shadow: var(--shadow-sm);
        }

        .search-input:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 3px rgba(0, 146, 69, 0.2);
        }

        .search-btn {
            border-radius: 0 30px 30px 0;
            background-color: var(--primary-color);
            border-color: var(--primary-color);
        }

        .search-btn:hover {
            background-color: var(--secondary-color);
            border-color: var(--secondary-color);
        }

        /* Department Filters */
        .department-filters {
            margin-bottom: 1.5rem;
        }

        .department-badge {
            background-color: var(--accent-color);
            border: 1px solid var(--primary-color);
            color: var(--primary-color);
            transition: all 0.3s ease;
            cursor: pointer;
            margin-right: 0.5rem;
            margin-bottom: 0.5rem;
        }

        .department-badge:hover, .department-badge.active {
            background-color: var(--primary-color);
            color: white;
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

            .faculty-grid {
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
                                <a href="myCourses.jsp" class="nav-link">
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
                                <a href="exams.jsp" class="nav-link">
                                    <i class="fas fa-file-alt"></i> Exams
                                </a>
                                <a href="viewFaculty.jsp" class="nav-link active">
                                    <i class="fas fa-chalkboard-teacher"></i> Faculty
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
                    
                    <!-- Main Content Area -->
                    <div class="col-lg-9">
                        <!-- Page Header -->
                        <div class="dashboard-card mb-4">
                            <div class="dashboard-header d-flex justify-content-between align-items-center">
                                <h4><i class="fas fa-chalkboard-teacher me-2"></i> Faculty Members</h4>
                                <button class="btn btn-sm btn-primary" data-bs-toggle="modal" data-bs-target="#contactModal">
                                    <i class="fas fa-envelope me-1"></i> Contact Faculty
                                </button>
                            </div>
                            <div class="dashboard-body">
                                <!-- Search and Filter Section -->
                                <div class="row mb-4">
                                    <div class="col-md-8">
                                        <div class="search-container">
                                            <div class="input-group">
                                                <input type="text" class="form-control search-input" placeholder="Search faculty by name or department..." id="searchFaculty">
                                                <button class="btn search-btn" type="button">
                                                    <i class="fas fa-search text-white"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4 text-md-end">
                                        <div class="dropdown">
                                            <button class="btn btn-outline-primary dropdown-toggle" type="button" id="filterDepartment" data-bs-toggle="dropdown" aria-expanded="false">
                                                <i class="fas fa-filter me-1"></i> Filter by Department
                                            </button>
                                            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="filterDepartment">
                                                <li><a class="dropdown-item" href="#">All Departments</a></li>
                                                <li><a class="dropdown-item" href="#">Computer Science</a></li>
                                                <li><a class="dropdown-item" href="#">Business Management</a></li>
                                                <li><a class="dropdown-item" href="#">Engineering</a></li>
                                                <li><a class="dropdown-item" href="#">Design</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                
                                <!-- Department Quick Filters -->
                                <div class="department-filters">
                                    <span class="badge department-badge active">All</span>
                                    <span class="badge department-badge">Computer Science</span>
                                    <span class="badge department-badge">Business Management</span>
                                    <span class="badge department-badge">Engineering</span>
                                    <span class="badge department-badge">Design</span>
                                </div>
                                
                                <!-- Faculty Grid -->
                                <div class="faculty-grid">
                                    <c:forEach var="fac" items="${facultyList}">
                                        <div class="faculty-card">
                                            <div class="p-4">
                                                <div class="d-flex align-items-center mb-3">
                                                    <div class="faculty-avatar rounded-circle d-flex align-items-center justify-content-center me-3">
                                                        ${fac.name.charAt(0)}
                                                    </div>
                                                    <div class="faculty-info">
                                                        <h5>${fac.name}</h5>
                                                        <p class="mb-0">${fac.department}</p>
                                                    </div>
                                                </div>
                                                <div class="faculty-details">
                                                    <div class="d-flex align-items-center my-2">
                                                        <i class="fas fa-envelope text-primary me-2"></i>
                                                        <span class="small">${fac.email}</span>
                                                    </div>
                                                    <div class="d-flex align-items-center my-2">
                                                        <i class="fas fa-phone-alt text-primary me-2"></i>
                                                        <span class="small">${fac.phone}</span>
                                                    </div>
                                                    <div class="d-flex align-items-center my-2">
                                                        <i class="fas fa-graduation-cap text-primary me-2"></i>
                                                        <span class="small">${fac.specialization}</span>
                                                    </div>
                                                </div>
                                                <div class="mt-3 d-flex gap-2">
                                                    <button class="btn btn-sm btn-outline-primary">
                                                        <i class="fas fa-envelope me-1"></i> Contact
                                                    </button>
                                                    <button class="btn btn-sm btn-outline-secondary">
                                                        <i class="fas fa-info-circle me-1"></i> Details
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                                
                                <!-- If no faculty members are found -->
                                <c:if test="${empty facultyList}">
                                    <div class="text-center py-5">
                                        <i class="fas fa-user-slash text-secondary" style="font-size: 3rem;"></i>
                                        <h5 class="mt-3">No Faculty Members Found</h5>
                                        <p class="text-secondary">There are no faculty members matching your criteria.</p>
                                    </div>
                                </c:if>
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

    <!-- Contact Faculty Modal -->
    <div class="modal fade" id="contactModal" tabindex="-1" aria-labelledby="contactModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header bg-primary text-white">
                    <h5 class="modal-title" id="contactModalLabel">Contact Faculty</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="mb-3">
                            <label for="facultySelect" class="form-label">Select Faculty Member</label>
                            <select class="form-select" id="facultySelect">
                                <option selected>Choose a faculty member...</option>
                                <c:forEach var="fac" items="${facultyList}">
                                    <option value="${fac.id}">${fac.name} - ${fac.department}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label for="subjectInput" class="form-label">Subject</label>
                            <input type="text" class="form-control" id="subjectInput" placeholder="Enter subject">
                        </div>
                        <div class="mb-3">
                            <label for="messageText" class="form-label">Message</label>
                            <textarea class="form-control" id="messageText" rows="5" placeholder="Type your message here..."></textarea>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="button" class="btn btn-primary">Send Message</button>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Search functionality
        document.getElementById('searchFaculty').addEventListener('input', function() {
            const searchTerm = this.value.toLowerCase();
            const facultyCards = document.querySelectorAll('.faculty-card');
            
            facultyCards.forEach(card => {
                const name = card.querySelector('h5').textContent.toLowerCase();
                const department = card.querySelector('.faculty-info p').textContent.toLowerCase();
                
                if (name.includes(searchTerm) || department.includes(searchTerm)) {
                    card.style.display = 'block';
                } else {
                    card.style.display = 'none';
                }
            });
        });
        
        // Department filter badges
        const departmentBadges = document.querySelectorAll('.department-badge');
        departmentBadges.forEach(badge => {
            badge.addEventListener('click', function() {
                // Remove active class from all badges
                departmentBadges.forEach(b => b.classList.remove('active'));
                
                // Add active class to clicked badge
                this.classList.add('active');
                
                // Filter logic would go here
            });
        });
    </script>
</body>
</html>