<%@page import="ch.qos.logback.core.recovery.ResilientSyslogOutputStream"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.util.List" %>
 <%@ page import="com.chainsys.springdemo.model.User" %>
 <%
 List<User> list =( List<User>)  request.getAttribute("users");
 
 if(list != null)
     for (User item : list) {
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
/* Container styling */
.container {
    max-width: 600px;
    margin: 0 auto;
    padding: 20px;
    margin-top:100px;
    background-color: #f9f9f9;
    border: 1px solid #ddd;
    border-radius: 8px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

/* Form group styling */
.form-group {
    margin-bottom: 15px;
}

/* Label styling */
.form-group label {
    display: block;
    margin-bottom: 5px;
    font-weight: bold;
    color: #333;
}

/* Input field styling */
.form-group input[type="text"],
.form-group input[type="password"],
.form-group input[type="email"] {
    width: 100%;
    padding: 10px;
    font-size: 16px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}

/* Button container styling */
.button-container {
    text-align: center;
    margin-top: 20px;
}

/* Button styling */
button.btn {
    display: inline-block;
    padding: 10px 20px;
    font-size: 16px;
    color: #fff;
    background-color: #007bff;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    text-align: center;
    text-decoration: none;
    transition: background-color 0.3s ease;
}

button.btn:hover {
    background-color: #0056b3;
}

/* Hidden input field */
input[type="hidden"] {
    display: none;
}
</style>
</head>
<body>
<div class="container">
    <form action="/update" method="post">
        <div class="form-group">
            <label for="username">Username</label>
            <input type="text" id="username" name="username" value="<%= item.getUsername() %>" required>
        </div>
        <div class="form-group">
            <label for="password">Password</label>
            <input type="password" id="password" name="password" value="<%= item.getPassword() %>" required>
        </div>
        <div class="form-group">
            <label for="email">Email</label>
            <input type="email" id="email" name="email" value="<%= item.getEmail() %>" required>
            <input type="hidden" id="id" name="id" value="<%= request.getParameter("id") %>">
        </div>
        <div class="button-container">
            <button type="submit" class="btn">Update</button>
        </div>
    </form>
    <%} %>
</div>
</body>
</html>
