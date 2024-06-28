<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    margin: 0;
    padding: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}

.container {
    background-color: #ffffff;
    padding: 20px 40px;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    max-width: 400px;
    width: 100%;
    margin: auto;
}

h2 {
    text-align: center;
    color: #333;
    margin-bottom: 20px;
}

.form-group {
    margin-bottom: 15px;
}

.form-group label {
    display: block;
    margin-bottom: 5px;
    font-weight: bold;
    color: #333;
}

.form-group input {
    width: calc(100% - 20px);
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    font-size: 16px;
    box-sizing: border-box;
}

.form-group input:focus {
    border-color: #66afe9;
    outline: none;
    box-shadow: 0 0 5px rgba(102, 175, 233, 0.6);
}

.btn {
    display: block;
    width: 100%;
    padding: 10px;
    border: none;
    border-radius: 5px;
    background-color: #5cb85c;
    color: white;
    font-size: 16px;
    cursor: pointer;
    transition: background-color 0.3s ease;
    margin-top: 20px;
}

.btn:hover {
    background-color: #4cae4c;
}

.btn:focus {
    outline: none;
}
.error {
            color: red;
        }
</style>
</head>
<body>
<div class="container">
        <h2>Registration Form</h2>
       <form id="registrationForm" action="register" method="post">
        <div class="form-group">
            <label for="username">Username</label>
            <input type="text" id="username" name="username" required>
            <div id="usernameError" class="error"></div>
        </div>
        <div class="form-group">
            <label for="password">Password</label>
            <input type="password" id="password" name="password" required>
            <div id="passwordError" class="error"></div>
        </div>
        <div class="form-group">
            <label for="email">Email</label>
            <input type="email" id="email" name="email" required>
            <div id="emailError" class="error"></div>
        </div>
        <button type="submit" class="btn">Submit</button>
    </form>
    </div>
 <script>
 document.getElementById('registrationForm').addEventListener('submit', function(event) {
     let valid = true;

     // Username validation (at least 3 characters, only letters and numbers)
     const usernamePattern = /^[a-zA-Z0-9]{3,}$/;
     const username = document.getElementById('username').value;
     const usernameError = document.getElementById('usernameError');
     if (!usernamePattern.test(username)) {
         usernameError.textContent = 'Username must be at least 3 characters long and contain only letters and numbers.';
         valid = false;
     } else {
         usernameError.textContent = '';
     }

     // Password validation (at least 6 characters, at least one letter and one number)
     const passwordPattern = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@#$%^&+=])[A-Za-z\d@#$%^&+=]{6,}$/;
     const password = document.getElementById('password').value;
     const passwordError = document.getElementById('passwordError');
     if (!passwordPattern.test(password)) {
         passwordError.textContent = 'Password must be at least 6 characters long and contain (@#$%^&+=).';
         valid = false;
     } else {
         passwordError.textContent = '';
     }

     // Email validation
     const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
     const email = document.getElementById('email').value;
     const emailError = document.getElementById('emailError');
     if (!emailPattern.test(email)) {
         emailError.textContent = 'Please enter a valid email address.';
         valid = false;
     } else {
         emailError.textContent = '';
     }

     if (!valid) {
         event.preventDefault();
     }
 });
 </script>
</body>
</html>