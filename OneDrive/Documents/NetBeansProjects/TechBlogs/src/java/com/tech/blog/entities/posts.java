/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.entities;

import java.security.Timestamp;

/**
 *
 * @author dhruv
 */
public class posts {
    private int pid;
    private String pTitle;
    private String pContent;
    private String pCode;
    private String pPic;
    private Timestamp pDate;
    private int catId;
    private int userId;
    public posts(String pTitle, String pContent, String pCode, String pPic,int catId,int userId) {
       
        this.pTitle = pTitle;
        this.pContent = pContent;
        this.pCode = pCode;
        this.pPic = pPic;
        this.catId=catId;
        this.userId=userId;
    }
    public posts(int pid,String pTitle, String pContent, String pCode, String pPic,int catId,int userId) {
       this.pid=pid;
        this.pTitle = pTitle;
        this.pContent = pContent;
        this.pCode = pCode;
        this.pPic = pPic;
        this.catId=catId;
        this.userId=userId;
    }
    posts(){
        
    }

    // Getters
    public int getPid() {
        return pid;
    }

    public String getPTitle() {
        return pTitle;
    }
    public int getuserId() {
        return userId;
    }

    public void setuserId() {
        this.userId=userId;
    }
public int getcatId() {
        return catId;
    }

    public void setcatId() {
        this.catId=catId;
    }


    public String getpContent() {
        return pContent;
    }

    public String getpCode() {
        return pCode;
    }

    public String getpPic() {
        return pPic;
    }

    public Timestamp getpDate() {
        return pDate;
    }

    // Setters
    public void setpid(int pid) {
        this.pid = pid;
    }

    public void setpTitle(String pTitle) {
        this.pTitle = pTitle;
    }

    public void setpContent(String pContent) {
        this.pContent = pContent;
    }

    public void setpCode(String pCode) {
        this.pCode = pCode;
    }

    public void setpPic(String pPic) {
        this.pPic = pPic;
    }

    public void setpDate(Timestamp pDate) {
        this.pDate = pDate;
    }

    public String getTitle() {
        return pTitle;
    }
}
