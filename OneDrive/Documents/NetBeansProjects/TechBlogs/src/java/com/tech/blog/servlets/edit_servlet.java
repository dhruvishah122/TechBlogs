/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.tech.blog.servlets;

import com.tech.blog.dao.userdao;
import com.tech.blog.entities.message;
import com.tech.blog.entities.user;
import com.tech.blog.helper.connectionprovider;
import com.tech.blog.helper.helper;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import org.apache.catalina.User;

/**
 *
 * @author dhruv
 */
@MultipartConfig
public class edit_servlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet edit_servlet</title>");            
            out.println("</head>");
            out.println("<body>");
            
            String name=request.getParameter("user_name");
            String email=request.getParameter("user_email");
           // String password=request.getParameter("user_password");
            String about=request.getParameter("about");
            Part part=request.getPart("image");
            String imageName=part.getSubmittedFileName();
            
            HttpSession s = request.getSession();
            
            user u =(user) s.getAttribute("currentUser");
            u.setName(name);
            u.setEmail(email);
//            if(password!="null")
//            u.setPassword(password);
            u.setAbout(about);
            String old=u.getProfile();
            u.setProfile(imageName);
            userdao userdao=new userdao(connectionprovider.getConnection());
            boolean ans=userdao.updateUser(u);
            if(ans){
                String path=request.getRealPath("/")+"pics"+File.separator+u.getProfile();
                String oldfile=request.getRealPath("/")+"pics"+File.separator+old;
//               if(!old.equals("default.png"))
//                helper.deletefile(oldfile);
                    if(helper.savefile(part.getInputStream(), path)){
                        out.println("details updated...");
                         message msg=new message("Profile details updated...!!","success","alert-success");
               
               HttpSession h=request.getSession();
               h.setAttribute("msg",msg);
             
                    }else{
                        out.println("not saved...");
                         message msg=new message("Something went wrong!!","error","alert-danger");
               
               HttpSession h=request.getSession();
               h.setAttribute("msg",msg);
              
                    }
                    response.sendRedirect("profile.jsp");
               // }
                
            }
            else
            {
                 out.println("not saved...");
                         message msg=new message("Something went wrong!!","error","alert-danger");
               
               HttpSession h=request.getSession();
               h.setAttribute("msg",msg);
            }
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(edit_servlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(edit_servlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(edit_servlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(edit_servlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
