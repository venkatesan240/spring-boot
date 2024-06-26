<%@page import="ch.qos.logback.core.recovery.ResilientSyslogOutputStream"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.util.List" %>
 <%@ page import="com.chainsys.springdemo.model.User" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="/update" method="post">
            <div class="form-group">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" required>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" required>
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" required>
                <input type="hidden" id="id" name="id" value="<%= request.getParameter("id") %>" >
            </div>
            <button type="submit" class="btn">update</button>
        </form>
</body>
</html>
