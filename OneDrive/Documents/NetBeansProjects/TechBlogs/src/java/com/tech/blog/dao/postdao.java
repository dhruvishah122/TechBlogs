/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.dao;
import com.tech.blog.entities.category;
import com.tech.blog.entities.posts;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author dhruv
 */
public class postdao {
    
  Connection con;
public postdao(Connection con){
    this.con=con;
}  

public ArrayList<category> getallcat(){
    ArrayList<category> list=new ArrayList<>();
    try{
       String q="select * from categories";
       Statement st=con.createStatement();
       ResultSet set=st.executeQuery(q);
       while(set.next()){
           int cid=set.getInt("cid");
           String name=set.getString("name");
           String description=set.getString("description");
           category c=new category(cid,name,description);
           list.add(c);
           
       }
       
    }catch(Exception e){
       e.printStackTrace();
    }return list;
}

public boolean savePost(posts p){
    boolean f=false;
    try{
        String q="insert into posts(pTitle,pContent,pCode,pPic,catId,userid) values (?,?,?,?,?,?)";
        PreparedStatement ps=con.prepareStatement(q);
        ps.setString(1,p.getTitle());
        ps.setString(2,p.getpContent());
        ps.setString(3,p.getpCode());
        ps.setString(4, p.getpPic());
        ps.setInt(5, p.getcatId());
        ps.setInt(6,p.getuserId());
        ps.executeUpdate();
        f=true;
    }catch(Exception e){
        e.printStackTrace();
    }
    return f;
}
public List<posts> getallposts(){
    List<posts>list=new ArrayList<>();
    try{
       PreparedStatement ps=con.prepareStatement("select * from posts order by pid desc");
       ResultSet r=ps.executeQuery();
       while(r.next()){
          int pid=r.getInt("pid");
          String pTitle =r.getString("pTitle");
          String pContent=r.getString("pContent");
          String pCode=r.getString("pCode");
          String pPic =r.getString("pPic");
          Timestamp date=r.getTimestamp("pDate");
          int catId=r.getInt("catId");
          int userid=r.getInt("userid");
          posts p=new posts(pid,pTitle,pContent,pCode,pPic,catId,userid);
          list.add(p);
       }
    }catch(Exception e){
        e.printStackTrace();
    }
    
    return list;
}
public List<posts> getallpostsbycatid(int catid){
    List<posts>list=new ArrayList<>();
     try{
       PreparedStatement ps=con.prepareStatement("select * from posts where catId=?");
       ps.setInt(1, catid);
       ResultSet r=ps.executeQuery();
       while(r.next()){
          int pid=r.getInt("pid");
          String pTitle =r.getString("pTitle");
          String pContent=r.getString("pContent");
          String pCode=r.getString("pCode");
          String pPic =r.getString("pPic");
          Timestamp date=r.getTimestamp("pDate");
         // int catId=r.getInt("catId");
          int userid=r.getInt("userid");
          posts p=new posts(pid,pTitle,pContent,pCode,pPic,catid,userid);
          list.add(p);
       }
     }catch(Exception e){
        e.printStackTrace();
    }
    return list;
}
public posts getallpostbypid(int postId) throws Exception{
    String q="select * from posts where pid=?";
    posts post=null;
    try{
    PreparedStatement p=this.con.prepareStatement(q);
    p.setInt(1, postId);
    ResultSet r=p.executeQuery();
    if(r.next()){
         int pid=r.getInt("pid");
          String pTitle =r.getString("pTitle");
          String pContent=r.getString("pContent");
          String pCode=r.getString("pCode");
          String pPic =r.getString("pPic");
          Timestamp date=r.getTimestamp("pDate");
         int catId=r.getInt("catId");
          int userid=r.getInt("userid");
           post=new posts(pid,pTitle,pContent,pCode,pPic,catId,userid);
    
    }
    }catch(Exception e){
        e.printStackTrace();
    }return post;
}
}
