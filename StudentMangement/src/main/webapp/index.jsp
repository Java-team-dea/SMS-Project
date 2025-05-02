<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NSBM Student Portal - Student Management System</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css">
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
        }
        
        .gradient-header {
            background: linear-gradient(135deg, var(--primary-color) 0%, var(--secondary-color) 100%);
        }
        
        .header-search {
            border-radius: 30px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        
        .header-search .btn {
            border-radius: 0 30px 30px 0;
            background-color: var(--primary-color);
            color: white;
            border: none;
        }
        
        .navbar-icon {
            width: 40px;
            height: 40px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 50%;
            color: var(--dark-color);
            transition: all 0.3s ease;
        }
        
        .navbar-icon:hover {
            background-color: var(--accent-color);
            color: var(--primary-color);
        }
        
        .hero-section {
            background: linear-gradient(rgba(232, 245, 233, 0.8), rgba(232, 245, 233, 0.9)), url('images/pattern-bg.png');
            background-size: cover;
            padding: 80px 0;
            position: relative;
            overflow: hidden;
        }
        
        .hero-section::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: url('images/dots.svg');
            opacity: 0.4;
        }
        
        .hero-image {
            border-radius: 10px;
            box-shadow: 0 15px 30px rgba(0,0,0,0.1);
            transition: transform 0.5s ease;
            overflow: hidden;
        }
        
        .hero-image:hover {
            transform: translateY(-10px);
        }
        
        .btn-primary-nsbm {
            background-color: var(--primary-color);
            border-color: var(--primary-color);
            border-radius: 30px;
            padding: 0.5rem 1.5rem;
            font-weight: 600;
            transition: all 0.3s ease;
            box-shadow: 0 4px 6px rgba(0, 146, 69, 0.2);
        }
        
        .btn-primary-nsbm:hover {
            background-color: var(--secondary-color);
            border-color: var(--secondary-color);
            transform: translateY(-2px);
            box-shadow: 0 6px 8px rgba(0, 146, 69, 0.25);
        }
        
        .btn-dark-nsbm {
            background-color: var(--dark-color);
            border-color: var(--dark-color);
            border-radius: 30px;
            padding: 0.5rem 1.5rem;
            font-weight: 600;
            transition: all 0.3s ease;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        
        .btn-dark-nsbm:hover {
            background-color: #343a40;
            border-color: #343a40;
            transform: translateY(-2px);
            box-shadow: 0 6px 8px rgba(0, 0, 0, 0.15);
        }
        
        .section-title {
            position: relative;
            padding-bottom: 15px;
            margin-bottom: 30px;
        }
        
        .section-title::after {
            content: '';
            position: absolute;
            left: 0;
            bottom: 0;
            height: 3px;
            width: 40px;
            background-color: var(--primary-color);
        }
        
        .quick-access-card {
            border-radius: 10px;
            transition: all 0.3s ease;
            border: 1px solid rgba(0,0,0,0.05);
        }
        
        .quick-access-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.08);
            border-bottom: 3px solid var(--primary-color);
        }
        
        .icon-container {
            width: 60px;
            height: 60px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto;
            background-color: var(--accent-color);
            color: var(--primary-color);
            transition: all 0.3s ease;
        }
        
        .quick-access-card:hover .icon-container {
            background-color: var(--primary-color);
            color: white;
        }
        
        .news-card {
            border-radius: 10px;
            overflow: hidden;
            transition: all 0.3s ease;
            height: 100%;
        }
        
        .news-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 30px rgba(0,0,0,0.1);
        }
        
        .news-card img {
            height: 200px;
            object-fit: cover;
            transition: all 0.5s ease;
        }
        
        .news-card:hover img {
            transform: scale(1.05);
        }
        
        .news-card .card-body {
            position: relative;
        }
        
        .news-card .date-badge {
            position: absolute;
            top: -20px;
            right: 20px;
            background-color: var(--primary-color);
            color: white;
            padding: 5px 15px;
            border-radius: 20px;
            font-size: 0.8rem;
            font-weight: 600;
        }
        
        .quick-link-item {
            padding: 15px;
            border-radius: 10px;
            transition: all 0.3s ease;
            background-color: white;
            box-shadow: 0 3px 10px rgba(0,0,0,0.05);
        }
        
        .quick-link-item:hover {
            background-color: var(--primary-color);
        }
        
        .quick-link-item:hover .icon-container {
            background-color: white;
        }
        
        .quick-link-item:hover small {
            color: white !important;
        }
        
        .announcement-ticker {
            background-color: var(--accent-color);
            padding: 10px 0;
            overflow: hidden;
            position: relative;
        }
        
        .announcement-content {
            display: flex;
            align-items: center;
        }
        
        .announcement-badge {
            background-color: var(--primary-color);
            color: white;
            padding: 2px 10px;
            border-radius: 4px;
            margin-right: 15px;
            font-weight: 600;
            font-size: 0.8rem;
        }
        
        .features-section {
            background-color: white;
            padding: 60px 0;
        }
        
        .feature-card {
            text-align: center;
            padding: 30px 20px;
            border-radius: 10px;
            background-color: white;
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
            transition: all 0.3s ease;
        }
        
        .feature-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 30px rgba(0,0,0,0.1);
        }
        
        .feature-icon {
            width: 70px;
            height: 70px;
            border-radius: 50%;
            background-color: var(--accent-color);
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 20px;
            color: var(--primary-color);
            font-size: 1.5rem;
            transition: all 0.3s ease;
        }
        
        .feature-card:hover .feature-icon {
            background-color: var(--primary-color);
            color: white;
        }
        
        .stats-section {
            background: linear-gradient(135deg, var(--primary-color) 0%, var(--secondary-color) 100%);
            padding: 60px 0;
            color: white;
        }
        
        .stat-item {
            text-align: center;
        }
        
        .stat-icon {
            font-size: 2rem;
            margin-bottom: 15px;
        }
        
        .stat-count {
            font-size: 2.5rem;
            font-weight: 700;
            margin-bottom: 5px;
        }
        
        .stat-text {
            font-size: 1rem;
            opacity: 0.8;
        }
        
        .testimonial-section {
            padding: 60px 0;
            background-color: #f9fafb;
        }
        
        .testimonial-card {
            background-color: white;
            border-radius: 10px;
            padding: 30px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
            margin: 15px;
            position: relative;
        }
        
        .testimonial-card::before {
            content: '\201C';
            font-size: 5rem;
            color: var(--accent-color);
            position: absolute;
            top: 10px;
            left: 20px;
            font-family: Georgia, serif;
            opacity: 0.3;
        }
        
        .testimonial-img {
            width: 60px;
            height: 60px;
            border-radius: 50%;
            object-fit: cover;
            margin-right: 15px;
        }
        
        .testimonial-author {
            display: flex;
            align-items: center;
            margin-top: 20px;
        }
        
        .owl-nav button {
            width: 40px;
            height: 40px;
            border-radius: 50% !important;
            background-color: var(--primary-color) !important;
            color: white !important;
            margin: 0 5px;
        }
        
        .owl-dots button span {
            background-color: var(--accent-color) !important;
        }
        
        .owl-dots button.active span {
            background-color: var(--primary-color) !important;
        }
        
        .news-carousel .owl-stage {
            display: flex;
        }
        
        .news-carousel .owl-item {
            display: flex;
            flex: 1 0 auto;
        }
        
        .news-carousel .news-card {
            width: 100%;
        }
        
        footer {
            background-color: var(--dark-color);
        }
        
        footer .list-unstyled li {
            margin-bottom: 10px;
        }
        
        footer .social-icon {
            width: 35px;
            height: 35px;
            border-radius: 50%;
            background-color: rgba(255,255,255,0.1);
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 10px;
            transition: all 0.3s ease;
        }
        
        footer .social-icon:hover {
            background-color: var(--primary-color);
            transform: translateY(-3px);
        }
        
        .floating-btn {
            position: fixed;
            bottom: 20px;
            right: 20px;
            width: 50px;
            height: 50px;
            border-radius: 50%;
            background-color: var(--primary-color);
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
            cursor: pointer;
            z-index: 999;
            transition: all 0.3s ease;
        }
        
        .floating-btn:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 20px rgba(0,0,0,0.25);
        }
        
        @keyframes float {
            0% {
                transform: translateY(0px);
            }
            50% {
                transform: translateY(-10px);
            }
            100% {
                transform: translateY(0px);
            }
        }
        
        .float-animation {
            animation: float 5s ease-in-out infinite;
        }
        
        @media (max-width: 768px) {
            .hero-section {
                padding: 40px 0;
            }
            
            .hero-content {
                text-align: center;
                margin-bottom: 30px;
            }
            
            .stats-section .row > div {
                margin-bottom: 30px;
            }
        }
    </style>
</head>
<body>
    <!-- Header -->
    <header class="gradient-header py-3">
        <div class="container d-flex justify-content-between align-items-center">
            <a href="index.jsp" class="d-flex align-items-center text-decoration-none">
                <img src="images/nsbm-logo.png" alt="NSBM Logo" height="40">
                <span class="ms-2 fw-bold text-white">NSBM GREEN UNIVERSITY</span>
            </a>
            <div class="d-flex align-items-center">
                <div class="input-group me-3 header-search" style="width: 250px;">
                    <input type="text" class="form-control border-0" placeholder="Search...">
                    <button class="btn" type="button">
                        <i class="fas fa-search"></i>
                    </button>
                </div>
                <a href="#" class="navbar-icon me-2 text-white"><i class="fas fa-bell"></i></a>
                <a href="#" class="navbar-icon text-white"><i class="fas fa-question-circle"></i></a>
            </div>
        </div>
    </header>

    <!-- Announcement Ticker -->
    <div class="announcement-ticker">
        <div class="container">
            <div class="announcement-content">
                <span class="announcement-badge">ANNOUNCEMENT</span>
                <marquee behavior="scroll" direction="left" onmouseover="this.stop();" onmouseout="this.start();">
                    <span class="fw-bold">New Curriculum Announcement:</span> Updated course structure for Computing and Business faculties effective from next semester. &nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
                    <span class="fw-bold">Exam Results:</span> Final semester results are now available on the student portal. &nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
                    <span class="fw-bold">Research Symposium:</span> Registration closes on May 5th for the Annual Research Symposium.
                </marquee>
            </div>
        </div>
    </div>

    <!-- Hero Section -->
    <section class="hero-section">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 hero-content animate__animated animate__fadeInLeft">
                    <h1 class="display-4 fw-bold mb-3 text-dark">Student Portal</h1>
                    <p class="lead mb-4">Your complete academic management system designed to enhance your learning experience at NSBM Green University.</p>
                    <div class="d-grid gap-3 d-md-flex">
                        <a href="studentLogin.jsp" class="btn btn-primary-nsbm px-4 py-2 fw-bold">Student Login</a>
                        <a href="adminLogin.jsp" class="btn btn-primary-nsbm px-4 py-2 fw-bold">Admin Login</a>
                    </div>
                </div>
                <div class="col-lg-6 animate__animated animate__fadeInRight">
                    <div class="hero-image float-animation">
                        <img src="images/campus.jpg" alt="NSBM Campus" class="img-fluid rounded">
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Features Section -->
    <section class="features-section">
        <div class="container">
            <h2 class="section-title text-center mb-5">What Makes NSBM Special</h2>
            <div class="row g-4">
                <div class="col-md-4 animate__animated animate__fadeInUp" data-wow-delay="0.1s">
                    <div class="feature-card">
                        <div class="feature-icon">
                            <i class="fas fa-leaf"></i>
                        </div>
                        <h4 class="mb-3">Green Environment</h4>
                        <p class="text-muted">Study in Sri Lanka's first green university with sustainable architecture and eco-friendly practices.</p>
                    </div>
                </div>
                <div class="col-md-4 animate__animated animate__fadeInUp" data-wow-delay="0.3s">
                    <div class="feature-card">
                        <div class="feature-icon">
                            <i class="fas fa-laptop-code"></i>
                        </div>
                        <h4 class="mb-3">Industry-Ready Education</h4>
                        <p class="text-muted">Curriculum designed in collaboration with industry leaders, ensuring your readiness for the global market.</p>
                    </div>
                </div>
                <div class="col-md-4 animate__animated animate__fadeInUp" data-wow-delay="0.5s">
                    <div class="feature-card">
                        <div class="feature-icon">
                            <i class="fas fa-globe"></i>
                        </div>
                        <h4 class="mb-3">International Partnerships</h4>
                        <p class="text-muted">Access to international degrees and exchange programs with prestigious universities worldwide.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Quick Access Section -->
    <section class="container my-5 pt-5">
        <h2 class="section-title">Quick Access</h2>
        <div class="row g-4 animate__animated animate__fadeInUp">
            <div class="col-md-3 col-6">
                <a href="#" class="text-decoration-none">
                    <div class="quick-access-card p-3 bg-white rounded text-center h-100">
                        <div class="icon-container mb-3">
                            <i class="fas fa-user-graduate fa-2x"></i>
                        </div>
                        <h6 class="text-dark">Academic Progress</h6>
                    </div>
                </a>
            </div>
            <div class="col-md-3 col-6">
                <a href="#" class="text-decoration-none">
                    <div class="quick-access-card p-3 bg-white rounded text-center h-100">
                        <div class="icon-container mb-3">
                            <i class="fas fa-id-card fa-2x"></i>
                        </div>
                        <h6 class="text-dark">Course Registration</h6>
                    </div>
                </a>
            </div>
            <div class="col-md-3 col-6">
                <a href="#" class="text-decoration-none">
                    <div class="quick-access-card p-3 bg-white rounded text-center h-100">
                        <div class="icon-container mb-3">
                            <i class="fas fa-calendar-alt fa-2x"></i>
                        </div>
                        <h6 class="text-dark">Exam Schedule</h6>
                    </div>
                </a>
            </div>
            <div class="col-md-3 col-6">
                <a href="#" class="text-decoration-none">
                    <div class="quick-access-card p-3 bg-white rounded text-center h-100">
                        <div class="icon-container mb-3">
                            <i class="fas fa-tasks fa-2x"></i>
                        </div>
                        <h6 class="text-dark">Assignment Submission</h6>
                    </div>
                </a>
            </div>
        </div>
    </section>

    <!-- Stats Section -->
    <section class="stats-section">
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-6">
                    <div class="stat-item animate__animated animate__fadeIn">
                        <div class="stat-icon">
                            <i class="fas fa-users"></i>
                        </div>
                        <div class="stat-count" data-count="9000">9,000+</div>
                        <div class="stat-text">Students</div>
                    </div>
                </div>
                <div class="col-md-3 col-6">
                    <div class="stat-item animate__animated animate__fadeIn" data-wow-delay="0.2s">
                        <div class="stat-icon">
                            <i class="fas fa-chalkboard-teacher"></i>
                        </div>
                        <div class="stat-count" data-count="250">250+</div>
                        <div class="stat-text">Academic Staff</div>
                    </div>
                </div>
                <div class="col-md-3 col-6">
                    <div class="stat-item animate__animated animate__fadeIn" data-wow-delay="0.4s">
                        <div class="stat-icon">
                            <i class="fas fa-book-open"></i>
                        </div>
                        <div class="stat-count" data-count="50">50+</div>
                        <div class="stat-text">Degree Programs</div>
                    </div>
                </div>
                <div class="col-md-3 col-6">
                    <div class="stat-item animate__animated animate__fadeIn" data-wow-delay="0.6s">
                        <div class="stat-icon">
                            <i class="fas fa-industry"></i>
                        </div>
                        <div class="stat-count" data-count="100">100+</div>
                        <div class="stat-text">Industry Partners</div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Latest Updates Section -->
    <section class="container my-5 pt-5">
        <h2 class="section-title">Latest Updates</h2>
        <div class="owl-carousel news-carousel animate__animated animate__fadeInUp">
            <div class="news-card">
                <div class="position-relative overflow-hidden">
                    <img src="images/exam-hall.jpg" class="card-img-top" alt="Exam Hall">
                </div>
                <div class="card-body p-4">
                    <span class="date-badge">March 25, 2025</span>
                    <h5 class="card-title mt-3">Final Semester Registration Open</h5>
                    <p class="card-text">Registration for final semester courses is now open. Please complete registration before the deadline to avoid late fees.</p>
                    <a href="#" class="btn btn-sm btn-primary-nsbm">Read more</a>
                </div>
            </div>
            <div class="news-card">
                <div class="position-relative overflow-hidden">
                    <img src="images/graduation.jpg" class="card-img-top" alt="Graduation">
                </div>
                <div class="card-body p-4">
                    <span class="date-badge">March 18, 2025</span>
                    <h5 class="card-title mt-3">Graduation Ceremony 2025</h5>
                    <p class="card-text">The annual graduation ceremony will be held on May 15th. All graduating students must register for the event by April 30th.</p>
                    <a href="#" class="btn btn-sm btn-primary-nsbm">Read more</a>
                </div>
            </div>
            <div class="news-card">
                <div class="position-relative overflow-hidden">
                    <img src="images/workshop.jpg" class="card-img-top" alt="Workshop">
                </div>
                <div class="card-body p-4">
                    <span class="date-badge">March 10, 2025</span>
                    <h5 class="card-title mt-3">Career Training Event</h5>
                    <p class="card-text">Join us for a comprehensive career training workshop focusing on resume building and interview skills for new graduates.</p>
                    <a href="#" class="btn btn-sm btn-primary-nsbm">Read more</a>
                </div>
            </div>
            <div class="news-card">
                <div class="position-relative overflow-hidden">
                    <img src="images/tech-event.jpg" class="card-img-top" alt="Tech Event">
                </div>
                <div class="card-body p-4">
                    <span class="date-badge">March 5, 2025</span>
                    <h5 class="card-title mt-3">Annual Tech Fest Announced</h5>
                    <p class="card-text">The annual tech fest will be held from June 10-12. Registration for competitions and workshops opens on April 15.</p>
                    <a href="#" class="btn btn-sm btn-primary-nsbm">Read more</a>
                </div>
            </div>
        </div>
    </section>

   <!-- Testimonial Section -->
<section class="testimonial-section">
    <div class="container">
        <h2 class="section-title text-center">What Students Say</h2>
        <div class="owl-carousel testimonial-carousel animate__animated animate__fadeIn">
            <div class="testimonial-card">
                <p class="testimonial-text">"NSBM has provided me with not just education but an environment to grow professionally. The industry connections helped me secure a job even before graduation."</p>
                <div class="testimonial-author">
                    <img src="images/student1.jpg" class="testimonial-img" style="width: 60px; height: 60px; object-fit: cover; border-radius: 0;">
                    <div>
                        <h6 class="mb-0">Lasantha Wellalage</h6>
                        <small class="text-muted">BSc in Management Information Systems</small>
                    </div>
                </div>
            </div>
            <div class="testimonial-card">
                <p class="testimonial-text">"The green campus is incredible for studying. State-of-the-art facilities and dedicated lecturers have made my learning experience truly exceptional."</p>
                <div class="testimonial-author">
                    <img src="images/student2.jpg" class="testimonial-img" style="width: 60px; height: 60px; object-fit: cover; border-radius: 0;">
                    <div>
                        <h6 class="mb-0">M K S I Matharage</h6>
                        <small class="text-muted">BA in Business Communication</small>
                    </div>
                </div>
            </div>
            <div class="testimonial-card">
                <p class="testimonial-text">"As an international student, NSBM made me feel welcome from day one. The diverse student community and supportive staff create a perfect learning atmosphere."</p>
                <div class="testimonial-author">
                    <img src="images/student3.jpg" class="testimonial-img" style="width: 60px; height: 60px; object-fit: cover; border-radius: 0;">
                    <div>
                        <h6 class="mb-0">Eranga Arumapperuma</h6>
                        <small class="text-muted">BSc in Computer Networks</small>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

    <!-- Quick Links -->
    <section class="container my-5">
        <h2 class="section-title">Quick Links</h2>
        <div class="row g-4 text-center animate__animated animate__fadeInUp">
            <div class="col-md-2 col-4">
                <a href="#" class="text-decoration-none">
                    <div class="quick-link-item">
                        <div class="icon-container mb-2">
                            <i class="fas fa-book"></i>
                        </div>
                        <small class="text-dark d-block">Learning Materials</small>
                    </div>
                </a>
            </div>
            <div class="col-md-2 col-4">
                <a href="#" class="text-decoration-none">
                    <div class="quick-link-item">
                        <div class="icon-container mb-2">
                            <i class="fas fa-calendar-alt"></i>
                        </div>
                        <small class="text-dark d-block">Calendar</small>
                    </div>
                </a>
            </div>
            <div class="col-md-2 col-4">
                <a href="#" class="text-decoration-none">
                    <div class="quick-link-item">
                        <div class="icon-container mb-2">
                            <i class="fas fa-money-bill-wave"></i>
                        </div>
                        <small class="text-dark d-block">Payments</small>
                    </div>
                </a>
            </div>
            <div class="col-md-2 col-4">
                <a href="#" class="text-decoration-none">
                    <div class="quick-link-item">
                        <div class="icon-container mb-2">
                            <i class="fas fa-clock"></i>
                        </div>
                        <small class="text-dark d-block">Attendance</small>
                    </div>
                </a>
            </div>
            <div class="col-md-2 col-4">
                <a href="#" class="text-decoration-none">
                    <div class="quick-link-item">
                        <div class="icon-container mb-2">
                            <i class="fas fa-building"></i>
                        </div>
                        <small class="text-dark d-block">Hostel</small>
                    </div>
                </a>
            </div>
            <div class="col-md-2 col-4">
                <a href="#" class="text-decoration-none">
                    <div class="quick-link-item">
                        <div class="icon-container mb-2">
                            <i class="fas fa-headset"></i>
                        </div>
                        <small class="text-dark d-block">Support</small>
                    </div>
                </a>
            </div>
        </div>
    </section>

    <!-- Upcoming Events Section -->
    <section class="container my-5 pt-3">
        <h2 class="section-title">Upcoming Events</h2>
        <div class="row g-4 animate__animated animate__fadeInUp">
            <div class="col-md-6">
                <div class="card border-0 shadow-sm overflow-hidden h-100">
                    <div class="row g-0 h-100">
                        <div class="col-md-4 bg-primary text-center text-white d-flex flex-column justify-content-center align-items-center p-3" style="background-color: var(--primary-color);">
                            <h2 class="display-4 fw-bold mb-0">15</h2>
                            <p class="mb-0">MAY</p>
                            <p class="small mb-0">2025</p>
                        </div>
                        <div class="col-md-8">
                            <div class="card-body">
                                <h5 class="card-title">Annual Graduation Ceremony</h5>
                                <p class="card-text text-muted"><i class="fas fa-map-marker-alt me-2"></i>Main Auditorium</p>
                                <p class="card-text text-muted"><i class="fas fa-clock me-2"></i>9:00 AM - 1:00 PM</p>
                                <a href="#" class="btn btn-sm btn-outline-success">Add to Calendar</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="card border-0 shadow-sm overflow-hidden h-100">
                    <div class="row g-0 h-100">
                        <div class="col-md-4 bg-dark text-center text-white d-flex flex-column justify-content-center align-items-center p-3">
                            <h2 class="display-4 fw-bold mb-0">22</h2>
                            <p class="mb-0">MAY</p>
                            <p class="small mb-0">2025</p>
                        </div>
                        <div class="col-md-8">
                            <div class="card-body">
                                <h5 class="card-title">Industry Career Fair</h5>
                                <p class="card-text text-muted"><i class="fas fa-map-marker-alt me-2"></i>Computing Faculty Building</p>
                                <p class="card-text text-muted"><i class="fas fa-clock me-2"></i>10:00 AM - 4:00 PM</p>
                                <a href="#" class="btn btn-sm btn-outline-success">Add to Calendar</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Resources Section -->
    <section class="container my-5 pt-3">
        <h2 class="section-title">Student Resources</h2>
        <div class="row g-4 align-items-stretch animate__animated animate__fadeInUp">
            <div class="col-md-4">
                <div class="card border-0 bg-light h-100 shadow-sm">
                    <div class="card-body p-4">
                        <div class="d-flex align-items-center mb-3">
                            <div class="icon-container me-3">
                                <i class="fas fa-book-reader"></i>
                            </div>
                            <h5 class="card-title mb-0">E-Library Access</h5>
                        </div>
                        <p class="card-text">Access the university's extensive collection of e-books, journals, and research papers through our digital library platform.</p>
                        <a href="#" class="btn btn-sm btn-primary-nsbm">Access Library</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card border-0 bg-light h-100 shadow-sm">
                    <div class="card-body p-4">
                        <div class="d-flex align-items-center mb-3">
                            <div class="icon-container me-3">
                                <i class="fas fa-laptop-code"></i>
                            </div>
                            <h5 class="card-title mb-0">Virtual Labs</h5>
                        </div>
                        <p class="card-text">Practice your skills with our state-of-the-art virtual laboratory environments for computing, engineering, and science students.</p>
                        <a href="#" class="btn btn-sm btn-primary-nsbm">Enter Virtual Labs</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card border-0 bg-light h-100 shadow-sm">
                    <div class="card-body p-4">
                        <div class="d-flex align-items-center mb-3">
                            <div class="icon-container me-3">
                                <i class="fas fa-video"></i>
                            </div>
                            <h5 class="card-title mb-0">Lecture Recordings</h5>
                        </div>
                        <p class="card-text">Review past lectures and catch up on missed classes with our comprehensive lecture recording archive.</p>
                        <a href="#" class="btn btn-sm btn-primary-nsbm">View Recordings</a>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- App Promotion Section -->
    <section class="container-fluid py-5 my-5" style="background-color: var(--accent-color);">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-md-6 animate__animated animate__fadeInLeft">
                    <h2 class="fw-bold mb-4">Stay Connected On The Go</h2>
                    <p class="lead mb-4">Download the NSBM Student Portal mobile app to access all your academic information, attend virtual classes, submit assignments, and receive important notifications directly on your smartphone.</p>
                    <div class="d-flex">
                        <a href="#" class="me-3">
                            <img src="images/play n app.png" alt="App Store" height="40">
                        </a>
                       
                    </div>
                </div>
                <div class="row">
    <!-- First Image Column -->
    <div class="col-md-6 text-center animate__animated animate__fadeInRight">
        <img src="images/play-store.png" alt="NSBM Mobile App" class="img-fluid float-animation" style="max-height: 400px;">
    </div>
    <!-- Second Image Column -->
    <div class="col-md-6 text-center animate__animated animate__fadeInLeft">
        <img src="images/app-store.png" alt="Second Image" class="img-fluid float-animation" style="max-height: 400px;">
    </div>
</div>

            </div>
        </div>
    </section>

    <!-- Newsletter Section -->
    <section class="container my-5">
        <div class="card border-0 shadow-sm rounded-3 overflow-hidden">
            <div class="row g-0">
                <div class="col-md-5" style="background: linear-gradient(rgba(0,0,0,0.5), rgba(0,0,0,0.5)), url('images/newsletter-bg.jpg'); background-size: cover; background-position: center;">
                </div>
                <div class="col-md-7">
                    <div class="card-body p-5">
                        <h3 class="card-title fw-bold mb-3">Subscribe to Our Newsletter</h3>
                        <p class="card-text mb-4">Stay updated with the latest news, events, and opportunities at NSBM Green University.</p>
                        <form class="row g-3">
                            <div class="col-md-8">
                                <input type="email" class="form-control" placeholder="Your Email Address">
                            </div>
                            <div class="col-md-4">
                                <button type="submit" class="btn btn-primary-nsbm w-100">Subscribe</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer class="py-5 mt-5">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-6 mb-4 mb-md-0">
                    <h6 class="text-uppercase fw-bold mb-4 text-white">About NSBM</h6>
                    <p class="text-white-50 small">NSBM Green University is the first green university in South Asia and sets an example for sustainable education. We are committed to producing skilled graduates ready for the global industry.</p>
                    <div class="d-flex mt-3">
                        <a href="#" class="social-icon"><i class="fab fa-facebook-f"></i></a>
                        <a href="#" class="social-icon"><i class="fab fa-twitter"></i></a>
                        <a href="#" class="social-icon"><i class="fab fa-instagram"></i></a>
                        <a href="#" class="social-icon"><i class="fab fa-linkedin-in"></i></a>
                        <a href="#" class="social-icon"><i class="fab fa-youtube"></i></a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 mb-4 mb-md-0">
                    <h6 class="text-uppercase fw-bold mb-4 text-white">Contact Us</h6>
                    <ul class="list-unstyled text-white-50 small">
                        <li class="mb-2"><i class="fas fa-map-marker-alt me-2"></i> NSBM Green University, Pitipana, Homagama, Sri Lanka</li>
                        <li class="mb-2"><i class="fas fa-phone me-2"></i> +94 11 222 3456</li>
                        <li class="mb-2"><i class="fas fa-envelope me-2"></i> info@nsbm.edu.lk</li>
                        <li class="mb-2"><i class="fas fa-clock me-2"></i> Mon - Fri: 8:30 AM - 5:00 PM</li>
                    </ul>
                </div>
                <div class="col-lg-3 col-md-6 mb-4 mb-md-0">
                    <h6 class="text-uppercase fw-bold mb-4 text-white">Quick Links</h6>
                    <ul class="list-unstyled">
                        <li><a href="#" class="text-white-50 text-decoration-none hover-success small">Student Portal</a></li>
                        <li><a href="#" class="text-white-50 text-decoration-none hover-success small">Library Services</a></li>
                        <li><a href="#" class="text-white-50 text-decoration-none hover-success small">Academic Calendar</a></li>
                        <li><a href="#" class="text-white-50 text-decoration-none hover-success small">Career Services</a></li>
                        <li><a href="#" class="text-white-50 text-decoration-none hover-success small">International Programs</a></li>
                        <li><a href="#" class="text-white-50 text-decoration-none hover-success small">Research Publications</a></li>
                    </ul>
                </div>
                <div class="col-lg-3 col-md-6 mb-4 mb-md-0">
                    <h6 class="text-uppercase fw-bold mb-4 text-white">Resources</h6>
                    <ul class="list-unstyled">
                        <li><a href="#" class="text-white-50 text-decoration-none hover-success small">Help Center</a></li>
                        <li><a href="#" class="text-white-50 text-decoration-none hover-success small">Student Guidelines</a></li>
                        <li><a href="#" class="text-white-50 text-decoration-none hover-success small">Download Forms</a></li>
                        <li><a href="#" class="text-white-50 text-decoration-none hover-success small">Faculty Directory</a></li>
                        <li><a href="#" class="text-white-50 text-decoration-none hover-success small">COVID-19 Guidelines</a></li>
                        <li><a href="#" class="text-white-50 text-decoration-none hover-success small">Campus Map</a></li>
                    </ul>
                </div>
            </div>
            <hr class="my-4 bg-white-50">
            <div class="d-flex flex-column flex-md-row justify-content-between align-items-center">
                <p class="text-white-50 small mb-2 mb-md-0">© 2025 NSBM Green University. All Rights Reserved.</p>
                <div>
                    <a href="#" class="text-white-50 text-decoration-none small me-3">Privacy Policy</a>
                    <a href="#" class="text-white-50 text-decoration-none small me-3">Terms of Use</a>
                    <a href="#" class="text-white-50 text-decoration-none small">Cookie Policy</a>
                </div>
            </div>
        </div>
    </footer>

    <!-- Floating Chat Button -->
    <div class="floating-btn" id="chatBtn">
        <i class="fas fa-comments"></i>
    </div>

    <!-- JavaScript Libraries -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/wow/1.1.2/wow.min.js"></script>
    <script>
        // Initialize Owl Carousel for News
        $(document).ready(function(){
            $('.news-carousel').owlCarousel({
                loop: true,
                margin: 20,
                nav: true,
                dots: true,
                autoplay: true,
                autoplayTimeout: 5000,
                autoplayHoverPause: true,
                navText: ['<i class="fas fa-chevron-left"></i>', '<i class="fas fa-chevron-right"></i>'],
                responsive: {
                    0: {
                        items: 1
                    },
                    768: {
                        items: 2
                    },
                    992: {
                        items: 3
                    }
                }
            });
            
            // Initialize Testimonial Carousel
            $('.testimonial-carousel').owlCarousel({
                loop: true,
                margin: 20,
                nav: true,
                dots: true,
                autoplay: true,
                autoplayTimeout: 6000,
                autoplayHoverPause: true,
                navText: ['<i class="fas fa-chevron-left"></i>', '<i class="fas fa-chevron-right"></i>'],
                responsive: {
                    0: {
                        items: 1
                    },
                    992: {
                        items: 2
                    }
                }
            });
            
            // Counter Animation
            function animateCounter() {
                $('.stat-count').each(function() {
                    const $this = $(this);
                    const countTo = parseInt($this.attr('data-count'));
                    
                    $({countNum: 0}).animate({
                        countNum: countTo
                    }, {
                        duration: 2000,
                        easing: 'swing',
                        step: function() {
                            $this.text(Math.floor(this.countNum).toLocaleString() + '+');
                        }
                    });
                });
            }
            
            // Trigger counter animation when in viewport
            const statsSection = document.querySelector('.stats-section');
            const observer = new IntersectionObserver((entries) => {
                if(entries[0].isIntersecting) {
                    animateCounter();
                    observer.unobserve(statsSection);
                }
            });
            
            observer.observe(statsSection);
            
            // Chat Button Hover Effect
            $('#chatBtn').hover(
                function() {
                    $(this).append('<span class="chat-tooltip">Need Help?</span>');
                },
                function() {
                    $(this).find('.chat-tooltip').remove();
                }
            );
            
            // Add smooth scrolling to all links
            $("a").on('click', function(event) {
                if (this.hash !== "") {
                    event.preventDefault();
                    const hash = this.hash;
                    $('html, body').animate({
                        scrollTop: $(hash).offset().top
                    }, 800);
                }
            });
        });
    </script>
</body>
</html>