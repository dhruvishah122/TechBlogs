/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.entities;

/**
 *
 * @author dhruv
 */
public class message {
    private String content;
    private String type;
    private String cssClass;
    public message(String content,String type, String cssClass){
        
        this.content=content;
        this.type=type;
        this.cssClass=cssClass;  
    }
    
    public String getContent(){
        return content;
    }
    public String getType(){
        return type;
    }
    public String getcssClass(){
        return cssClass;
    }
    public void setContent(){
        this.content=content;
    }
    public void setType(){
        this.type=type;
    }
    public void setcssClass(){
        this.cssClass=cssClass;
    }
}
