/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.model;

public class Student {
    private String name;
    private String dob;
    private String gender;
    private String nic;
    private String email;
    private String phone;
    private String address;
    private String enrollmentDate;
    private String facultyName;
    private int departmentID;
    private String password;
    private String status; // 'active' or 'inactive'

    // Getters and Setters

    public String getName() { 
        return name; 
    }
    public void setName(String name) { 
        this.name = name; 
    }

    public String getDob() { 
        return dob; 
    }
    public void setDob(String dob) { 
        this.dob = dob; 
    }

    public String getGender() { 
        return gender; 
    }
    public void setGender(String gender) { 
        this.gender = gender; 
    }

    public String getNic() { 
        return nic; 
    }
    public void setNic(String nic) { 
        this.nic = nic; 
    }

    public String getEmail() { 
        return email; 
    }
    public void setEmail(String email) { 
        this.email = email; 
    }

    public String getPhone() { 
        return phone; 
    }
    public void setPhone(String phone) { 
        this.phone = phone; 
    }

    public String getAddress() { 
        return address; 
    }
    public void setAddress(String address) { 
        this.address = address; 
    }

    public String getEnrollmentDate() { 
        return enrollmentDate; 
    }
    public void setEnrollmentDate(String enrollmentDate) { 
        this.enrollmentDate = enrollmentDate; 
    }

    public String getFacultyName() { 
        return facultyName; 
    }
    public void setFacultyName(String facultyName) { 
        this.facultyName = facultyName; 
    }

    public int getDepartmentID() { 
        return departmentID; 
    }
    public void setDepartmentID(int departmentID) { 
        this.departmentID = departmentID; 
    }

    public String getPassword() { 
        return password; 
    }
    public void setPassword(String password) { 
        this.password = password; 
    }

    // ✅ Proper implementation of setStatus and getStatus
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        if (status == null || status.isEmpty()) {
            this.status = "inactive"; // Default to 'inactive' if no value is provided
        } else {
            this.status = status;
        }
    }
}
