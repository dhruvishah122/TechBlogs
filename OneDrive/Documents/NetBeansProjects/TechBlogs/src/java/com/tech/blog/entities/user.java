/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.entities;
import java.sql.*;
/**
 *
 * @author dhruv
 */
public class user {
   private int id;
    private String name;
    private String email;
    private String password;
    private String gender;
    private String about;
    private Timestamp dateTime;
    private String profile;
    public  user(int id,String name,String email,String password,String gender,String about,Timestamp dateTime){
     
        this.id=id;
        this.name=name;
        this.email=email;
        this.password=password;
        this.gender=gender;
        this.about=about;
        this.dateTime=dateTime;
    }
        
    public user(){
        
    }
    public user(String name,String email,String password,String gender,String about){
     
       this.name=name;
        this.email=email;
        this.password=password;
        this.gender=gender;
        this.about=about;
        
    }
        
    public int getId() {
        return id;
    }
    public void setId(int id){
        this.id=id;
    }
    public String getName() {
        return name;
    }
     public void setName(String name) {
        this.name= name;
    }
    public String getEmail() {
        return email;
    }
     public void setEmail(String email) {
        this.email= email;
    }
    public String getPassword() {
        return password;
    }
     public void setPassword(String password) {
        this.password= password;
    }
    public String getAbout() {
        return about;
    }
     public void setAbout(String about) {
        this.about= about;
    }
    public String getGender() {
        return gender;
    }
     public void setGender(String gender) {
        this.gender= gender;
    }
     
     public String getProfile() {
        return profile;
    }
     public void setProfile(String profile) {
        this.profile= profile;
    }
    public Timestamp getTimestamp() {
        return dateTime;
    }

}
