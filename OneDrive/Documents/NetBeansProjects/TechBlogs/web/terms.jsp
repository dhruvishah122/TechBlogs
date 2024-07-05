<%-- 
    Document   : terms
    Created on : 27 Apr 2024, 11:54:17 am
    Author     : dhruv
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Agree terms & Conditions</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<style>
body {
	font-family: 'Varela Round', sans-serif;
}
.modal-confirm {	
	color: #8e8e8e;
	width: 450px;
}
.modal-confirm .modal-content {
	padding: 20px;
	border-radius: 5px;		
	border: none;
}
.modal-confirm .modal-header {
	border-bottom: none;   
	position: relative;
	justify-content: center;
	border-radius: 5px 5px 0 0;
}
.modal-confirm h4 {
	color: #545557;
	text-align: center;
	font-size: 30px;
	margin: 0 0 25px;
}
.modal-confirm .form-control, .modal-confirm .btn {
	min-height: 40px;
	border-radius: 3px; 
}
.modal-confirm .close {
	background: #c0c3c8;
	position: absolute;
	top: 15px;
	right: 15px;
	color: #fff;
	text-shadow: none;
	opacity: 0.5;
	width: 30px;
	height: 30px;
	padding: 0;
	border-radius: 20px;
	font-size: 16px;
}
.modal-confirm .close:hover {
	opacity: 0.8;
}
.modal-confirm .icon-box {
	color: #f95858;		
	display: inline-block;
	z-index: 9;
	text-align: center;
	position: relative;
	transform: scale(1.5);
}
.modal-confirm .icon-box i:first-child {
	font-size: 100px;
}
.modal-confirm .icon-box i:nth-child(2) {
	font-size: 138px;
	position: absolute;
	left: -19px;
	top: -23px;
	font-weight: bold;
	color: #fff;
}
.modal-confirm .icon-box i:last-child {
	font-size: 26px;
	position: absolute;
	left: 0;
	right: 0;
	margin: 0 auto;
	top: 44px;
}
.modal-confirm .btn {
	color: #fff;
	border-radius: 4px;
	background: #eeb711;
	text-decoration: none;
	transition: all 0.4s;
	line-height: normal;
	border-radius: 3px;
	margin: 30px 0 20px;
	padding: 6px 20px;
	min-width: 150px;
	border: none;
}
.modal-confirm .btn:hover, .modal-confirm .btn:focus {
	background: #eda645;
	outline: none;
}
.trigger-btn {
	display: none; /* Hide the trigger button */
}
</style>
</head>
<body>

<!-- Modal HTML -->
<div id="myModal" class="modal fade">
	<div class="modal-dialog modal-confirm">
		<div class="modal-content">
			<div class="modal-header">
				<div class="icon-box">
					<i class="material-icons">&#xE86B;</i>
					<i class="material-icons">&#xE86B;</i>
					<i class="material-icons">&#xE645;</i>
				</div>
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span>&times;</span></button>
			</div>
			<div class="modal-body text-center">
				<h4>please Agree terms & Conditions</h4>	
				<p>You haven't agreed terms & Conditions. please check it and try again!!</p>
				<a class="btn btn-primary" href='register_page.jsp'>Go Back</a>
			</div>
		</div>
	</div>
</div>

<script>
// Show the modal when the page loads
$(document).ready(function(){
    $('#myModal').modal('show');
});
</script>
</body>
</html>
