<%-- 
    Document   : index
    Created on : 25 Apr 2024, 3:09:44 pm
    Author     : dhruv
--%>
<%@page import ="com.tech.blog.helper.connectionprovider" %>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.posts"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.dao.postdao"%>
<%@page import="com.tech.blog.helper.connectionprovider"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <style>
 .banner-background{
 clip-path: polygon(50% 0%, 100% 0, 100% 100%, 100% 93%, 68% 100%, 44% 95%, 22% 100%, 0 95%, 0 0);
  
 }
 body{
      background-image:url("pics/tom.jpg");
       background-size: cover;
            background-attachment: fixed;
 }
        </style>
    
    </head>
    <body>
        <%@include file="normal_navbar.jsp" %>
        
        <!--//banner--> 
        <div class="body">
        <div class="container-fluid p-0 m-0">
            <div class="  text-white ">
                <div class="container text-white ">
                   
                    <h3 class="display-3"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Welcome to Tech Blog </b><span class="fa fa-smile-o"></span></h3>
               
                    <h4><br><!-- comment --><b>Code is like humor. When you have to explain it, it’s bad.Debugging is twice as hard as writing the code in the first place. Therefore, if you write the code as cleverly as possible, you are, by definition, not smart enough to debug it.

                            First, solve the problem. Then, write the code.</b></h4><br>
                            <h4><b>
Programming isn’t about what you know; it’s about what you can figure out.

The only way to learn a new programming language is by writing programs in it.Don’t wait for the perfect moment to start coding. Start with the moment and make it perfect.
Remember, the code you write today is the bug you fix tomorrow. Embrace the cycle with passion.</b></h4>
           
          <a href="register_page.jsp" class="btn btn-outline-light btn-lg " style="background-color:white; color:black"> <span class="fa fa-external-link"></span> Start for free!!</a>    
          <a href="login_page.jsp" class="btn btn-outline-light btn-lg "style="background-color:white; color:black" ><span class="fa fa-user-circle fa-spin"></span> Login</a>    
                <!--posts-->
                
                <br>
                      <div class="container">
            <div class="row mb-2 mt-4">
<%
//    Thread.sleep(1000);
postdao d=new postdao(connectionprovider.getConnection());
//int cid=Integer.parseInt(request.getParameter("cid"));
List<posts> posts=new ArrayList<>();
//if(cid==0)
 posts=d.getallposts();



for(posts p:posts){   

%>

<div class="col-md-4 mt-2">
    <div class="card">
           <div class="card-header bg-grey text-black">
                                    <h4 class="post-title" style="color:black"><%=p.getPTitle()%></h4>
                                </div>
        <div class="card-body">
           <img class="card-img-top" src="pics/<%=p.getpPic()%>" alt="Card image cap">
            
           
            <!--<p class="card-text" style='color:black; background-image: src="pics/<%=p.getpPic()%>"'><%= p.getpContent()%> </p>-->
               
            
        </div>
            <div class="card-footer primary-background ">
                <a href="show_post.jsp?post_id=<%= p.getPid()%>" class="btn btn-outline-light btn">Read more..</a>
                <a href="#" class="btn btn-outline-light btn"><i class="fa fa-thumbs-o-up"></i><span> 10</span></a>
                <a href="#" class="btn btn-outline-light btn"><i class="fa fa-commenting-o"></i><span> 20</span></a>
            </div>
    </div>   
</div>
<% }%>
            </div><!-- comment -->
                      </div> 
</div>
                
            </div>       </div>
            </div>
        </div>
        
        
<!--        <div class="container">
            <div class="row mb-2">
                <div class="col-md-4">
                    <div class="card" >

  <div class="card-body">
    <h5 class="card-title">Java programming</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn primary-background text-white">Read more</a>
  </div>
</div>
                </div>
                
<div class="col-md-4">
                    <div class="card" >

  <div class="card-body">
    <h5 class="card-title">Java programming</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn primary-background text-white">Read more</a>
  </div>
</div>
                </div>
                
                
<div class="col-md-4">
                    <div class="card" >

  <div class="card-body">
    <h5 class="card-title">Java programming</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn primary-background text-white">Read more</a>
  </div>
</div>
                </div>
            </div>
            
            
            <div class="row">
                <div class="col-md-4">
                    <div class="card" >

  <div class="card-body">
    <h5 class="card-title">Java programming</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn primary-background text-white">Read more</a>
  </div>
</div>
                </div>
                
<div class="col-md-4">
                    <div class="card" >

  <div class="card-body">
    <h5 class="card-title">Java programming</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn primary-background text-white">Read more</a>
  </div>
</div>
                </div>
                
                
<div class="col-md-4">
                    <div class="card" >

  <div class="card-body">
    <h5 class="card-title">Java programming</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn primary-background text-white">Read more</a>
  </div>
</div>
                </div>-->
<!--            </div>
        </div>
        -->
        
        
        
        
        <!--js-->
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/yourcode.js" crossorigin="anonymous"></script>  
    </body>
</html>
