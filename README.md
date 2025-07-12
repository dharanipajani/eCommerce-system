

---

# 📦 E-Commerce Data Management System

## 📝 Project Description

The **E-Commerce Data Management System** is a complete SQL-based solution developed to manage and automate various operations of an online retail platform. The system efficiently handles customer data, order processing, inventory updates, and reporting using a combination of SQL queries, stored procedures, and triggers.

This project was built with a focus on:

* Automating loyalty and stock management
* Enhancing reporting using pivot tables
* Improving data quality and integrity
* Providing business insights through classification and ranking

---

## 🚀 Implemented Features

### ✅ 1. Loyalty Points Assignment Based on Customer Age

Loyalty points were updated using a SQL query with **CASE** statements:

* Customers below 25 years received **10 points**
* Customers between 25–40 years received **20 points**
* Customers above 40 received **5 points**

---

### ✅ 2. Country-wise Sales Classification

A summary query was written to **aggregate order values** by country and classify the sales category:

* **High** if total > 100,000
* **Medium** if between 50,000 and 100,000
* **Low** if less than 50,000

---

### ✅ 3. Pivot Report by Payment Method

A pivot-style SQL query was used to group and show total quantities by payment method:

* **Credit Card Quantity**
* **PayPal Quantity**
* **Cash Quantity**

---

### ✅ 4. Top 3 Customers by Total Spending

Using a combination of **JOINs** and a **subquery with RANK()**, the system identifies the top 3 customers who spent the most on orders.

---

### ✅ 5. Products Ordered Above Average Quantity

A query was created to calculate the average order quantity and retrieve all products whose order quantity exceeded the average.

---

### ✅ 6. Stored Procedure: Retrieve Orders by Customer ID

A stored procedure was implemented to fetch all orders for a given customer using an **IN** parameter.

---

### ✅ 7. Stored Procedure: Return Total Spending of a Customer

Another stored procedure was written using an **INOUT** parameter to compute and return the total amount a customer has spent.

---

### ✅ 8. Trigger: Set Default Loyalty Points to 0

A **BEFORE INSERT trigger** was added to set the loyalty points to **0** if it was `NULL` at the time of inserting a new customer.

---

### ✅ 9. Trigger: Deduct Product Stock on Order Placement

An **AFTER INSERT trigger** was implemented to automatically reduce the product’s stock by the order quantity after a new order is placed.

---

## 🛠️ Tools & Technologies Used

* SQL (Tested on MySQL)
* Stored Procedures
* Triggers (BEFORE and AFTER)
* Aggregate Functions
* Pivot Techniques using CASE
* Window Functions (RANK)

---

## 📈 Outcome

The project demonstrates strong SQL database skills, especially in:

* Business logic implementation through automation
* Complex query handling with subqueries and joins
* Ensuring data consistency using triggers
* Producing analytical reports with meaningful insights

---

## 👤 Developed By

**Dharani Pajani**
[GitHub](https://github.com/dharanipajani) | [LinkedIn](https://linkedin.com/in/dharani-pajani-907b40265)

---
