<%-- 
    Document   : normal_navbar
    Created on : 25 Apr 2024, 4:27:54 pm
    Author     : dhruv
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
         <link rel="stylesheet" href="css/style.css">
         <style>
             body{
      background-image:url("pics/tom_1.jpg");
       background-size: cover;
            background-attachment: fixed;
 }
         </style>
    </head>
    <body>
       <nav class="navbar navbar-expand-lg navbar-dark primary-background">
           <a class="navbar-brand" href="index.jsp"><b><span class="fa fa-code"></span> Techblog</b></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
          <a class="nav-link" href="index.jsp"><b><span class="fa fa-home"></span> Home</b> <span class="sr-only">(current)</span></a>
      </li>
    
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" style="color:whitesmoke" href="#" role="button" data-toggle="dropdown" aria-expanded="false">
            <b> <span class="fa fa-check-square"></span> Categories</b><span class="sr-only">(current)</span>
        </a>
        <div class="dropdown-menu">
          <a class="dropdown-item" href="#">Programming</a>
          <a class="dropdown-item" href="#">Project implementation</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">DSA</a>
        </div>
      </li>
     <li class="nav-item">
         <a class="nav-link" style="color:whitesmoke" href="#"><b><span class="fa fa-address-book"></span> Contact us</b><span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
          <a class="nav-link" style="color:whitesmoke" href="login_page.jsp"><b><span class="fa fa-user-circle "></span> Login</b></a>
      </li>
        <li class="nav-item">
            <a class="nav-link" style="color:whitesmoke" href="register_page.jsp"><b><span class="fa fa-user-circle "></span> Signup</b></a>
      </li>
    </ul>
    <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-light my-2 my-sm-0" type="submit"><b>Search</b></button>
    </form>
  </div>
</nav>
        <script src="https://kit.fontawesome.com/yourcode.js" crossorigin="anonymous"></script>
    </body>
</html>
