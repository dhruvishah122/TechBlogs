/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.tech.blog.servlets;

import com.tech.blog.dao.postdao;
import com.tech.blog.entities.posts;
import com.tech.blog.entities.user;
import com.tech.blog.helper.connectionprovider;
import com.tech.blog.helper.helper;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.Timestamp;
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

/**
 *
 * @author dhruv
 */
@MultipartConfig
public class post_servlet extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
////            out.println("<!DOCTYPE html>");
////            out.println("<html>");
////            out.println("<head>");
////            out.println("<title>Servlet post_servlet</title>");            
////            out.println("</head>");
////            out.println("<body>");
            String pTitle =request.getParameter("pTitle");
           
          int cid=Integer.parseInt(request.getParameter("cid")); 
            String pContent=request.getParameter("pContent");
            String pCode=request.getParameter("pCode");
            Part part=request.getPart("pPic");
            HttpSession s=request.getSession();
               
           user user=(user)s.getAttribute("currentUser");
            posts p=new posts( pTitle,  pContent,  pCode,  part.getSubmittedFileName(), cid,user.getId());
              p.setpPic( part.getSubmittedFileName());
//out.println(pTitle+" "+pContent+" "+pCode+" "+user.getId());
               String path=request.getRealPath("/")+"pics"+File.separator+ p.getpPic();
                helper.savefile(part.getInputStream(), path);
           postdao dao=new postdao(connectionprovider.getConnection());
           // out.println(cid+" "+pTitle+" "+pContent+" "+pCode+" "+user.getId());
//           
                if(dao.savePost(p))
                out.println("done");
            
            else
                out.println("error");
//            out.println("</body>"); 
//            out.println("</html>");
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
            Logger.getLogger(post_servlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(post_servlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(post_servlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(post_servlet.class.getName()).log(Level.SEVERE, null, ex);
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
