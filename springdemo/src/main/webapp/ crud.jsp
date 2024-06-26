
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
        table {
            border-collapse: collapse;
            width: 50%;
            text-align:center;
        }

        th, td {
            border: 1px solid black;
            padding: 15px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }
        a{
        	text-decoration:none;
        	color:green;
        	
        }
        a:hover{
        	color:blue;
        }
    </style>
 </style>
<body>
<h2>Table</h2>
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
                   <form action="/delete" method="post">
                       <input type="hidden" name="id" value="<%= item.getId() %>">
                       <input type="hidden" value="delete" name="action">
                       <input type="submit" value="Delete">
                   </form>
               </td>
               <td>
                   <form action="update.jsp?id=<%= item.getId() %>" method="post">
                       <input type="hidden" name="id" value="<%= item.getId() %>">
                       <input type="hidden" value="update" name="action">
                       <input type="submit" value="Edit">
                   </form>
               </td>
         </tr>  
        
        <%
            }
        %>
    </table>
    <a href='http://localhost:8080/'>Add account</a>
</body>
</html>