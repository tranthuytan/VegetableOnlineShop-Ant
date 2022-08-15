<%-- 
    Document   : admin
    Created on : Mar 4, 2022, 2:21:50 PM
    Author     : Admin
--%>

<%@page import="java.util.List"%>
<%@page import="sample.product.ProductDTO"%>
<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
    </head>
    <body>
        <%
            UserDTO loginUser=(UserDTO)session.getAttribute("LOGIN_USER");
            if(loginUser==null || !loginUser.getRoleID().equals("1")) {
                loginUser=null;
                response.sendRedirect("login.jsp");
                return;
            }
            String search = request.getParameter("search");
            if(search==null) {
                search="";
            }
        %>
        <h1>Welcome: <%= loginUser.getFullName() %></h1>
        <form action="MainController">
            Search: <input type="text" name="search" value="<%=search%>"/>
            <input type="submit" name="action" value="Search"/>
        </form>
        <%
            List<ProductDTO> listProduct=(List<ProductDTO>)request.getAttribute("LIST_PRODUCT");
            if(listProduct!=null) {
                if(listProduct.size()>0) { 
        %>
        <table border="1" style="width:100vw">
            <thead>
                <tr>
                    <th>No</th>
                    <th>Product ID</th>
                    <th>Product Name</th>
                    <th>Image</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Category</th>
                    <th>Import Date</th>
                    <th>Using Date</th>
                    <th>Delete</th>
                    <th>Update</th>
                </tr>
            </thead>
            <tbody>
                <%
                    int count=1;
                    for (ProductDTO product : listProduct) {
                %>
            <form action="MainController">
                <tr>
                    <td><%= count++ %></td>
                    <td>
                        <input type="text" name="productID" value="<%= product.getProductID() %>" readonly/>
                        
                    </td>
                    <td>
                        <input type="text" name="productName" value="<%= product.getProductName() %>" required=""/>
                    </td>
                    <td>
                        <input type="text" name="image" value="<%= product.getImage() %>" required=""/>
                    </td>
                    <td>
                        <input type="text" name="price" value="<%= product.getPrice() %>" required=""/>
                    </td>
                    <td>
                        <input type="text" name="quantity" value="<%= product.getQuantity() %>" required=""/>
                    </td>
                    <td>
                        <input type="text" name="categoryID" value="<%= product.getCategoryID() %>" required=""/>
                    </td>
                    <td>
                        <input type="text" name="importDate" value="<%= product.getImportDate() %>"/>
                    </td>
                    <td>
                        <input type="text" name="usingDate" value="<%= product.getUsingDate() %>"/>
                    </td>
                    <td>
                        <a href="MainController?action=Delete&productID=<%= product.getProductID() %>&search=<%= search %>">Delete</a>
                    </td>
                    <td>
                        <input type="submit" name="action" value="Update"/>
                        <input type="hidden" name="search" value="<%=search%>"
                    </td>
                </tr>
            </form>
                
                <%
                    }
                %>
            </tbody>
        </table>
            <%
                }
            }
            %>

    </body>
</html>
