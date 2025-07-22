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

- ✅ Add, update, and delete products in inventory  
- ✅ Record transactions and auto-update stock  
- ✅ Generate daily and monthly sales reports  
- ✅ Employee shift scheduling  
- ✅ Track profits and stock levels via triggers  
- ✅ Alerts for expired and low-stock items  

---

## ⚙️ Tools & Technologies

| Tool               | Purpose                                |
|--------------------|----------------------------------------|
| **MySQL**          | Relational database engine             |
| **phpMyAdmin**     | Web interface for executing queries    |
| **MySQL Workbench**| Schema design and data modeling        |
| **XAMPP**          | Localhost server and MySQL hosting     |

---

## 🧠 Core Components

| Component            | Functionality Description                                   |
|----------------------|-------------------------------------------------------------|
| `Items`              | Stores product info with price, quantity, and expiry date  |
| `Transactions`       | Handles purchase records and links to products             |
| `Employees`          | Manages employee profiles and salaries                     |
| `EmployeeSchedule`   | Tracks employee shifts and dates                           |
| `DailySales`         | Logs daily sales metrics via triggers                      |
| `SalesSummary`       | Aggregates monthly sales totals                            |
| `MonthlyProfit`      | Calculates profit based on sales vs cost                   |
| `Triggers`           | Automate updates like stock deduction and sales logging    |

---

## 📊 Testing & Results

The system was tested with sample data and validated through:

- ✔ Inventory adjustments after each sale  
- ✔ Daily sales log updated via triggers  
- ✔ Monthly profit generation with accurate formulas  
- ✔ Shift allocation for employees reflected in schedule table  
- ✔ Joins, subqueries, and aggregates verified successfully  

**Performance Summary:**  
- ⚡ Query execution time: Minimal  
- 🧠 Memory usage: Efficient and normalized  
- 🔁 Triggers: Reduced manual data updates  

---

## 🧪 Limitations

- ❌ No front-end UI (SQL-based interaction only)  
- ❌ No persistent backup mechanism  
- ❌ Cannot handle large-scale transaction loads  
- ❌ Requires basic SQL knowledge to operate  
- ❌ Manual setup for schema and sample data  

---

## 📈 Future Improvements

- 💻 Add GUI using Python Tkinter or web dashboard  
- 🔐 Integrate user login and admin access roles  
- 💾 Implement automated backups and recovery  
- 📦 Barcode scanner integration for item lookup  
- 📈 Predictive analytics for restocking and sales trends  
- 🌐 Host on cloud server with remote access  

---

## 👨‍💻 Author

**Md Syful Islam**  
🎓 B.Sc. in CSE (Day), Green University of Bangladesh  
🧑‍🏫 **Course:** Database System Lab (CSE 210)  
👩‍🏫 **Instructor:** Ms. Farhana Akter Sunny  
📚 Section: **222 D3**  
📅 Submitted on: **15 December 2024**

---

## 📎 References

1. [MySQL Triggers – JavaTpoint](https://www.javatpoint.com/mysql-trigger)  
2. [MySQL Aggregate Functions – MySQL Docs](https://dev.mysql.com/doc/refman/8.4/en/aggregate-functions.html)  
3. [phpMyAdmin](http://localhost/phpmyadmin/)  
4. [DBMS Project Ideas – UpGrad](https://www.upgrad.com/blog/dbms-project-ideas-for-beginners/)  

