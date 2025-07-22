# 🛒 Shop Management System (MySQL-Based)

A fully functional **Shop Management System** that automates inventory, sales, employee schedules, and profit tracking using **MySQL**. Designed for academic purposes, this project demonstrates how structured data and triggers can efficiently simulate a real-world retail system.

---

## 📋 Table of Contents

- [🔍 Project Overview](#-project-overview)
- [🎯 Features](#-features)
- [⚙️ Tools & Technologies](#️-tools--technologies)
- [🧠 Core Components](#-core-components)
- [📊 Testing & Results](#-testing--results)
- [🧪 Limitations](#-limitations)
- [📈 Future Improvements](#-future-improvements)
- [👨‍💻 Author](#-author)
- [📎 References](#-references)

---

## 🔍 Project Overview

This **Shop Management System** is built using **MySQL** and tested via **phpMyAdmin** and **MySQL Workbench** under **XAMPP localhost**. It is designed to simulate retail operations, ensuring accurate tracking of:

- Inventory items  
- Sales transactions  
- Employee schedules  
- Monthly profits

The project showcases practical implementation of relational database principles, including foreign key relations, constraints, triggers, and aggregate functions.

---

## 🎯 Features

- Add, update, and delete products in inventory  
- Record transactions and auto-update stock  
- Generate daily and monthly sales reports  
- Employee shift scheduling  
- Track profits and stock levels via triggers  
- Alerts for expired and low-stock items  

---

## ⚙️ Tools & Technologies

- **MySQL** – Used as the core database engine  
- **phpMyAdmin** – For executing and testing SQL queries  
- **MySQL Workbench** – For schema modeling and query visualization  
- **XAMPP** – Local server environment for hosting MySQL  

---

## 🧠 Core Components

- **Items Table:** Stores product info with price, quantity, and expiration date  
- **Transactions Table:** Manages purchase records and links with products  
- **Employees Table:** Keeps employee data and salary information  
- **EmployeeSchedule Table:** Logs employee shift schedules  
- **DailySales Table:** Tracks day-to-day sales through triggers  
- **SalesSummary Table:** Summarizes monthly item sales  
- **MonthlyProfit Table:** Calculates profit by comparing revenue and cost  
- **Triggers:** Used for automatic stock updates, sales logging, and alerts  

---

## 📊 Testing & Results

The system was tested using a variety of SQL operations and verified the following:

- Inventory is adjusted automatically after each transaction  
- Triggers update daily sales and monthly profits accurately  
- Employee shift data reflects scheduled workdays  
- SQL queries such as joins, subqueries, and aggregates perform well  

**Performance:**  
- Queries run efficiently on localhost  
- Schema is normalized to reduce redundancy  
- Triggers automate data integrity maintenance  

---

## 🧪 Limitations

- No graphical interface – all interactions require SQL  
- No built-in backup mechanism  
- Not optimized for large-scale shop operations  
- Requires basic SQL knowledge to operate  
- Manual setup of schema and data insertion is needed  

---

## 📈 Future Improvements

- Add a graphical user interface using Tkinter, Flask, or React  
- Implement login system with role-based access  
- Introduce automatic backups and cloud storage  
- Integrate barcode scanner functionality for faster transactions  
- Add predictive analysis to forecast restock needs  
- Enable remote access via hosted MySQL server  

---

## 👨‍💻 Author

**Md Syful Islam** 
`Student ID: 222002111`  
B.Sc. in CSE (Day), Green University of Bangladesh  
Course: Database System Lab (CSE 210)  
Instructor: Ms. Farhana Akter Sunny  
Section: 222 D3  
Submitted on: 15 December 2024  

---

## 📎 References

1. https://www.javatpoint.com/mysql-trigger  
2. https://dev.mysql.com/doc/refman/8.4/en/aggregate-functions.html  
3. http://localhost/phpmyadmin/  
4. https://www.upgrad.com/blog/dbms-project-ideas-for-beginners/  
5. https://www.youtube.com/watch?v=rIi1dvPdTHE  
