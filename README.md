# 🛒 Shop Management System (MySQL-Based)

A fully functional **Shop Management System** that automates inventory, sales, employee schedules, and profit tracking using **MySQL**. Designed for academic purposes, this project demonstrates how structured data and triggers can efficiently simulate a real-world retail system.  This project was developed as part of the Database System Lab (CSE 210) course at Green University of Bangladesh.

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
- ✅ Schedule employee shifts and track attendance  
- ✅ Track profits and stock levels via triggers  
- ✅ Alerts for expired and low-stock items  

---

## ⚙️ Tools & Technologies

- **MySQL** – Used as the core database engine  
- **phpMyAdmin** – For executing and testing SQL queries  
- **MySQL Workbench** – For schema modeling and query visualization  
- **XAMPP** – Local server environment for hosting MySQL  

---

## 🧠 Core Components

- **Items Table:** Stores product info (ID, name, price, quantity, expiry date)  
- **Transactions Table:** Logs customer purchases and updates stock  
- **Employees Table:** Stores employee name, role, salary, and ID  
- **EmployeeSchedule Table:** Logs working hours and shift allocation  
- **DailySales Table:** Tracks daily sales (trigger-based)  
- **SalesSummary Table:** Aggregates item-wise monthly sales  
- **MonthlyProfit Table:** Calculates revenue and net profit per month  
- **Triggers:** Automate updates for sales, stock deduction, and profit entries  

---

## 📊 Testing & Results

The system was evaluated through hands-on SQL operations:

| Operation                         | Result                                      |
|----------------------------------|---------------------------------------------|
| Insert transaction               | Auto-updated inventory and daily sales      |
| Update item quantity             | Reflected in inventory and restock alerts   |
| Schedule employee shift          | Recorded and retrievable by date filter     |
| Trigger fire on delete           | Prevented invalid data removal              |

**Performance Highlights:**

- Optimized schema with normalization  
- Fast trigger execution on localhost  
- Aggregate queries tested for monthly reports  

---

## 🧪 Limitations

- ❌ No graphical interface – interactions are SQL-based  
- ❌ No built-in export or backup system  
- ❌ Lacks authentication and role management  
- ❌ Not optimized for high transaction volume  
- ❌ Manual schema setup is required  

---

## 📈 Future Improvements

- 💻 Build GUI using **Tkinter**, **Flask**, or **React**  
- 🔐 Add login authentication with user roles (admin, cashier)  
- ☁️ Add cloud support or auto-backup features  
- 📦 Integrate barcode scanner functionality  
- 📈 Add dashboard with charts for real-time analytics  
- 🤖 Implement AI for sales predictions and stock restock alerts  

---

## 👨‍💻 Author

**Md Syful Islam**  
`Student ID: 222002111`  
🎓 B.Sc. in CSE (Day), Green University of Bangladesh  
🧑‍🏫 **Course:** Database System Lab (CSE 210)  
👩‍🏫 **Instructor:** Ms. Farhana Akter Sunny  
📚 **Section:** 222 D3  
🗓️ **Submitted on:** 15 December 2024  

---

## 📎 References

1. [MySQL Trigger – JavaTpoint](https://www.javatpoint.com/mysql-trigger)  
2. [Aggregate Functions – MySQL Docs](https://dev.mysql.com/doc/refman/8.4/en/aggregate-functions.html)  
3. [phpMyAdmin Localhost](http://localhost/phpmyadmin/)  
