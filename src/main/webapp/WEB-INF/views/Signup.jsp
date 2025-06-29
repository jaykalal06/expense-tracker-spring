<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Expense - Tracker : Signup</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', sans-serif;
        }

        body {
            background-color: #aab5ad;
            color: #ffffff;
            min-height: 100vh;
        }

        .top-bar {
            background-color: #121212;
            padding: 1rem 2rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
            color: #fff;
        }

        .top-bar .logo {
            font-size: 1.5rem;
            font-weight: bold;
        }

        .top-bar .user-email {
            font-size: 1rem;
            color: #cccccc;
        }

        .container {
            background-color: #f4f4f4;
            color: #333;
            max-width: 500px;
            margin: 3rem auto;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(255, 255, 255, 0.1);
        }

        form {
            display: flex;
            flex-direction: column;
        }

        label {
            margin-top: 1rem;
            font-weight: 600;
        }

        input[type="text"],
        input[type="email"],
        input[type="password"] {
            padding: 0.6rem;
            margin-top: 0.3rem;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .radio-group {
            display: flex;
            gap: 1rem;
            margin-top: 0.5rem;
        }

        .submit-btn {
            margin-top: 1.5rem;
            padding: 0.7rem;
            background-color: #007bff;
            color: #fff;
            font-weight: bold;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .submit-btn:hover {
            background-color: #0056b3;
        }

        .error {
            color: red;
            font-size: 0.9rem;
            margin-top: 0.2rem;
        }

        .login-link {
            margin-top: 1rem;
            text-align: center;
        }

        .login-link a {
            color: #007bff;
            text-decoration: none;
        }

        .login-link a:hover {
            text-decoration: underline;
        }
        
        input[type="file"].file-input {
    		margin-top: 0.5rem;
	    	padding: 0.4rem;
    		background-color: #ffffff;
	    	border: 1px solid #ccc;
	    	border-radius: 5px;
    		color: #333;
    		font-size: 0.9rem;
		}
        
    </style>
</head>
<body>
    <div class="top-bar">
        <div class="logo">Expense Tracker</div>
    </div>

    <div class="container">
        <h2>Signup</h2>
        <form action="saveuser" method="post" enctype="multipart/form-data">
            <label>First Name:</label>
            <input type="text" name="firstname" value="${user.firstname}" />
            <div class="error">${result.getFieldError("firstname").getDefaultMessage()}</div>

            <label>Last Name:</label>
            <input type="text" name="lastname" value="${user.lastname}" />
            <div class="error">${result.getFieldError("lastname").getDefaultMessage()}</div>

            <label>Email:</label>
            <input type="email" name="email" value="${user.email}" />
            <div class="error">${result.getFieldError("email").getDefaultMessage()}</div>

            <label>Password:</label>
            <input type="password" name="password" value="${user.password}" />
            <div class="error">${result.getFieldError("password").getDefaultMessage()}</div>

            <label>Gender:</label>
            <div class="radio-group">
                <label><input type="radio" name="gender" value="Male" ${user.gender == 'Male' ? 'checked' : ''}/> Male</label>
                <label><input type="radio" name="gender" value="Female" ${user.gender == 'Female' ? 'checked' : ''}/> Female</label>
            </div>
            <div class="error">${result.getFieldError("gender").getDefaultMessage()}</div>
            
            <label>Profile Image:</label>
			<input type="file" name="profilePic" class="file-input" />
			<div class="error">${result.getFieldError("profilePic") != null ? result.getFieldError("profilePic").getDefaultMessage() : ''}</div>
            

            <input type="submit" value="Signup" class="submit-btn">

            <p class="login-link"><a href="/login">Existing User? Login</a></p>
        </form>
    </div>
</body>
</html>
