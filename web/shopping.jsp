<%-- 
    Document   : shopping
    Created on : Mar 7, 2022, 8:45:48 AM
    Author     : Admin
--%>

<%@page import="sample.user.UserDTO"%>
<%@page import="java.util.List"%>
<%@page import="sample.product.ProductDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/styleproduct.css">
        <title>Shopping Page</title>
    </head>
    <body>
        <%
            UserDTO loginUser=(UserDTO)session.getAttribute("LOGIN_USER");
            if(loginUser==null || !loginUser.getRoleID().equals("2")) {
                loginUser=null;
                response.sendRedirect("login.jsp");
                return;
            }
            String search=request.getParameter("search");
            if(search==null) {
                search="";
            }
        %>
        <header>
        <nav>
            <a href="user.jsp">User Information</a>
            <a href="viewCart.jsp">Cart</a>
            <a href="MainController?action=Logout" style="float:right">Logout</a>
            
            
        </nav>
        </header>
        <form action="MainController">
                <input type="text" name="search" value="<%= search %>"/>
                <input type="submit" name="action" value="Search"/>
        </form>
        <%
            String message=(String)request.getAttribute("MESSAGE");
            if(message==null) {
                message="";
            }
        %>
        <%= message %></br>

        <%
            List<ProductDTO> listProduct=(List<ProductDTO>)request.getAttribute("LIST_PRODUCT");
            if(listProduct!=null) {
                if(listProduct.size()>0) {
                    for (ProductDTO product : listProduct) {
        %>
        <div class="sale-off">
		<div class="item-des">
                    <form action="MainController">
			<img src="<%= product.getImage() %>"  alt="<%= product.getProductName() %>"  />
                        <input type="hidden" name="productID" value="<%= product.getProductID() %>"/>
			<h4><%= product.getProductName() %></h4>
                        <input type="hidden" name="productName" value="<%= product.getProductName() %>"/>
                        <p> <%= product.getPrice() %>đ/kg </p>
                        <input type="hidden" name="price" value="<%= product.getPrice() %>"/>
                        <select name="cmbQuantity">
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="5">5</option>
                            <option value="10">10</option>
                        </select>
                        <div><input type="submit" name="action" value="Add"/></div>
                        
                    </form>
		</div>
	</div>
        
        <%
                    }
                }
            }
        %>
    </body>
</html>
