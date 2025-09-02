# 🚀 Employee Management System (Spring MVC + JSP)

[![Java](https://img.shields.io/badge/Java-17-blue)](https://www.java.com/) 
[![Spring MVC](https://img.shields.io/badge/Spring%20MVC-5.3-brightgreen)](https://spring.io/projects/spring-framework) 
[![MySQL](https://img.shields.io/badge/MySQL-8.0-blue)](https://www.mysql.com/)

A **futuristic Employee Management System** built using **Spring MVC**, **JSP**, and **MySQL**, featuring CRUD operations, CSV export, and animated UI.

---

## 📌 Features

- **Add Employee** – Add employee with name, age, skills, and salary  
- **Delete Employee** – Remove employee by ID  
- **View Single Employee** – Display details of an employee by ID  
- **View All Employees** – Show all employee records in an animated futuristic table  
- **Export Data** – Export all employee records to CSV  
- **Animated UI** – Futuristic, responsive design with hover animations and glow effects  

---

## 💻 Technology Stack

| Frontend | Backend | Database |
|----------|---------|---------|
| JSP, HTML, CSS, JS | Java Spring MVC | MySQL |

---

## ⚠️ Important Notes

1. This project **runs only on localhost**. The database connection is configured for `localhost:3306`.  
2. Make sure you have **MySQL installed and running** on your machine.  
3. **Database name:** `spring`  
4. **Table name:** `employee_details`  
5. Default database credentials (change in controller if needed):  
   - **Username:** `root`  
   - **Password:** `admin@123`  
6. You need to create the `employee_details` table before running the project. Sample query:

```sql
CREATE TABLE employee_details (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    age INT NOT NULL,
    skills VARCHAR(255),
    salary DOUBLE
);
