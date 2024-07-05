/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.dao;
import com.tech.blog.entities.user;
import java.sql.*;
import java.io.PrintWriter;
public class userdao {
    private Connection con;
    public userdao(Connection con){
        this.con=con;
    }
    
    //insert to db
    
    public boolean saveuser(user u){
         boolean f=false;
        try{
          
           
    String query="insert into user(name,email,password,gender,about) values(?,?,?,?,?)";
    PreparedStatement pstmt= con.prepareStatement(query);
    pstmt.setString(1,u.getName());
    pstmt.setString(2,u.getEmail());
    pstmt.setString(3,u.getPassword());
    pstmt.setString(4,u.getGender());
    pstmt.setString(5,u.getAbout());
    pstmt.executeUpdate();
    
    f=true;
        }catch(Exception e){
           // System.out.println(e);
           e.printStackTrace();
        }
       return f;         
    }
    
    //get by email & password
    
    public  user getbyEmailandPass(String email,String password){
         user user = new user();
                //user=null;
        try{
            String query="select * from user where email=? and password=?";
            PreparedStatement p=con.prepareStatement(query);
              p.setString(1,email);
              p.setString(2, password);
             ResultSet set= p.executeQuery();
             if(set.next()){
              
                String name=set.getString(2);
                user.setName(name);
                user.setId(Integer.parseInt(set.getString(1)));
                user.setEmail(set.getString(3));
                user.setGender(set.getString(5));
                user.setAbout(set.getString(6));
                user.setProfile(set.getString(8));
             }
        }catch(Exception e){
            e.printStackTrace();
        }
        return user;
    }
    
    public boolean updateUser(user u){
        boolean f=false;
        try{
        String query= "update user set name=?,email=?,about=?, profile=? where id=?"; 
        
        PreparedStatement p=con.prepareStatement(query);
        p.setString(1,u.getName());
        p.setString(2,u.getEmail());
       // p.setString(3,u.getPassword());
        p.setString(3,u.getAbout());
       
        p.setString(4, u.getProfile());
        p.setInt(5, u.getId());
       
        p.executeUpdate();
        f=true;
        }catch(Exception e){
            e.printStackTrace();
        }
        return f;
    }
    public user getuserbypid(int postId) throws SQLException{
        user user=new user();
        String q="select * from user where id=?";
        PreparedStatement p=con.prepareStatement(q);
        p.setInt(1,postId);
        ResultSet set=p.executeQuery();
        try{
        if(set.next()){
           String name=set.getString(2);
                user.setName(name);
                user.setId(Integer.parseInt(set.getString(1)));
                user.setEmail(set.getString(3));
                user.setGender(set.getString(5));
                user.setAbout(set.getString(6));
                user.setProfile(set.getString(8));
        }
        }catch(Exception e){
            e.printStackTrace();
        }return user;
    }
}
