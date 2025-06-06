<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Student | NSBM Green University</title>
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
            background-color: #FF5722;
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

        /* Form Card */
        .form-card {
            background-color: rgba(255, 255, 255, 0.98);
            border-radius: 16px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.15);
            overflow: hidden;
            backdrop-filter: blur(10px);
            margin-bottom: 2rem;
        }

        .form-header {
            padding: 1.5rem;
            border-bottom: 1px solid var(--gray-200);
            position: relative;
        }

        .form-header:after {
            content: '';
            position: absolute;
            bottom: -1px;
            left: 1.5rem;
            width: 50px;
            height: 3px;
            background: linear-gradient(90deg, var(--primary-color), var(--secondary-color));
        }

        .form-header h2 {
            font-weight: 600;
            font-size: 1.5rem;
            margin-bottom: 0;
            color: var(--dark-color);
        }

        .form-body {
            padding: 2rem;
        }

        /* Form Controls */
        .form-label {
            color: var(--dark-color);
            font-weight: 500;
            margin-bottom: 0.5rem;
        }

        .form-control {
            padding: 0.75rem 1rem;
            border: 1px solid var(--gray-300);
            border-radius: 8px;
            transition: all 0.3s ease;
        }

        .form-control:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 3px rgba(0, 146, 69, 0.2);
        }

        /* Button styles */
        .btn-primary {
            background: linear-gradient(135deg, var(--primary-color) 0%, var(--secondary-color) 100%);
            border: none;
            font-weight: 600;
            padding: 0.75rem 1.5rem;
            border-radius: 8px;
            transition: all 0.3s ease;
        }
        
        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 146, 69, 0.3);
            background: linear-gradient(135deg, var(--primary-color) 20%, var(--secondary-color) 100%);
        }

        .btn-secondary {
            background-color: var(--gray-100);
            border: 1px solid var(--gray-300);
            color: var(--dark-color);
            font-weight: 500;
            padding: 0.75rem 1.5rem;
            border-radius: 8px;
            transition: all 0.3s ease;
        }
        
        .btn-secondary:hover {
            background-color: var(--gray-200);
            transform: translateY(-2px);
        }

        .back-link {
            color: var(--primary-color);
            text-decoration: none;
            font-weight: 500;
            display: inline-flex;
            align-items: center;
            transition: all 0.3s ease;
        }

        .back-link:hover {
            color: var(--secondary-color);
            text-decoration: underline;
        }

        /* Footer */
        .app-footer {
            background-color: rgba(33, 37, 41, 0.95);
            padding: 1.5rem 0;
            color: white;
            position: relative;
            z-index: 10;
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
    </style>
</head>
<body>
    <div class="app-wrapper">
        <!-- Header -->
        <header class="app-header py-3">
            <div class="container">
                <div class="d-flex justify-content-between align-items-center">
                    <a href="index.jsp" class="text-decoration-none university-brand">
                        <div>
                            <h1 class="university-name">NSBM GREEN UNIVERSITY</h1>
                            <div class="d-flex align-items-center">
                                <p class="university-system">Student Management System</p>
                                <span class="admin-badge">ADMIN PORTAL</span>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
        </header>

        <!-- Main Content -->
        <main class="content-wrapper">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-8">
                        <div class="form-card">
                            <div class="form-header">
                                <h2><i class="fas fa-user-edit me-2"></i>Edit Student Details</h2>
                            </div>
                            <div class="form-body">
                                <!-- Error Message -->
                                <c:if test="${not empty param.error}">
                                    <div class="alert alert-danger">${param.error}</div>
                                </c:if>
                                
                                <form action="${pageContext.request.contextPath}/UpdateStudentServlet1" method="post">
    <input type="hidden" name="id" value="${student.id}">
                                    
                                    <div class="row mb-4">
                                        <div class="col-md-6 mb-3">
                                            <label for="name" class="form-label">Full Name</label>
                                            <input type="text" class="form-control" id="name" name="name" 
                                                   value="${student.name}" required>
                                        </div>
                                        
                                       <div class="col-md-6 mb-3">
    <label for="dob" class="form-label">Date of Birth</label>
    <input type="date" class="form-control" id="dob" name="dob" 
           value="<fmt:formatDate value='${student.dob}' pattern='yyyy-MM-dd'/>" required>
</div>
                                    </div>
                                    
                                    <div class="row mb-4">
                                        <div class="col-md-6 mb-3">
                                            <label class="form-label">Gender</label>
                                            <div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio" name="gender" 
                                                           id="male" value="Male" ${student.gender eq 'Male' ? 'checked' : ''}>
                                                    <label class="form-check-label" for="male">Male</label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio" name="gender" 
                                                           id="female" value="Female" ${student.gender eq 'Female' ? 'checked' : ''}>
                                                    <label class="form-check-label" for="female">Female</label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio" name="gender" 
                                                           id="other" value="Other" ${student.gender eq 'Other' ? 'checked' : ''}>
                                                    <label class="form-check-label" for="other">Other</label>
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <div class="col-md-6 mb-3">
                                            <label for="nic" class="form-label">NIC</label>
                                            <input type="text" class="form-control" id="nic" name="nic" 
                                                   value="${student.nic}" required>
                                        </div>
                                    </div>
                                    
                                    <div class="row mb-4">
                                        <div class="col-md-6 mb-3">
                                            <label for="email" class="form-label">Email</label>
                                            <input type="email" class="form-control" id="email" name="email" 
                                                   value="${student.email}" required>
                                        </div>
                                        
                                        <div class="col-md-6 mb-3">
                                            <label for="phone" class="form-label">Phone</label>
                                            <input type="text" class="form-control" id="phone" name="phone" 
                                                   value="${student.phone}" required>
                                        </div>
                                    </div>
                                    
                                    <div class="mb-4">
                                        <label for="address" class="form-label">Address</label>
                                        <textarea class="form-control" id="address" name="address" rows="3" required>${student.address}</textarea>
                                    </div>
                                    
                                    <div class="row mb-4">
                                        <div class="col-md-6 mb-3">
                                            <label for="facultyID" class="form-label">Faculty</label>
                                            <input type="text" class="form-control" id="facultyID" name="facultyID" 
                                                   value="${student.facultyID}" required>
                                        </div>
                                        
                                        <div class="col-md-6 mb-3">
                                            <label for="departmentID" class="form-label">Department ID</label>
                                            <input type="number" class="form-control" id="departmentID" name="departmentID" 
                                                   value="${student.departmentID}" required>
                                        </div>
                                        
                                           <div class="col-md-6 mb-3">
                                            <label for="courseID" class="form-label">Course ID</label>
                                            <input type="number" class="form-control" id="courseID" name="courseID" 
                                                   value="${student.courseID}" required>
                                        </div>
                                        
                                        
                                    </div>
                                        <div class="col-md-6 mb-3">
    <label for="enrollmentDate" class="form-label">Enrollment Date</label>
    <input type="date" class="form-control" id="enrollmentDate" name="enrollmentDate" 
           value="<fmt:formatDate value='${student.enrollmentDate}' pattern='yyyy-MM-dd'/>" required>
</div>
                                    
                                    <div class="d-flex mt-4">
                                        <a href="StudentListServlet" class="btn btn-secondary me-2">
                                            <i class="fas fa-times me-1"></i> Cancel
                                        </a>
                                        <button type="submit" class="btn btn-primary">
                                            <i class="fas fa-save me-1"></i> Update Student
                                        </button>
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
                </div>
            </div>
        </footer>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Form validation
        (function() {
            'use strict';
            var forms = document.querySelectorAll('.needs-validation');
            Array.prototype.slice.call(forms).forEach(function(form) {
                form.addEventListener('submit', function(event) {
                    if (!form.checkValidity()) {
                        event.preventDefault();
                        event.stopPropagation();
                    }
                    form.classList.add('was-validated');
                }, false);
            });
        })();
    </script>
</body>
</html>