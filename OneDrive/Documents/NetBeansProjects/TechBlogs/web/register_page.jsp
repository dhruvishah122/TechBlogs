<%-- 
    Document   : register_page
    Created on : 25 Apr 2024, 10:14:14 pm
    Author     : dhruv
--%>

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
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 91%, 63% 100%, 22% 91%, 0 99%, 0 0);
               
            }body{
      background-image:url("pics/tom_1.jpg");
       background-size: cover;
            background-attachment: fixed;
 }
        </style>
        <title>Register Page</title>
    </head>
    <body>
       <%@include file="normal_navbar.jsp"%>
       <main class=" banner-background" style="padding-bottom:50px; padding-top:30px;">
           
           <div class="container">
               <div class="col-md-6 offset-md-3">
                   <div class="card">
                       <div class="card-header text-center">
                           <span class="fa fa-user-circle-o fa-3x"></span> <br>
                           <h4>Register here</h4> 
                       </div>
                         <div class="card-body">
                             
                           <form id=reg-form action="register_servlet" method="post">
      <div class="form-group">
    <label for="user_name">Username</label>
    <input type="text" name="user_name" placeholder="enter username" class="form-control" id="username" aria-describedby="emailHelp">
    <!--<small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>-->
  </div>
                               
  <div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input type="email" name="user_email" placeholder="enter email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
    <!--<small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>-->
  </div>
                               
                               
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input type="password" name="user_password" placeholder="enter password" class="form-control" id="exampleInputPassword1">
  </div>
   
     <div class="form-group">
    <label for="gender">Select gender</label>
    <br>
    <input type="radio" id="gender" name="gender" value="female">Female 
     <input type="radio" id="gender" name="gender"vallue="male">Male
     <br>
     <textarea name="about" rows="3" class="form-control" placeholder="Enter something about yourself"></textarea>
  </div>
                               
  <div class="form-group form-check">
    <input type="checkbox"  name="check" class="form-check-input" id="exampleCheck1">
    <label class="form-check-label" for="exampleCheck1">Agree terms and conditions</label>
  </div>
   <div class="container text-center" id="loader" style="display: none;">
                                    <span class="fa fa-refresh fa-spin fa-4x"></span>
                                    <h4>Please wait..</h4>
                                </div>                            
                                 
                               
  <button type="submit" id="sumbimt-btn" class="btn btn-primary">Submit</button>
</form>
                       </div>
                       
                   </div>  
               </div>
           </div>
       </main>
        
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/yourcode.js" crossorigin="anonymous"></script>  
   
    <!--js-->
    
      <!--javascripts-->
        <script
            src="https://code.jquery.com/jquery-3.4.1.min.js"
            integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
        crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>;      
        <script>
            $(document).ready(function () {
                console.log("loaded........");

                $('#reg-form').on('submit', function (event) {
                    



                    let form = new FormData(this);
                    //window.location = "register_page.jsp";
                    //event.preventDefault();
                   // event.stopPropagation();
                  
                    $("#sumbimt-btn").hide();
                    $("#loader").show();
                    //send register servlet:
                    $.ajax({
                        url: "register_servlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            console.log(data);

                            $("#sumbimt-btn").show();
                            $("#loader").hide();

                            if (data.trim() === 'done...')
                            {

                             // swal("Good job!", "You have Registered!We are going to redirect to login page", "success");
                       
            swal("Registered successfully..We are going to redirect to login page")
                                        .then((value) => {
                                            window.location = "login_page.jsp";
                                        });
                            } else
                            {

                                //swal(data);
                            }

                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            $("#sumbimt-btn").show();
                            $("#loader").hide();
                           // swal("something went wrong..try again");

                        },
                        processData: false,
                        contentType: false

                    });



                });


            });



        </script>
    
    
    
    </body>
</html>
