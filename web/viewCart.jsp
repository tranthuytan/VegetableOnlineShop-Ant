<%-- 
    Document   : viewCart
    Created on : Mar 10, 2022, 11:27:06 AM
    Author     : Admin
--%>

<%@page import="sample.shopping.Product"%>
<%@page import="sample.shopping.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Your Cart</title>
    </head>
    <body>
        <h1>Products: </h1>
        <%
            Cart cart=(Cart)session.getAttribute("CART");
            if(cart!=null) {
                if(cart.getCart().size()>0) {
        %>
        <table border="1">
            <thead>
                <tr>
                    <th>No</th>
                    <th>Product ID</th>
                    <th>Product Name</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Total</th>
                    <th>Remove</th>
                    <th>Edit</th>
                </tr>
            </thead>
            <tbody>
                <%
                    int count=1;
                    double total=0;
                    for (Product product : cart.getCart().values()) {
                        total+=product.getPrice()*product.getQuantity();
                %>
            <form action="MainController">
                <tr>
                    <td><%= count++ %></td>
                    <td>
                        <%= product.getId() %>
                        <input type="hidden" name="id" value="<%= product.getId() %>"/>
                    </td>
                    <td><%= product.getName() %></td>
                    <td><%= product.getPrice() %></td>
                    <td>
                        <input type="number" name="quantity" value="<%= product.getQuantity() %>" min="1" required=""/>
                    </td>
                    <td><%= product.getPrice()*product.getQuantity() %></td>
                    <td>
                        <input type="submit" name="action" value="Remove"/>
                    </td>
                    <td>
                        <input type="submit" name="action" value="Edit"/>
                    </td>
                </tr>
            </form>
                <%
                        }
                %>
                
            </tbody>
        </table>
                <h2>Total: <%= total %></h2>
        <%
                }
            }
        %>
        <a href="MainController?action=Search&search=">Add more</a></br>
        <form action="MainController">
                    <input type="submit" name="action" value="CheckOut"/>
        </form>
    </body>
</html>
