<%-- 
    Document   : show_post
    Created on : 2 May 2024, 3:57:20 pm
    Author     : dhruv
--%>
<%@page import="com.tech.blog.dao.userdao"%>
<%@page import="com.tech.blog.dao.likedao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.category"%>
<%@page import="com.tech.blog.entities.posts"%>
<%@page import="com.tech.blog.dao.postdao"%>
<%@page import="com.tech.blog.helper.connectionprovider"%>
<%@page import="com.tech.blog.entities.user"%>
<%@page errorPage="true"%>
<%
user user=(user)session.getAttribute("currentUser");
   
    if(user.getEmail()==null){
   response.sendRedirect("login_page.jsp");
   }
  %>
<%
    int postId=Integer.parseInt(request.getParameter("post_id"));
    postdao dao=new postdao(connectionprovider.getConnection());
    posts p=dao.getallpostbypid(postId);
    %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> <%=p.getTitle()%></title>
         <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <style>
        .banner-background {
            clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 98%, 68% 88%, 37% 97%, 0 87%, 0 0);
        }
        .post-title{
            font-weight:100;
            font-size:30px;
            
        }
        .post-content{
            font-weight:100;
            font-size:20px;
        }
        .post-code{
            
        }
        .post-date{
             font-size:25px;
            font-style: italic;
            font-weight:bold;
        }
        .post-user-info{
            font-size:20px;
            font-weight:300;
        }
        .row-user{
            border:1px solid #e2e2e2;
            padding-top:15px;
        }
        body{
            background: url(pics/tom_1.jpg);
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
                    <a class="nav-link" href="#"><span class="fa fa-home"></span> Home <span class="sr-only">(current)</span></a>
                </li>

                <li class="nav-item dropdown" style='color:whitesmoke'>
                    <a class="nav-link dropdown-toggle"style='color:whitesmoke' href="#" role="button" data-toggle="dropdown" aria-expanded="false">
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
                    <a class="nav-link" href="#" style='color:whitesmoke'><b><span class="fa fa-address-book"></span> Contact us</b><span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a style='color:whitesmoke' class="nav-link" href="#" data-toggle="modal" data-target="#add-post"><b><span class="fa fa-edit"></span> Do post</b><span class="sr-only">(current)</span></a>
                </li>
            </ul>
            <ul class="navbar-nav mr-right">
                <li class="nav-item">
                    <a class="nav-link" href="#" data-toggle="modal" style='color:whitesmoke'data-target="#profile-modal"><b><span class="fa fa-user-circle "></span> <%=user.getName()%></b></a>
                </li> 
                <li class="nav-item">
                    <a class="nav-link" href="logout_servlet" style='color:whitesmoke'><b><span class="fa fa-user-plus "></span> Logout</b></a>
                </li> 
            </ul>
        </div>
    </nav>
                <!--end of navbar-->
                <div class="container">
                    <div class="row my-4">
                        <div class="col-md-8 offset-md-2">
                           
                            <div class="card">
                                <div class="card-header bg-primary  text-white" style=' background-color:#161F6D;'>
                                    <h4 class="post-title"><%=p.getPTitle()%></h4>
                                </div>
                                 
                                <div class="card-body">
                                      <img class="card-img-top my-2" src="pics/<%=p.getpPic()%>" alt="Card image cap">
                                      <div class="row my-3 row-user">
                                          <div class="col-md-8">
                                              <% userdao udao=new userdao(connectionprovider.getConnection());%>
                                              <p class="post-date"><a href="#"><%= udao.getuserbypid(p.getuserId()).getName()%> </a>has posted:</p>       
                                          </div>
                                          <div class="col-md-4">
                                              <p class="post-date">Your post id:<%=p.getPid()%></p>
                                                  
                                          </div>
                                      </div>        
                                      
                                      <p class="post-content"><%=p.getpContent()%></p>
                                    <br><!-- comment -->
                                    <div class="post-code">
                                    <pre><%=p.getpCode()%></pre>
                                    </div>
                                </div>
                                     <div class="card-footer bg-primary ">


                            <%
                                likedao ld = new likedao(connectionprovider.getConnection());
                            %>

                            <a href="#!" onclick="doLike(<%= p.getPid()%>,<%= user.getId()%>)" class="btn btn-outline-light btn"> <i class="fa fa-thumbs-o-up"></i> <span class="like-counter"><%= ld.countLikeOnPost(p.getPid())%></span>  </a>
                            <a href="#!" class="btn btn-outline-light btn"> <i class="fa fa-commenting-o"></i> <span>20</span>  </a>



                        </div>

                   
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header primary-background text-white text-center">
                    <h5 class="modal-title" id="exampleModalLabel">Techblog</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <!-- Modal content goes here -->
                    <div class="container text-center">
                        <img src="pics/<%=user.getProfile()%>" class="img-fluid" style="border-radius:50%; max-width:150px"><!-- comment -->
                    <h5 class="modal-title" id="exampleModalLabel"><%=user.getName()%></h5>
                    <br>
                    <!--details-->
                    <div id="profile-details">
 <table class="table table-striped">

  <tbody>
    <tr>
      <th scope="row">ID:</th>
      
      <td><%=user.getId()%></td>
    </tr>
    <tr>
      <th scope="row">Email: </th>
      
      <td><%=user.getEmail()%></td>
    </tr>
    <tr>
      <th scope="row">Gender: </th>
     
      <td><%=user.getGender()%></td>
    </tr>
      <tr>
      <th scope="row">Status: </th>
     
      <td><%=user.getAbout()%></td>
    </tr>
      <tr>
      <th scope="row">Registered on: </th>
     
      <td><%=user.getTimestamp()%></td>
    </tr>
  </tbody>
</table> 
                    </div>
    <!--profile edit-->
    
    
    <div id="profile-edit" style="display:none">
        
        <h4 style="color:green">Please Edit carefully</h4>
        <form action="edit_servlet" method="post" enctype="multipart/form-data">
            <table class="table">
                <tr>
                    <td>
                        ID:
                    </td>
                    <td>
                    <%=user.getId()%>  
                    </td>
                    
                </tr>
                 <tr>
                    <td>
                        Name:
                    </td>
                    <td>
                <input type='text' class='form-control' name='user_name' value='<%=user.getName()%>'>
                    </td>
                </tr>
                 <tr>
                    <td>
                        Password:
                    </td>
                    <td>
                <input type='password' class='form-control' name='user_password' value='<%=user.getPassword()%>'>
                    </td>
                </tr>
                <tr>
                    <td>
                        Email:
                    </td>
                    <td>
                <input type='email' class='form-control' name='user_email' value='<%=user.getEmail()%>'>
                    </td>
                </tr>
                 <tr>
                    <td>
                        Gender:
                    </td>
                    <td>
               <%=user.getGender()%>
                    </td>
                </tr>
                 <tr>
                    <td>
                        About:
                    </td>
                    <td>
                        <textarea  class='form-control' name='about'><%=user.getAbout()%></textarea>
                    </td>
                </tr>
              <tr>
                    <td>
                       Select profile
                    </td>
                    <td>
                        <input type='file' class='form-control' name='image'>
                    </td>
                </tr>
            </table>
                    <div class='container'><!-- comment -->
                        <button type='submit' class='btn btn-outline-primary'>Save</button>
                    </div>
        </form>
    </div>
                    </div>  
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="button" id="edit-profile-button" class="btn btn-primary">Edit</button>
                </div>
            </div>
        </div>
    </div>
    <!-- End of profile modal -->
   <!--add post modal-->


<!-- Modal -->
<div class="modal fade" id="add-post" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header primary-background">
        <h5 class="modal-title" id="exampleModalLabel" style="color:white">Provide post details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <form action="post_servlet" method="post" id="add-post-form">
              <div class="form-group"> 
                  <select class="form-control" name="cid">
                      <option selected disabled>---Select category---</option>
                  <%
                    postdao post=new postdao(connectionprovider.getConnection());  
                  ArrayList<category>list=post.getallcat();
                  for(category c:list){
                  
                      
                  %>
                  <option value=<%= c.getCid()%>><%= c.getName()%></option>
                  <%
                      }
                   %>
              </select>
              </div>
              <div class="form-group"><!-- comment -->    
                  <input type ="text" name="pTitle" placeholder="Enter post title" class="form-control"><!-- comment -->
                </div>
              
              <div class="form-group"><!-- comment -->    
                  <textarea name="pContent" placeholder="Enter Your content" style="height:200px" class="form-control"></textarea><!-- comment -->
                </div>
              <div class="form-group"><!-- comment -->    
                  <textarea name="pCode" placeholder="Enter Your code here" style="height:100px" class="form-control"></textarea><!-- comment -->
                </div>
              <div class="form-group"><!-- comment -->    
                  <label>Select your pic..</label>
                  <br><!-- comment -->
                  <input name="pPic" type="file" ><!-- comment -->
                </div>

      </div>
      <div class="modal-footer container text-center">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="submit" class=" btn btn-primary">Post</button>
      </div>
                        </form>
    </div> 
  </div>
</div>
   <!--end post modal-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
         <script
            src="https://code.jquery.com/jquery-3.4.1.min.js"
            integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
        crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <!--<script src="js/myjs.js" type="text/javascript"></script>-->
    <script>
        $(document).ready(function(){
            let edit=false;
            $('#edit-profile-button').click(function(){
                if(edit==false){
                   
            $('#profile-details').hide();
            $('#profile-edit').show();
            edit=true;
            $(this).text("Back");
        }else{
            
           $('#profile-details').show();
           $('#profile-edit').hide();  
             $(this).text("Edit");
             edit=false;
        }
            });
        });
    </script>
    
     <script>
            $(document).ready(function () {
                //
                $("#add-post-form").on("submit", function (event) {
                    //this code gets called when form is submitted....
                    event.preventDefault();
                    console.log("you have clicked on submit..")
                    let form = new FormData(this);

                    //now requesting to server
                    $.ajax({
                        url: "post_servlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            //success ..
                            console.log(data);
                            if (data.trim() == 'done')
                            {
                                swal("Good job!", "saved successfully", "success");
                            } else
                            {
                                swal("Error!!", "Something went wrong try again...", "error");
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            //error..
                            swal("Error!!", "Something went wrong try again...", "error");
                        },
                        processData: false,
                        contentType: false
                    });
                });
            });
        </script>
        

    </body>
</html>
