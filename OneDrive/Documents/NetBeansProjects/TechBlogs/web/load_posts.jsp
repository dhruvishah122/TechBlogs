<%-- 
    Document   : load_posts
    Created on : 30 Apr 2024, 11:09:48 pm
    Author     : dhruv
--%>

<%@page import="com.tech.blog.entities.user"%>
<%@page import="java.util.Arrays"%>
<%@page import="com.tech.blog.dao.likedao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.posts"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.dao.postdao"%>
<%@page import="com.tech.blog.helper.connectionprovider"%>
<script language="JavaScript" type="text/javascript" src="/js/doLike.js"></script>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <style>
         body{
            background: url(pics/tom_1.jpg);
            background-size: cover;
            background-attachment: fixed;
        }
        </style>
    </head>
</html>
<div class="row">
<%
       user uuu=(user)session.getAttribute("currentUser");
      
    Thread.sleep(500);
postdao d=new postdao(connectionprovider.getConnection());
int cid=Integer.parseInt(request.getParameter("cid"));
List<posts> posts=new ArrayList<>();
if(cid==0)
 posts=d.getallposts();
else
posts=d.getallpostsbycatid(cid);

if(posts.size()==0){
    out.println("<h3 class='display-3 text-center text-white'>No Posts in this category...</h3>");
    return;
    }
for(posts p:posts){   

%>

<div class="col-md-6 mt-2">
    <div class="card">
           <img class="card-img-top" src="pics/<%=p.getpPic()%>" alt="Card image cap">
        <div class="card-body">
          
            <b><%=p.getTitle() %></b>
           
            <!--<p><%= truncateContent(p.getpContent(), 10)%></p>-->
          
            <!--<p><%= p.getpContent()%></p>-->
            <!--<pre><%= p.getpCode()%></pre>-->
            
        </div>
                  
            <div class="card-footer text-center " style='background-color: #161F6D;'>
                <% 
                    likedao ld = new likedao(connectionprovider.getConnection());
                %>
                <a href="show_post.jsp?post_id=<%= p.getPid()%>" class="btn btn-outline-light btn">Read more..</a>
                <a href="#!" onclick="doLike(<%= p.getPid()%>,<%= uuu.getId()%>)" class="btn btn-outline-light btn"> <i class="fa fa-thumbs-o-up"></i> <span class="like-counter"><%= ld.countLikeOnPost(p.getPid())%></span>  </a>

                <a href="#" class="btn btn-outline-light btn"><i class="fa fa-commenting-o"></i><span> 20</span></a>
            </div>
    </div>   
</div>
<% }%>

</div>
<%!
        // Function to truncate content to specified number of words
        public String truncateContent(String content, int wordLimit) {
            String[] words = content.split("\\s+");
            if (words.length > wordLimit) {
                return String.join(" ", Arrays.copyOfRange(words, 0, wordLimit)) + "...";
            } else {
                return content;
            }
        }
    %>