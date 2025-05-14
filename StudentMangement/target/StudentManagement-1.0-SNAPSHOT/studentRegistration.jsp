<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Registration - NSBM Green University</title>
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
            background-color: #f0f2f5;
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
        
        .student-badge {
            background-color: #2196F3;
            color: white;
            font-size: 0.7rem;
            padding: 0.25rem 0.5rem;
            border-radius: 30px;
            margin-left: 0.5rem;
            font-weight: 500;
        }
        
        .content-wrapper {
            padding: 2rem 0;
            position: relative;
            z-index: 10;
        }
        
        .registration-container {
            background-color: rgba(255, 255, 255, 0.98);
            border-radius: 16px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.15);
            padding: 2rem;
            position: relative;
            overflow: hidden;
            backdrop-filter: blur(10px);
            margin-bottom: 2rem;
            max-width: 700px;
            margin: 0 auto;
        }
        
        .section-header {
            position: relative;
            margin-bottom: 1.5rem;
            padding-bottom: 1rem;
            border-bottom: 1px solid #dee2e6;
        }
        
        .section-header:after {
            content: '';
            position: absolute;
            bottom: -1px;
            left: 0;
            width: 50px;
            height: 3px;
            background: linear-gradient(90deg, var(--primary-color), var(--secondary-color));
        }
        
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
        
        .form-control:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 0.25rem rgba(0, 146, 69, 0.25);
        }
        
        .form-floating > label {
            color: #6c757d;
        }
        
        .input-icon {
            position: absolute;
            right: 15px;
            top: 17px;
            color: var(--primary-color);
        }
        
        @media (max-width: 768px) {
            .university-name {
                font-size: 1rem;
            }
            
            .content-wrapper {
                padding: 1rem 0;
            }
            
            .registration-container {
                padding: 1.5rem;
            }
        }
    </style>
</head>
<body>
    <!-- Header -->
    <header class="py-3">
        <div class="container d-flex justify-content-between align-items-center">
            <a href="index.jsp" class="d-flex align-items-center text-decoration-none">
                <img src="images/nsbm-logo.png" alt="NSBM Logo" height="45" onerror="this.src='https://via.placeholder.com/45x45?text=NSBM'">
                <div class="ms-3">
                    <span class="d-block university-name">NSBM GREEN UNIVERSITY</span>
                    <div class="d-flex align-items-center mt-1">
                        <small class="text-muted">Student Management System</small>
                        <span class="student-badge ms-2">REGISTRATION</span>
                    </div>
                </div>
            </a>
            <div>
                <a href="studentLogin.jsp" class="btn btn-outline-success">Login</a>
            </div>
        </div>
    </header>

    <!-- Main Content -->
    <div class="content-wrapper">
        <div class="container">
            <div class="registration-container">
                <div class="section-header">
                    <h4 class="mb-0"><i class="fas fa-user-plus me-2"></i> Student Registration</h4>
                </div>
                
                <form action="StudentRegistrationServlet" method="POST" class="needs-validation" novalidate>
                    <!-- Personal Information Section -->
                    <div class="mb-4">
                        <h5 class="text-success mb-3"><i class="fas fa-user me-2"></i>Personal Information</h5>
                        
                        <!-- Name Field -->
                        <div class="form-floating mb-3 position-relative">
                            <input type="text" class="form-control" id="name" name="Name" placeholder="Full Name" required>
                            <label for="name">Full Name</label>
                            <i class="fas fa-user input-icon"></i>
                            <div class="invalid-feedback">
                                Please enter your full name.
                            </div>
                        </div>
                        
                        <!-- Date of Birth Field -->
                        <div class="form-floating mb-3 position-relative">
                            <input type="date" class="form-control" id="dob" name="DateOfBirth" required>
                            <label for="dob">Date of Birth</label>
                            <i class="fas fa-calendar-alt input-icon"></i>
                            <div class="invalid-feedback">
                                Please enter your date of birth.
                            </div>
                        </div>
                        
                        <!-- Gender Field -->
                        <div class="mb-3">
                            <label class="form-label">Gender</label>
                            <div class="d-flex">
                                <div class="form-check me-3">
                                    <input class="form-check-input" type="radio" name="Gender" id="male" value="Male" required>
                                    <label class="form-check-label" for="male">Male</label>
                                </div>
                                <div class="form-check me-3">
                                    <input class="form-check-input" type="radio" name="Gender" id="female" value="Female">
                                    <label class="form-check-label" for="female">Female</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="Gender" id="other" value="Other">
                                    <label class="form-check-label" for="other">Other</label>
                                </div>
                            </div>
                            <div class="invalid-feedback">
                                Please select your gender.
                            </div>
                        </div>
                        
                        <!-- NIC Field -->
                        <div class="form-floating mb-3 position-relative">
                            <input type="text" class="form-control" id="nic" name="NIC" placeholder="NIC Number" required>
                            <label for="nic">NIC Number</label>
                            <i class="fas fa-id-card input-icon"></i>
                            <div class="invalid-feedback">
                                Please enter your NIC number.
                            </div>
                        </div>
                    </div>
                    
                    <!-- Contact Information Section -->
                    <div class="mb-4">
                        <h5 class="text-success mb-3"><i class="fas fa-address-book me-2"></i>Contact Information</h5>
                        
                        <!-- Email Field -->
                        <div class="form-floating mb-3 position-relative">
                            <input type="email" class="form-control" id="email" name="Email" placeholder="name@example.com" required>
                            <label for="email">Email address</label>
                            <i class="fas fa-envelope input-icon"></i>
                            <div class="invalid-feedback">
                                Please enter a valid email address.
                            </div>
                        </div>
                        
                        <!-- Phone Field -->
                        <div class="form-floating mb-3 position-relative">
                            <input type="tel" class="form-control" id="phone" name="Phone" placeholder="Phone Number">
                            <label for="phone">Phone Number</label>
                            <i class="fas fa-phone-alt input-icon"></i>
                            <div class="invalid-feedback">
                                Please enter a valid phone number.
                            </div>
                        </div>
                        
                        <!-- Address Field -->
                        <div class="form-floating mb-3 position-relative">
                            <textarea class="form-control" id="address" name="Address" placeholder="Address" style="height: 100px"></textarea>
                            <label for="address">Address</label>
                            <i class="fas fa-home input-icon"></i>
                        </div>
                    </div>
                    
                    <!-- Academic Information Section -->
                    <div class="mb-4">
                        <h5 class="text-success mb-3"><i class="fas fa-graduation-cap me-2"></i>Academic Information</h5>
                        
                        <!-- Enrollment Date Field -->
                        <div class="form-floating mb-3 position-relative">
                            <input type="date" class="form-control" id="enrollmentDate" name="EnrollmentDate" required>
                            <label for="enrollmentDate">Enrollment Date</label>
                            <i class="fas fa-calendar-check input-icon"></i>
                            <div class="invalid-feedback">
                                Please enter your enrollment date.
                            </div>
                        </div>
                        
                        <!-- Faculty Field -->
                        <div class="form-floating mb-3 position-relative">
                            <select class="form-select" id="faculty" name="FacultyID" required>
                                <option value="" selected disabled>Select your faculty</option>
                                <option value="1">Faculty of Business</option>
                                <option value="2">Faculty of Computing</option>
                                <option value="3">Faculty of Engineering</option>
                                <option value="4">Faculty of Science</option>
                                <option value="5">Faculty of Humanities & Social Sciences</option>
                            </select>
                            <label for="faculty">Faculty</label>
                            <i class="fas fa-university input-icon"></i>
                            <div class="invalid-feedback">
                                Please select your faculty.
                            </div>
                        </div>
                        
                        <!-- Department Field -->
                        <div class="form-floating mb-3 position-relative">
                            <select class="form-select" id="department" name="DepartmentID" required>
                                <option value="" selected disabled>Select your department</option>
                                <!-- Departments will be populated dynamically based on faculty selection -->
                            </select>
                            <label for="department">Department</label>
                            <i class="fas fa-building input-icon"></i>
                            <div class="invalid-feedback">
                                Please select your department.
                            </div>
                        </div>
                        
                        <!-- Course Field -->
                        <div class="form-floating mb-3 position-relative">
                            <select class="form-select" id="course" name="CourseID" required>
                                <option value="" selected disabled>Select your course</option>
                                <!-- Courses will be populated dynamically based on department selection -->
                            </select>
                            <label for="course">Course</label>
                            <i class="fas fa-book input-icon"></i>
                            <div class="invalid-feedback">
                                Please select your course.
                            </div>
                        </div>
                    </div>
                    
                    <!-- Account Information Section -->
                    <div class="mb-4">
                        <h5 class="text-success mb-3"><i class="fas fa-lock me-2"></i>Account Information</h5>
                        
                        <!-- Password Field -->
                        <div class="form-floating mb-3 position-relative">
                            <input type="password" class="form-control" id="password" name="Password" placeholder="Password" required minlength="8">
                            <label for="password">Password</label>
                            <i class="fas fa-lock input-icon toggle-password"></i>
                            <div class="invalid-feedback">
                                Password must be at least 8 characters long.
                            </div>
                        </div>
                        
                        <!-- Confirm Password Field -->
                        <div class="form-floating mb-4 position-relative">
                            <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" placeholder="Confirm Password" required minlength="8">
                            <label for="confirmPassword">Confirm Password</label>
                            <i class="fas fa-lock input-icon toggle-password"></i>
                            <div class="invalid-feedback">
                                Passwords do not match.
                            </div>
                        </div>
                    </div>
                    
                    <div class="d-grid">
                        <button type="submit" class="btn btn-primary py-3">
                            <i class="fas fa-user-plus me-2"></i> Register
                        </button>
                    </div>
                    
                    <p class="text-center mt-4 mb-0">
                        Already have an account? <a href="studentLogin.jsp" class="text-decoration-none text-success fw-bold">Login here</a>
                    </p>
                </form>
            </div>
        </div>
    </div>
    
    <!-- Footer -->
    <footer class="text-white mt-5">
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
        // Form validation
        (function () {
            'use strict'
            
            // Fetch all forms that need validation
            var forms = document.querySelectorAll('.needs-validation')
            
            // Loop over them and prevent submission
            Array.prototype.slice.call(forms)
                .forEach(function (form) {
                    form.addEventListener('submit', function (event) {
                        if (!form.checkValidity()) {
                            event.preventDefault()
                            event.stopPropagation()
                        }
                        
                        // Password matching validation
                        const password = document.getElementById('password');
                        const confirmPassword = document.getElementById('confirmPassword');
                        
                        if (password.value !== confirmPassword.value) {
                            confirmPassword.setCustomValidity('Passwords do not match');
                            event.preventDefault()
                            event.stopPropagation()
                        } else {
                            confirmPassword.setCustomValidity('');
                        }
                        
                        form.classList.add('was-validated')
                    }, false)
                })
        })()
        
        // Show/hide password functionality
        document.querySelectorAll('.toggle-password').forEach(function(icon) {
            icon.addEventListener('click', function() {
                const passwordField = this.previousElementSibling;
                const fieldType = passwordField.getAttribute('type');
                
                if (fieldType === 'password') {
                    passwordField.setAttribute('type', 'text');
                    this.classList.remove('fa-lock');
                    this.classList.add('fa-lock-open');
                } else {
                    passwordField.setAttribute('type', 'password');
                    this.classList.remove('fa-lock-open');
                    this.classList.add('fa-lock');
                }
            });
        });
        
        // Faculty and department mapping from database
        const facultyDepartments = {
            "1": [ // Faculty of Business
                { id: "2", name: "Business Management" },
                { id: "8", name: "Marketing" },
                { id: "9", name: "Finance" }
            ],
            "2": [ // Faculty of Computing
                { id: "1", name: "Computing & Information Systems" },
                { id: "6", name: "Data Science" },
                { id: "7", name: "Software Engineering" }
            ],
            "3": [ // Faculty of Engineering
                { id: "3", name: "Engineering" },
                { id: "10", name: "Civil Engineering" },
                { id: "11", name: "Electrical Engineering" }
            ],
            "4": [ // Faculty of Science
                { id: "4", name: "Science & Technology" },
                { id: "12", name: "Biotechnology" }
            ],
            "5": [ // Faculty of Humanities & Social Sciences
                { id: "5", name: "Design & Architecture" },
                { id: "13", name: "Languages" }
            ]
        };
        
        // Course mapping from database
        const departmentCourses = {
            "1": [ // Computing & Information Systems
                { id: "1", name: "BSc (Hons) in Computer Science" },
                { id: "2", name: "BSc (Hons) in Computer Science top up" },
                { id: "3", name: "Bachelor of Information Technology" }
            ],
            "2": [ // Business Management
                { id: "6", name: "Postgraduate Diploma in Project Management" },
                { id: "7", name: "Master of Business Studies (MBS)" },
                { id: "8", name: "Postgraduate Diploma In Human Resource Management" }
            ],
            "3": [ // Engineering
                { id: "11", name: "Bachelor of Science of Engineering Honours in Mechatronic Engineering" },
                { id: "12", name: "Bachelor of Science of Engineering" }
            ],
            "4": [ // Science & Technology
                { id: "15", name: "BSc in General Science" }
            ],
            "5": [ // Design & Architecture
                { id: "19", name: "Bachelor of Interior Design" },
                { id: "20", name: "BSc (Hons) Architecture" }
            ],
            "6": [ // Data Science
                { id: "4", name: "BSc in Data Science" }
            ],
            "7": [ // Software Engineering
                { id: "5", name: "BSc (Hons) in Software Engineering" }
            ],
            "8": [ // Marketing
                { id: "9", name: "Bachelor of Marketing" }
            ],
            "9": [ // Finance
                { id: "10", name: "Bachelor of Finance" }
            ],
            "10": [ // Civil Engineering
                { id: "13", name: "BSc in Civil Engineering" }
            ],
            "11": [ // Electrical Engineering
                { id: "14", name: "BSc in Electrical Engineering" }
            ],
            "12": [ // Biotechnology
                { id: "16", name: "BSc (Hons) in Biomedical Science" },
                { id: "17", name: "BSc (Honours) in Pharmaceutical Science" },
                { id: "18", name: "BSc (Hons) Nutrition and Health" }
            ],
            "13": [ // Languages
                { id: "21", name: "BA in English Language & Literature" },
                { id: "22", name: "BA in Linguistics" }
            ]
        };
        
        // Faculty selection will populate department options
        document.getElementById('faculty').addEventListener('change', function() {
            const facultyID = this.value;
            const departmentSelect = document.getElementById('department');
            const courseSelect = document.getElementById('course');
            
            // Clear current options
            departmentSelect.innerHTML = '<option value="" selected disabled>Select your department</option>';
            courseSelect.innerHTML = '<option value="" selected disabled>Select your course</option>';
            
            // Add relevant departments based on faculty selection
            if (facultyDepartments[facultyID]) {
                facultyDepartments[facultyID].forEach(dept => {
                    addOption(departmentSelect, dept.id, dept.name);
                });
            }
        });
        
        // Department selection will populate course options
        document.getElementById('department').addEventListener('change', function() {
            const departmentID = this.value;
            const courseSelect = document.getElementById('course');
            
            // Clear current options
            courseSelect.innerHTML = '<option value="" selected disabled>Select your course</option>';
            
            // Add relevant courses based on department selection
            if (departmentCourses[departmentID]) {
                departmentCourses[departmentID].forEach(course => {
                    addOption(courseSelect, course.id, course.name);
                });
            }
        });
        
        function addOption(selectElement, value, text) {
            const option = document.createElement('option');
            option.value = value;
            option.textContent = text;
            selectElement.appendChild(option);
        }
        
        // Set enrollment date to today's date only
        document.addEventListener('DOMContentLoaded', function () {
            const enrollmentDateField = document.getElementById('enrollmentDate');
            const today = new Date().toISOString().split('T')[0];
            
            // Set both min and max to today's date
            enrollmentDateField.setAttribute('min', today);
            enrollmentDateField.setAttribute('max', today);
            enrollmentDateField.value = today; // Set default value to today
        });
    </script>
</body>
</html>