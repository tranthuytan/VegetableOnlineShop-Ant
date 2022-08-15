<%-- 
    Document   : create
    Created on : Mar 9, 2022, 8:12:47 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
    </head>
    <body>
        <h1>Create account</h1>
        Already have account? <a href="login.jsp">login</a>
        <form action="MainController" method="POST"></br>
            User ID: <input type="text" name="userID" required=""/></br>
            Full Name: <input type="text" name="fullName" required=""/></br>
            Password: <input type="password" name="password" required=""/></br>
            Confirm password: <input type="password" name="confirm" required=""/></br>
            Address: <input type="text" name="address"/></br>
            Birthday: <input type="text" name="birthday" placeholder="DD/MM/YYYY"/></br>
            Phone number: <input type="text" name="phone"/></br>
            Email: <input type="text" name="email" required=""/></br>
            <input type="submit" name="action" value="Create"/>
        </form>
        
    </body>
</html>
