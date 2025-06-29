<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Expense Tracker - Add Expense</title>
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
        max-width: 450px;
        margin: 3rem auto;
        padding: 2rem 3rem 2rem 2rem;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0,0,0,0.2);
    }

    h2 {
        text-align: center;
        margin-bottom: 2rem;
    }

    label {
        display: block;
        margin-top: 1rem;
        font-weight: bold;
    }

    input[type="text"],
    input[type="number"],
    input[type="date"] {
        width: 100%;
        padding: 0.5rem;
        margin-top: 0.3rem;
        border: 1px solid #ccc;
        border-radius: 5px;
    }

    .error {
        color: red;
        font-size: 0.9rem;
    }

    input[type="submit"] {
        margin-top: 2rem;
        padding: 0.7rem 2rem;
        background-color: #007bff;
        color: #fff;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-weight: bold;
        display: block;
        width: 100%;
    }

    input[type="submit"]:hover {
        background-color: #0056b3;
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
        <h2>Add Expense</h2>
        <form action="saveexpense" method="post">
            <label>Title:</label>
            <input type="text" name="title" value="${expense.title}"/>
            <div class="error">${result.getFieldError("title").getDefaultMessage()}</div>

            <label>Vendor:</label>
            <input type="text" name="vendor" value="${expense.vendor}"/>
            <div class="error">${result.getFieldError("vendor").getDefaultMessage()}</div>

            <label>Category:</label>
            <input type="text" name="category" value="${expense.category}"/>
            <div class="error">${result.getFieldError("category").getDefaultMessage()}</div>

            <label>Amount:</label>
            <input type="number" name="amount" value="${expense.amount}"/>
            <div class="error">${result.getFieldError("amount").getDefaultMessage()}</div>

            <label>Payment Mode:</label>
            <input type="text" name="paymentmode" value="${expense.paymentmode}"/>
            <div class="error">${result.getFieldError("payment").getDefaultMessage()}</div>

            <label>Expense Date:</label>
            <input type="date" name="expensedate" value="${expense.expensedate}"/>
            <div class="error">${result.getFieldError("expensedate").getDefaultMessage()}</div>

            <input type="submit" value="Save Expense"/>
        </form>
    </div>

</body>
</html>
