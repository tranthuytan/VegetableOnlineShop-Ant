<%-- 
    Document   : user
    Created on : Mar 4, 2022, 2:26:09 PM
    Author     : Admin
--%>

<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Page</title>
    </head>
    <body>
        <%
            UserDTO loginUser=(UserDTO)session.getAttribute("LOGIN_USER");
            if(loginUser==null || !loginUser.getRoleID().equals("2")) {
                loginUser=null;
                response.sendRedirect("login.jsp");
                return;
            }
        %>
        <nav>
            <h1>User Information</h1>
            <a href="MainController?action=Search&search=">Shopping</a>
        </nav>
        UserID: <%= loginUser.getUserID() %></br>
        FullName: <%= loginUser.getFullName()%></br>
        RoleID: <%= loginUser.getRoleID()%></br>
        Password: <%= "***" %></br>
        Address: <%= loginUser.getAddress()%></br>
        Birthday: <%= loginUser.getBirthday()%></br>
        Phone number: <%= loginUser.getPhone()%></br>
        Email: <%= loginUser.getEmail() %>
    </body>
</html>
