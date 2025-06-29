<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Expense Tracker - Home</title>
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
        max-width: 600px;
        margin: 3rem auto;
        padding: 2rem;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0,0,0,0.2);
        text-align: center;
    }

    h2 {
        margin-bottom: 2rem;
    }

    .btn {
        display: inline-block;
        margin: 0.5rem;
        padding: 0.7rem 1.5rem;
        background-color: #007bff;
        color: white;
        text-decoration: none;
        border-radius: 5px;
        font-weight: bold;
        transition: background-color 0.3s ease;
    }

    .btn:hover {
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
        <h2>Welcome, Login Successful</h2>
        <a href="/addexpense" class="btn">Add New Expense</a>
        <a href="/listexpense" class="btn">List Expenses</a>
        <a href="/logout" class="btn">Logout</a>
    </div>

</body>
</html>
