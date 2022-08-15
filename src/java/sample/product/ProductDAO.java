/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import sample.utils.DBUtils;

/**
 *
 * @author Admin
 */
public class ProductDAO {
    private static final String SEARCH="SELECT * FROM tblProducts WHERE productName like ?";
    private static final String DELETE="DELETE tblProducts WHERE productID=?";
    private static final String UPDATE="UPDATE tblProducts SET productName=?, image=?, price=?, quantity=?,categoryID=?,importDate=?,usingDate=? WHERE productID=?";
    public boolean update(ProductDTO product) throws SQLException {
        boolean check=false;
        Connection conn=null;
        PreparedStatement ptm=null;
        try {
            conn=DBUtils.getConnection();
            if(conn!=null) {
                ptm=conn.prepareStatement(UPDATE);
                ptm.setString(1, product.getProductName());
                ptm.setString(2, product.getImage());
                ptm.setDouble(3, product.getPrice());
                ptm.setInt(4,product.getQuantity());
                ptm.setString(5, product.getCategoryID());
                ptm.setString(6, product.getImportDate());
                ptm.setString(7, product.getUsingDate());
                ptm.setString(8, product.getProductID());
                check=ptm.executeUpdate()>0?true:false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            if(ptm!=null) ptm.close();
            if(conn!=null) conn.close();
        }
        return check; 
    }
    public boolean delete(String productID) throws SQLException {
        boolean check=false;
        Connection conn=null;
        PreparedStatement ptm=null;
        try {
            conn=DBUtils.getConnection();
            if(conn!=null) {
                ptm=conn.prepareStatement(DELETE);
                ptm.setString(1, productID);
                check=ptm.executeUpdate()>0?true:false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            if(ptm!=null) ptm.close();
            if(conn!=null) conn.close();
        }
        return check;
    }
    public List<ProductDTO> getListProduct(String search) throws SQLException {
        List<ProductDTO> list =new ArrayList<>();
        Connection conn=null;
        PreparedStatement ptm=null;
        ResultSet rs=null;
        try {
            conn=DBUtils.getConnection();
            if(conn!=null) {
                ptm=conn.prepareStatement(SEARCH);
                ptm.setString(1, "%"+search+"%");
                rs=ptm.executeQuery();
                while(rs.next()) {
                    String productID=rs.getString("productID");
                    String productName=rs.getString("productName");
                    String image=rs.getString("image");
                    double price=rs.getDouble("price");
                    int quantity=rs.getInt("quantity");
                    String categoryID=rs.getString("categoryID");
                    String importDate=rs.getString("importDate");
                    String usingDate=rs.getString("usingDate");
                    list.add(new ProductDTO(productID, productName, image, price, quantity, categoryID, importDate, usingDate));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            if(rs!=null) rs.close();
            if(ptm!=null) ptm.close();
            if(conn!=null) conn.close();
        }
        return list;
    }
    
}
