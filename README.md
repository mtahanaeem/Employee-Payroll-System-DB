# 💼 Employee Payroll System DB

A relational database design for managing employee records, tracking attendance, leaves, and automating payroll calculations using SQL.

---

## 🗄️ Database Schema

| Table | Description |
|:------|:------------|
| **employees** | Employee personal info, department, designation, hire date |
| **salary_structure** | Basic salary, HRA, DA, allowances, deductions |
| **deductions** | Per-month deductions with reasons |
| **attendance** | Daily attendance tracking (Present/Absent/Leave/Half-day) |
| **leaves** | Leave applications with types and approval status |
| **payroll** | Monthly payroll records with payment status |

---

## 📊 Key Queries

- Gross salary, total deductions, and net salary calculations
- Top 5 highest-paid employees
- Average salary by designation
- Employee tenure calculation (years/months in company)
- Attendance status summary
- Employees with incomplete salary structures
- Top employees with most deductions

---

## 🛠️ Tech Stack

MySQL, SQL (DDL, DML, Joins, Subqueries, Aggregate Functions, Date Functions)

---

## 📂 Files

- `Empolyee Payroll System.sql` — Full database schema, sample data, and analytical queries
- `Empolyee Payroll System.pdf` — Project documentation

---

## 👥 Contributors

- **Muhammad Taha Naeem** ([@mtahanaeem](https://github.com/mtahanaeem))
- **Abdur Rehman** ([@Zin-7045](https://github.com/Zin-7045))
