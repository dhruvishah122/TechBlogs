<%-- 
    Document   : login_page
    Created on : 25 Apr 2024, 9:38:02 pm
    Author     : dhruv
--%>

<%@page import="com.tech.blog.entities.message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <style>
            .banner-background{
 clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 98%, 68% 88%, 37% 97%, 0 87%, 0 0);
            }body{
      background-image:url("pics/tom_1.jpg");
       background-size: cover;
            background-attachment: fixed;
 }
        </style>
        <title>Login Page</title>
        
    </head>
    <body>
   <%@include file="normal_navbar.jsp"%>
        <main class="d-flex align-items-center  banner-background" style="height:70vh">
            
            <div class="container">
                <div class="row">
                    <div class="col-md-4 offset-md-4">
                        
                        <div class="card">
                            <div class="card-header  text-center">
                                <span class="fa fa-user-circle-o fa-3x"></span> <br>         
 <h4>Login Here</h4>
                            </div>
                            <%
                          message m = (message)session.getAttribute("msg");
                          if(m!=null){
                            %>
                            <div class="alert alert-primary <%=m.getcssClass()%>" role="alert">
  <%= m.getContent()%>
</div>
                            <% }   
session.removeAttribute("msg"); %>
                                <div class="card-body">
                                <form action='login_servlet' method='post'>
  <div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input name="email" required type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input name="password" required type="password" class="form-control" id="exampleInputPassword1">
  </div>
  <div class="form-group form-check">
    <input type="checkbox" class="form-check-input" id="exampleCheck1">
    <label class="form-check-label" for="exampleCheck1">Check me out</label>
  </div>
     <div class="container" text-center>
  <button type="submit" class="btn btn-primary">Submit</button>
     </div><!-- comment -->
</form>
                            </div>
                            
                                <div class="card-footer">
                                
                            </div>
                        </div> 
                        
                    </div>
                </div>
            </div>
        </main>
   <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/yourcode.js" crossorigin="anonymous"></script>  
    </body>
</html>
