<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Login - NSBM Green University</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        :root {
            --primary-color: #009245;
            --secondary-color: #00692f;
            --accent-color: #e8f5e9;
            --dark-color: #212529;
            --light-color: #f8f9fa;
        }
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f9fafb;
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
        
        header {
            background-color: rgba(255, 255, 255, 0.95);
            border-bottom: 3px solid var(--primary-color);
            box-shadow: 0 2px 15px rgba(0, 0, 0, 0.1);
            position: relative;
            z-index: 100;
        }
        
        .university-name {
            color: var(--primary-color);
            font-size: 1.2rem;
            font-weight: 700;
            letter-spacing: 0.5px;
        }
        
        .login-wrapper {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: calc(100vh - 170px);
            padding: 2rem 0;
            position: relative;
            z-index: 10;
        }
        
        .login-container {
            background-color: rgba(255, 255, 255, 0.98);
            border-radius: 16px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.15);
            padding: 2.5rem;
            width: 100%;
            max-width: 450px;
            position: relative;
            overflow: hidden;
            backdrop-filter: blur(10px);
        }
        
        .login-header {
            position: relative;
            margin-bottom: 2rem;
            text-align: center;
            padding-bottom: 1rem;
        }
        
        .login-header:after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 50px;
            height: 3px;
            background: linear-gradient(90deg, var(--primary-color), var(--secondary-color));
        }
        
        .login-header h4 {
            color: var(--dark-color);
            font-weight: 700;
            margin-bottom: 0.5rem;
        }
        
        .input-group-text {
            background-color: white;
            border-right: none;
            color: #6c757d;
        }
        
        .form-control {
            border-left: none;
            padding-left: 0.5rem;
            font-size: 0.95rem;
            height: 46px;
        }
        
        .form-control:focus {
            box-shadow: none;
            border-color: var(--primary-color);
        }
        
        .input-group:focus-within .input-group-text {
            border-color: var(--primary-color);
            color: var(--primary-color);
        }
        
        .login-btn {
            background: linear-gradient(135deg, var(--primary-color) 0%, var(--secondary-color) 100%);
            border: none;
            font-weight: 600;
            padding: 0.7rem;
            border-radius: 8px;
            transition: all 0.3s ease;
        }
        
        .login-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 146, 69, 0.3);
        }
        
        .login-btn:active {
            transform: translateY(0);
        }
        
        .forgot-link {
            color: var(--primary-color);
            text-decoration: none;
            font-size: 0.85rem;
            transition: all 0.3s ease;
        }
        
        .forgot-link:hover {
            color: var(--secondary-color);
            text-decoration: underline;
        }
        
        .form-check-input:checked {
            background-color: var(--primary-color);
            border-color: var(--primary-color);
        }
        
        .support-link {
            color: var(--primary-color);
            text-decoration: none;
            transition: all 0.3s ease;
        }
        
        .support-link:hover {
            color: var(--secondary-color);
            text-decoration: underline;
        }
        
        .badge-student {
            background-color: #0066cc;
            color: white;
            font-size: 0.7rem;
            padding: 0.25rem 0.5rem;
            border-radius: 30px;
            margin-left: 0.5rem;
            font-weight: 500;
        }

        .register-link {
            display: inline-block;
            margin-top: 1rem;
            color: var(--primary-color);
            text-decoration: none;
            font-size: 0.9rem;
            transition: all 0.3s ease;
        }
        
        .register-link:hover {
            color: var(--secondary-color);
            text-decoration: underline;
        }
        
        .floating-help {
            position: fixed;
            bottom: 80px;
            right: 20px;
            width: 50px;
            height: 50px;
            border-radius: 50%;
            background-color: white;
            color: var(--primary-color);
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.15);
            cursor: pointer;
            transition: all 0.3s ease;
            z-index: 100;
        }
        
        .floating-help:hover {
            transform: scale(1.1);
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.2);
        }
        
        footer {
            background-color: rgba(33, 37, 41, 0.95);
            padding: 1.5rem 0;
            position: relative;
            z-index: 10;
        }
        
        .social-icons a {
            color: white;
            opacity: 0.7;
            margin: 0 10px;
            transition: all 0.3s ease;
        }
        
        .social-icons a:hover {
            opacity: 1;
            transform: translateY(-3px);
        }
        
        .alert {
            border-radius: 8px;
            border-left: 4px solid #dc3545;
        }
        
        @media (max-width: 576px) {
            .login-container {
                padding: 1.8rem;
                margin: 0 1rem;
                border-radius: 12px;
            }
        }
    </style>
</head>
<body>
    <!-- Header -->
    <header class="py-3">
        <div class="container d-flex justify-content-between align-items-center">
            <a href="index.jsp" class="d-flex align-items-center text-decoration-none">
                <img src="images/nsbm-logo.png" alt="NSBM Logo" height="45">
                <div class="ms-3">
                    <span class="d-block university-name">NSBM GREEN UNIVERSITY</span>
                    <div class="d-flex align-items-center mt-1">
                        <small class="text-muted">Student Management System</small>
                        <span class="badge-student ms-2">STUDENT PORTAL</span>
                    </div>
                </div>
            </a>
            <div>
                <a href="#" class="btn btn-light btn-sm rounded-circle shadow-sm" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Need Help?">
                    <i class="fas fa-question-circle text-muted"></i>
                </a>
            </div>
        </div>
    </header>

    <!-- Login Container -->
    <div class="login-wrapper">
        <div class="login-container">
            <div class="login-header">
                <h4>Student Login</h4>
                <p class="text-muted small">Access your student account</p>
            </div>
            
            <!-- Show error message if exists -->
            <c:if test="${not empty errorMessage}">
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    <i class="fas fa-exclamation-circle me-2"></i>${errorMessage}
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            </c:if>
            
            <form action="LoginServlet" method="post" class="needs-validation" novalidate>
                <div class="mb-4">
                    <label for="email" class="form-label small fw-bold">Email</label>
                    <div class="input-group">
                        <span class="input-group-text border-end-0"><i class="fas fa-envelope"></i></span>
                        <input type="email" class="form-control border-start-0" id="email" name="email" 
                               placeholder="Enter your student email" required autocomplete="off">
                    </div>
                    <div class="invalid-feedback">Please enter a valid email address</div>
                </div>
                <div class="mb-4">
                    <div class="d-flex justify-content-between align-items-center mb-1">
                        <label for="password" class="form-label small fw-bold">Password</label>
                        <a href="forgotPassword.jsp" class="forgot-link">Forgot password?</a>
                    </div>
                    <div class="input-group">
                        <span class="input-group-text border-end-0"><i class="fas fa-lock"></i></span>
                        <input type="password" class="form-control border-start-0" id="password" name="password" 
                               placeholder="Enter your password" required>
                        <span class="input-group-text bg-white border-start-0" style="cursor: pointer;" onclick="togglePassword()">
                            <i class="fas fa-eye-slash" id="toggleIcon"></i>
                        </span>
                    </div>
                    <div class="invalid-feedback">Please enter your password</div>
                </div>
                <div class="mb-4 form-check">
                    <input type="checkbox" class="form-check-input" id="rememberMe" name="rememberMe">
                    <label class="form-check-label small" for="rememberMe">Remember me</label>
                </div>
                <div class="d-grid">
                    <button type="submit" class="btn login-btn text-white py-2">
                        <i class="fas fa-sign-in-alt me-2"></i>Login
                    </button>
                </div>
            </form>
            
            <div class="text-center mt-4">
                <p class="small text-muted mb-2">
                    <i class="fas fa-shield-alt me-1"></i> Protected by NSBM Security Protocol
                </p>
                <p class="small text-muted mb-1">
                    New student? <a href="studentRegistration.jsp" class="register-link">Register here</a>
                </p>
                <p class="small text-muted">
                    Need help? <a href="studentSupport.jsp" class="support-link">Contact Student Support</a>
                </p>
            </div>
        </div>
    </div>
    
    <!-- Floating Help Button -->
    <a href="studentHelp.jsp" class="floating-help" data-bs-toggle="tooltip" data-bs-placement="left" title="Student Help Center">
        <i class="fas fa-headset"></i>
    </a>

    <!-- Footer -->
    <footer class="text-white">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-md-6 text-center text-md-start">
                    <p class="small mb-0">© 2025 NSBM Green University. All Rights Reserved.</p>
                </div>
                <div class="col-md-6 text-center text-md-end mt-3 mt-md-0">
                    <div class="social-icons">
                        <a href="#"><i class="fab fa-facebook-f"></i></a>
                        <a href="#"><i class="fab fa-twitter"></i></a>
                        <a href="#"><i class="fab fa-instagram"></i></a>
                        <a href="#"><i class="fab fa-linkedin-in"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Initialize tooltips
        var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
        var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
            return new bootstrap.Tooltip(tooltipTriggerEl)
        });
        
        // Form validation
        (function () {
            'use strict'
            var forms = document.querySelectorAll('.needs-validation')
            Array.prototype.slice.call(forms)
                .forEach(function (form) {
                    form.addEventListener('submit', function (event) {
                        if (!form.checkValidity()) {
                            event.preventDefault()
                            event.stopPropagation()
                        }
                        form.classList.add('was-validated')
                    }, false)
                })
        })();
        
        // Toggle password visibility
        function togglePassword() {
            const passwordInput = document.getElementById('password');
            const toggleIcon = document.getElementById('toggleIcon');
            
            if (passwordInput.type === 'password') {
                passwordInput.type = 'text';
                toggleIcon.classList.remove('fa-eye-slash');
                toggleIcon.classList.add('fa-eye');
            } else {
                passwordInput.type = 'password';
                toggleIcon.classList.remove('fa-eye');
                toggleIcon.classList.add('fa-eye-slash');
            }
        }
        
    </script>
</body>
</html>