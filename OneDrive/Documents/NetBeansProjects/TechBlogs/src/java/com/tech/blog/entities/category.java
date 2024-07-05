/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.entities;

public class category {
    private int cid;
    private String name;
    private String description;
    public category(int cid,String name,String description){
        this.cid=cid;
        this.name=name;
        this.description=description;
    }
    public category(){
        
    }
    public category(String name,String description){
         this.name=name;
        this.description=description;    
    }
    
  public void setName(String name){
  this.name= name;
}
  public String getName(){
      return name;
  }
  
   public int getCid(){
  return cid;
}
  public void setCid(int cid){
      this.cid= cid;
  }
  
   public String getDesc(){
  return description;
}
  public void setDesc(String description){
      this.description= description;
  }
}