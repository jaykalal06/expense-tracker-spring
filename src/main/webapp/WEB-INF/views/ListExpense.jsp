<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Expense Tracker - List Expense</title>
<style>

     body {
        background-color: #aab5ad;
        margin: 0;
        font-family: 'Segoe UI', sans-serif;
    }

    .top-bar {
        background-color: #121212;
        color: #fff;
        padding: 1rem 2rem;
        display: flex;
        justify-content: space-between;
        align-items: center;
    }
    .top-bar .logo {
            font-size: 1.5rem;
            font-weight: bold;
        }
        
        .top-bar .user-email {
            font-size: 1rem;
            color: #cccccc;
        }
        
     .user-info {
    display: flex;
    align-items: center;
    gap: 1rem;
	}

	.user-email {
    font-size: 1rem;
    color: #cccccc;
	}

	.profile-pic {
    width: 40px;
    height: 40px;
    border-radius: 50%;
    object-fit: cover;
    border: 2px solid #fff;
	}
    
    .container {
        background-color: #f4f4f4;
        max-width: 800px;
        margin: 3rem auto;
        padding: 2rem;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0,0,0,0.2);
    }

    h2 {
        text-align: center;
        margin-bottom: 1.5rem;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 1rem;
    }

    th, td {
        padding: 10px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }

    th {
        background-color: #007bff;
        color: white;
    }

    tr:nth-child(even) {
        background-color: #f2f2f2;
    }

    a {
        display: inline-block;
        margin-top: 1.5rem;
        padding: 0.6rem 1.5rem;
        background-color: #007bff;
        color: #fff;
        text-decoration: none;
        border-radius: 5px;
        font-weight: bold;
        width: auto;
        text-align: center;
    }

    a:hover {
        background-color: #0056b3;
    }
    
    .links{
    	display: flex;
    	gap: 5rem;
    	justify-content: center;
    }
</style>
</head>
<body>

    <div class="top-bar">
    	<div class="logo">Expense Tracker</div>
    	<div class="user-info">
        	<span class="user-email">${sessionScope.userEmail}</span>
        	<img src="${sessionScope.profilepicpath}" alt="Profile Pic" class="profile-pic" />
    	</div>
	</div>

    <div class="container">
        <h2>List of Expenses</h2>

        <c:if test="${not empty expenses}">
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Title</th>
                        <th>Vendor</th>
                        <th>Category</th>
                        <th>Amount</th>
                        <th>Payment Mode</th>
                        <th>Expense Date</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="expense" items="${expenses}" varStatus="status">
                        <tr>
                            <td>${status.index + 1}</td> <!-- Serial Number (ID) -->
                            <td>${expense.title}</td>
                            <td>${expense.vendor}</td>
                            <td>${expense.category}</td>
                            <td>${expense.amount}</td>
                            <td>${expense.paymentmode}</td>
                            <td>${expense.expensedate}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
        <br>

        <c:if test="${empty expenses}">
            <p>No expenses found for this user.</p>
        </c:if>
		<div class="links">
        <a href="/addexpense">Add New Expense</a>
        <a href="/logout">Logout</a>
        </div>
    </div>

</body>
</html>
