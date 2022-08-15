<%-- 
    Document   : login
    Created on : Mar 4, 2022, 12:46:40 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
    <body>
        <nav>
            <h1>Login Information</h1>
            <form action="MainController" method="POST">
                UserID: <input type="text" name="userID" placeholder="Tên đăng nhập"/></br>
                Password: <input type="password" name="password" placeholder="Mật khẩu"/></br>
                <input type="submit" name="action" value="Login"/>
                <input type="reset" value="Reset"/>
            </form>
            <%
                String error=(String)request.getAttribute("ERROR");
                if(error==null) {
                    error="";
                }
            %>
            <%= error %></br>
            Haven't have an account yet? <a href="create.jsp">Create account</a>
        </nav>
    </body>
</html>
