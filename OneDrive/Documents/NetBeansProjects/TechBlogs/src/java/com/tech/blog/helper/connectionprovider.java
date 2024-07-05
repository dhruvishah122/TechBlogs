/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.helper;

import java.sql.*;
/**
 *
 * @author dhruv
 */
public class connectionprovider {
   private static Connection con;
   public static Connection getConnection() throws ClassNotFoundException, SQLException{
       
//       try{
//          
//           Class.forName("com.mysql.jdbc.Driver");
//con=DriverManager.getConnection("jdbc:mysql://localhost:3306/techblog?serverTimezone=UTC","root","Dbms#amazon122");
//           
//           
//       }catch(Exception e){
//           e.printStackTrace();
//       }
 Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/techblog","root","Dbms#amazon122");
           
       return con;
   }
}
