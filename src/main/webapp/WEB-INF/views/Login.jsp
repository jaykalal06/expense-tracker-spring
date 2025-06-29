<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Expense Tracker - Login</title>
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
    .container {
        background-color: #f4f4f4;
        max-width: 400px;
        margin: 3rem auto;
        padding: 2rem;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0,0,0,0.2);
    }

    h1 {
        text-align: center;
        margin-bottom: 1rem;
    }

    form {
        display: flex;
        flex-direction: column;
    }

    label {
        margin-top: 1rem;
        font-weight: 600;
    }

    input[type="email"],
    input[type="password"] {
        padding: 0.6rem;
        margin-top: 0.3rem;
        border: 1px solid #ccc;
        border-radius: 5px;
    }

    .error {
        color: red;
        font-size: 0.9rem;
        margin-top: 0.2rem;
    }

    input[type="submit"] {
        margin-top: 1.5rem;
        padding: 0.7rem;
        background-color: #007bff;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-weight: bold;
    }

    input[type="submit"]:hover {
        background-color: #0056b3;
    }
    .signup-link {
            margin-top: 1rem;
            text-align: center;
        }

        .signup-link a {
            color: #007bff;
            text-decoration: none;
        }

        .signup-link a:hover {
            text-decoration: underline;
        }
</style>
</head>
<body>

    <div class="top-bar">
        <div class="logo">Expense Tracker</div>
        
    </div>

    <div class="container">
        <h2>Login</h2>
        <form action="checkuser" method="post">
            <label>Email:</label>
            <input type="email" name="email" value="${user.email}"/>
            <div class="error">${result.getFieldError("email").getDefaultMessage()}</div>

            <label>Password:</label>
            <input type="password" name="password" value="${user.password}"/> 
            <div class="error">${result.getFieldError("password").getDefaultMessage()}</div>

            <input type="submit" value="Login">
            
            <p class="signup-link"><a href="/signup">New to us? Signup</a></p>
            
        </form>
    </div>

</body>
</html>
