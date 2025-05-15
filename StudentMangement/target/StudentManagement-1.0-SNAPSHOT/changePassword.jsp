<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="com.model.Student"%>
<%
    // Retrieve the logged-in student object from the session
    Student student = (Student) session.getAttribute("student");
    if (student == null) {
        // Redirect to login page if no user is logged in
        response.sendRedirect("studentlogin.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Student Portal | Change Password</title>
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

            /* Password Card */
            .password-card {
                background-color: rgba(255, 255, 255, 0.98);
                border-radius: 16px;
                box-shadow: 0 10px 30px rgba(0, 0, 0, 0.15);
                overflow: hidden;
                backdrop-filter: blur(10px);
            }

            .password-header {
                padding: 1.25rem 1.5rem;
                border-bottom: 1px solid var(--gray-200);
                position: relative;
            }

            .password-header:after {
                content: '';
                position: absolute;
                bottom: -1px;
                left: 1.5rem;
                width: 50px;
                height: 3px;
                background: linear-gradient(90deg, var(--primary-color), var(--secondary-color));
            }

            .password-header h4 {
                font-weight: 600;
                font-size: 1.25rem;
                margin-bottom: 0;
            }

            .password-body {
                padding: 2rem;
            }

            .password-icon {
                width: 100px;
                height: 100px;
                border-radius: 50%;
                background-color: var(--accent-color);
                color: var(--primary-color);
                font-size: 2.5rem;
                display: flex;
                align-items: center;
                justify-content: center;
                margin: 0 auto 2rem;
                box-shadow: var(--shadow);
            }

            .form-label {
                font-weight: 500;
                color: var(--dark-color);
            }

            .form-control {
                border: 1px solid var(--gray-300);
                padding: 0.75rem;
                border-radius: 8px;
                transition: all 0.3s ease;
            }

            .form-control:focus {
                border-color: var(--primary-color);
                box-shadow: 0 0 0 0.2rem rgba(0, 146, 69, 0.25);
            }

            .password-toggle {
                cursor: pointer;
                color: var(--gray-600);
                transition: all 0.2s ease;
            }

            .password-toggle:hover {
                color: var(--primary-color);
            }

            .password-strength {
                height: 5px;
                border-radius: 5px;
                margin-top: 0.5rem;
                background-color: var(--gray-200);
                overflow: hidden;
            }

            .password-strength-bar {
                height: 100%;
                width: 0%;
                transition: all 0.3s ease;
            }

            .password-feedback {
                font-size: 0.85rem;
                margin-top: 0.5rem;
                color: var(--gray-600);
            }

            .requirements-list {
                margin-top: 1rem;
                padding-left: 1.25rem;
            }

            .requirements-list li {
                font-size: 0.85rem;
                color: var(--gray-600);
                margin-bottom: 0.5rem;
            }

            .requirements-list li.valid {
                color: var(--primary-color);
            }

            .btn-primary {
                background: linear-gradient(135deg, var(--primary-color) 0%, var(--secondary-color) 100%);
                border: none;
                font-weight: 600;
                padding: 0.5rem 1.5rem;
                border-radius: 8px;
                transition: all 0.3s ease;
            }

            .btn-primary:hover {
                transform: translateY(-2px);
                box-shadow: 0 5px 15px rgba(0, 146, 69, 0.3);
                background: linear-gradient(135deg, var(--primary-color) 20%, var(--secondary-color) 100%);
            }

            .btn-outline-secondary {
                color: var(--gray-600);
                border-color: var(--gray-300);
                font-weight: 500;
                transition: all 0.3s ease;
            }
            
            .btn-outline-secondary:hover {
                background-color: var(--gray-100);
                color: var(--dark-color);
                border-color: var(--gray-400);
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

                .password-card {
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
                                    <a href="profile.jsp" class="nav-link active">
                                        <i class="fas fa-user"></i> Profile
                                    </a>
                                    <a href="LogoutServlet" class="nav-link logout">
                                        <i class="fas fa-sign-out-alt"></i> Logout
                                    </a>
                                </div>
                            </div>
                        </div>

                        <!-- Main Password Change Area -->
                        <div class="col-lg-9">
                            <div class="password-card">
                                <div class="password-header">
                                    <h4><i class="fas fa-lock me-2"></i> Change Password</h4>
                                </div>
                                <div class="password-body">
                                    <div class="password-icon">
                                        <i class="fas fa-key"></i>
                                    </div>

                                    <!-- Show alert message if any -->
                                    <c:if test="${not empty message}">
                                        <div class="alert ${messageType == 'success' ? 'alert-success' : 'alert-danger'} alert-dismissible fade show mb-4" role="alert">
                                            ${message}
                                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                        </div>
                                    </c:if>

                                    <form action="ChangePasswordServlet" method="post" id="passwordForm" class="needs-validation" novalidate>
                                        <input type="hidden" name="studentId" value="${student.id}" />

                                        <div class="mb-4">
                                            <label for="currentPassword" class="form-label">Current Password</label>
                                            <div class="input-group">
                                                <input type="password" class="form-control" id="currentPassword" name="currentPassword" required>
                                                <span class="input-group-text password-toggle" onclick="togglePassword('currentPassword')">
                                                    <i class="fas fa-eye" id="currentPasswordIcon"></i>
                                                </span>
                                            </div>
                                            <div class="invalid-feedback">
                                                Please enter your current password
                                            </div>
                                        </div>

                                        <div class="mb-3">
                                            <label for="newPassword" class="form-label">New Password</label>
                                            <div class="input-group">
                                                <input type="password" class="form-control" id="newPassword" name="newPassword" 
                                                       pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$" 
                                                       required
                                                       onkeyup="checkPasswordStrength()">
                                                <span class="input-group-text password-toggle" onclick="togglePassword('newPassword')">
                                                    <i class="fas fa-eye" id="newPasswordIcon"></i>
                                                </span>
                                            </div>
                                            <div class="password-strength">
                                                <div class="password-strength-bar" id="passwordStrengthBar"></div>
                                            </div>
                                            <div class="password-feedback" id="passwordFeedback">Password strength</div>
                                            <div class="invalid-feedback">
                                                Password must meet all requirements below
                                            </div>
                                        </div>

                                        <ul class="requirements-list" id="passwordRequirements">
                                            <li id="length-req">At least 8 characters</li>
                                            <li id="uppercase-req">At least one uppercase letter</li>
                                            <li id="lowercase-req">At least one lowercase letter</li>
                                            <li id="number-req">At least one number</li>
                                            <li id="special-req">At least one special character (@$!%*?&)</li>
                                        </ul>

                                        <div class="mb-4">
                                            <label for="confirmPassword" class="form-label">Confirm New Password</label>
                                            <div class="input-group">
                                                <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" required>
                                                <span class="input-group-text password-toggle" onclick="togglePassword('confirmPassword')">
                                                    <i class="fas fa-eye" id="confirmPasswordIcon"></i>
                                                </span>
                                                <div class="invalid-feedback">
                                                    Passwords do not match
                                                </div>
                                            </div>
                                            <div class="form-text" id="passwordMatch"></div>
                                        </div>

                                        <div class="d-flex gap-2 mt-4">
                                            <button type="submit" class="btn btn-primary" id="submitBtn">
                                                <i class="fas fa-check-circle me-2"></i> Update Password
                                            </button>
                                            
                                            <a href="profile.jsp" class="btn btn-outline-secondary">
                                                <i class="fas fa-arrow-left me-2"></i> Back to Profile
                                            </a>
                                        </div>
                                    </form>
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
        <script>
            // Toggle password visibility
            function togglePassword(inputId) {
                const passwordInput = document.getElementById(inputId);
                const icon = document.getElementById(inputId + 'Icon');
                
                if (passwordInput.type === 'password') {
                    passwordInput.type = 'text';
                    icon.classList.remove('fa-eye');
                    icon.classList.add('fa-eye-slash');
                } else {
                    passwordInput.type = 'password';
                    icon.classList.remove('fa-eye-slash');
                    icon.classList.add('fa-eye');
                }
            }
            
            // Check password strength
            function checkPasswordStrength() {
                const password = document.getElementById('newPassword').value;
                const strengthBar = document.getElementById('passwordStrengthBar');
                const feedback = document.getElementById('passwordFeedback');
                
                // Check requirements
                const hasLength = password.length >= 8;
                const hasUpperCase = /[A-Z]/.test(password);
                const hasLowerCase = /[a-z]/.test(password);
                const hasNumber = /\d/.test(password);
                const hasSpecial = /[@$!%*?&]/.test(password);
                
                // Update requirement list
                document.getElementById('length-req').classList.toggle('valid', hasLength);
                document.getElementById('uppercase-req').classList.toggle('valid', hasUpperCase);
                document.getElementById('lowercase-req').classList.toggle('valid', hasLowerCase);
                document.getElementById('number-req').classList.toggle('valid', hasNumber);
                document.getElementById('special-req').classList.toggle('valid', hasSpecial);
                
                // Calculate strength
                let strength = 0;
                if (hasLength) strength += 20;
                if (hasUpperCase) strength += 20;
                if (hasLowerCase) strength += 20;
                if (hasNumber) strength += 20;
                if (hasSpecial) strength += 20;
                
                // Update strength bar
                strengthBar.style.width = strength + '%';
                
                // Set color based on strength
                if (strength <= 40) {
                    strengthBar.style.backgroundColor = '#dc3545'; // red
                    feedback.textContent = 'Weak password';
                    feedback.style.color = '#dc3545';
                } else if (strength <= 80) {
                    strengthBar.style.backgroundColor = '#ffc107'; // yellow
                    feedback.textContent = 'Moderate password';
                    feedback.style.color = '#ffc107';
                } else {
                    strengthBar.style.backgroundColor = '#198754'; // green
                    feedback.textContent = 'Strong password';
                    feedback.style.color = '#198754';
                }
                
                // Check if passwords match
                checkPasswordsMatch();
            }
            
            // Check if passwords match
            function checkPasswordsMatch() {
                const newPassword = document.getElementById('newPassword').value;
                const confirmPassword = document.getElementById('confirmPassword').value;
                const matchText = document.getElementById('passwordMatch');
                const submitBtn = document.getElementById('submitBtn');
                
                if (confirmPassword === '') {
                    matchText.textContent = '';
                    return;
                }
                
                if (newPassword === confirmPassword) {
                    matchText.textContent = 'Passwords match!';
                    matchText.style.color = '#198754'; // green
                    submitBtn.disabled = false;
                } else {
                    matchText.textContent = 'Passwords do not match!';
                    matchText.style.color = '#dc3545'; // red
                    submitBtn.disabled = true;
                }
            }
            
            // Form validation
            document.addEventListener('DOMContentLoaded', function() {
                const confirmPassword = document.getElementById('confirmPassword');
                
                confirmPassword.addEventListener('keyup', checkPasswordsMatch);
                
                const form = document.getElementById('passwordForm');
                form.addEventListener('submit', function(event) {
                    if (!form.checkValidity()) {
                        event.preventDefault();
                        event.stopPropagation();
                    }
                    
                    // Additional custom validation
                    const newPassword = document.getElementById('newPassword').value;
                    if (confirmPassword.value !== newPassword) {
                        event.preventDefault();
                        event.stopPropagation();
                        document.getElementById('passwordMatch').textContent = 'Passwords do not match!';
                        document.getElementById('passwordMatch').style.color = '#dc3545';
                    }
                    
                    form.classList.add('was-validated');
                });
            });
        </script>
    </body>
</html>