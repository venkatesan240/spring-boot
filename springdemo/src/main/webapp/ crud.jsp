
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="java.util.ArrayList" %>
 <%@ page import="java.util.List" %>
 <%@ page import="com.chainsys.springdemo.model.User" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<style>
 <style>
       body {
    font-family: Arial, sans-serif;
    margin: 20px;
}

h2 {
    text-align: center;
    color: #333;
    margin-bottom: 20px;
}

.search-box {
    width: 400px;
    margin: 0 auto 20px;
    padding: 10px;
    background-color: #f2f2f2;
    border-radius: 5px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.search-box form {
    display: flex;
    align-items: center;
}

.search-box input[type="text"] {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    margin-right: 10px;
    font-size: 16px;
}

.search-box input[type="text"]:focus {
    border-color: #66afe9;
    outline: none;
    box-shadow: 0 0 5px rgba(102, 175, 233, 0.6);
}

.search-box input[type="submit"] {
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    background-color: #1e7293;
    color: white;
    font-size: 16px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

.search-box input[type="submit"]:hover {
    background-color: #4cae4c;
}

.search-box input[type="submit"]:focus {
    outline: none;
}

table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
}

table, th, td {
    border: 1px solid #ddd;
}

th, td {
    padding: 12px;
    text-align: left;
}

th {
    background-color: #f2f2f2;
    color: #333;
}

tr:nth-child(even) {
    background-color: #f9f9f9;
}

tr:hover {
    background-color: #f1f1f1;
}

/* Common styles for submit buttons */
input[type="submit"] {
    padding: 5px 10px;
    border: none;
    border-radius: 3px;
    color: white;
    font-size: 14px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

input[type="submit"]:focus {
    outline: none;
}

/* Delete button specific styles */
input[type="submit"].btn-delete {
    background-color: #d60909;
}

input[type="submit"].btn-delete:hover {
    background-color: #b20707;
}

/* Edit button specific styles */
input[type="submit"].btn-edit {
    background-color: #4cae4c;
}

input[type="submit"].btn-edit:hover {
    background-color: #3e8e3e;
}


a {
    display: inline-block;
    margin-top: 20px;
    text-decoration: none;
    padding: 10px 20px;
    background-color: #5cb85c;
    color: white;
    border-radius: 5px;
    transition: background-color 0.3s ease;
}

a:hover {
    background-color: #4cae4c;
}

a:focus {
    outline: none;
}

    </style>
 </style>
<body>
<h2>Table</h2>
 <div class="search-box">
            <form action="/search" method="post">
                <input type="text" name="name" placeholder="Search...">
                <input type="submit" value="Search">
            </form>
        </div>
    <table>
     <tr>
        <th>Name</th>
        <th>Email</th>
        <th>password</th>
        <th>Delete</th>
        <th>Edit</th>
    </tr>
        <%
            List<User> list =( List<User>)  request.getAttribute("users");
        if(list != null)
            for (User item : list) {
        %>
        <tr>
            <td><%= item.getUsername() %></td>
            <td><%= item.getEmail() %></td>
            <td><%= item.getPassword() %></td>
			<td>
				<div class="form-group">
					<form action="/delete" method="post">
						<input type="hidden" name="id"	value="<%= item.getId() %>"> 
						<input	type="hidden" value="delete" name="action">
						<input	type="submit" value="Delete" class="btn-delete">
					</form>
				</div>
			</td>
			<td>
			<div class="form-group">
				<form action="/getupdate" method="post">
					<input type="hidden" name="id"	value="<%= item.getId() %>"> 
					<input	type="hidden" value="edit" name="action"> 
					<input	type="submit" value="Edit" class="btn-edit">
				</form>
			</div>
			</td>
		</tr>          
        <%
            }
        %>
    </table>
    <a href='http://localhost:8080/'>Add account</a>
</body>
</html>