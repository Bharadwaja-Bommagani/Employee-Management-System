# Employee Management System

A full-featured web-based **Employee Management System** built using Java technologies. This system allows for secure employee and admin interactions with role-based functionalities and a user-friendly interface.

-------------

## 🚀 Project Overview

The **Employee Management System** is a Java-based web application that streamlines the employee registration, authentication, profile management, and administrative tasks like employee oversight. It follows the **MVC architecture** and integrates various technologies to ensure a smooth, maintainable, and scalable workflow.

-------------

## ✨ Features

### 🔐 Admin Module
- Admin Registration and Login
- Dashboard with welcome details
- View all registered employees
- Add new employees
- Delete employee records
- Secure session handling

### 👨‍💼 Employee Module
- Employee Registration and Login
- Update personal details (profile update)
- Change password securely
- Personalized dashboard with session-based greetings
- Form validations using JavaScript

-------------

## 🧑‍💻 Technologies Used

| Layer             | Technologies                              |
|------------------|--------------------------------------------|
| **Frontend**      | HTML, CSS, Bootstrap, JavaScript           |
| **Backend**       | Core Java, Servlets, JSP, JDBC             |
| **Database**      | MySQL (SQL)                                |
| **Architecture**  | MVC (Model-View-Controller)                |
| **IDE & Tools**   | Eclipse IDE, Apache Tomcat, MySQL Workbench |

-------------

## 🛠️ Functional Flow

1. **Admin & Employee Login/Register**: Secure registration and authentication system with session management.
2. **Admin Dashboard**: Admins can manage employees (view, add, delete).
3. **Employee Dashboard**: Employees can view and update their profile and change their passwords.
4. **Session Handling**: Proper session tracking to avoid unauthorized access.
5. **Form Validations**: JavaScript-based field validations to enhance user experience.

----------

- **Landing Page** – Portal selection for Admin or Employee  
- **Admin Dashboard** – View, add, and delete employees  
- **Employee Dashboard** – Update details and manage credentials
---------


## 🔒 Security & Best Practices

- Passwords are securely managed (not visible or stored in plaintext).
- Role-based access control between admin and employee.
- Validations and error handling for secure data transactions.
- Logout mechanism to prevent unauthorized session reuse.

----------

## 📂 Project Structure
EmployeeManagementSystem/
├── WebContent/
│ ├── JSP Files (adminDashboard.jsp, employeeDashboard.jsp, etc.)
│ └── CSS & JS (Bootstrap, custom styles)
├── src/
│ ├── Controller (Servlets for login, register, update)
│ ├── DAO (Database interaction)
│ └── Model (for Admin & Employee)
├── DB/
│ └── employee_management.sql
----------------
