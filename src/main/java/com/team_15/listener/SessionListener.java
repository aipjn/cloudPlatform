package com.team_15.listener;

import com.team_15.pojo.User;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.*;
import java.util.HashSet;
import java.util.Set;

@WebListener()
public class SessionListener implements ServletContextListener, HttpSessionListener {
    private ServletContext context = null;

    // Public constructor is required by servlet spec
    public SessionListener() {
    }

    // -------------------------------------------------------
    // ServletContextListener implementation
    // -------------------------------------------------------
    public void contextInitialized(ServletContextEvent sce) {
      /* This method is called when the servlet context is
         initialized(when the Web application is deployed). 
         You can initialize servlet context related data here.
      */
      System.out.println("contextInitialized");
      context = sce.getServletContext();
      Set<String> onlineUsers = new HashSet<String>();
      context.setAttribute("onlineUsers", onlineUsers);
    }

    public void contextDestroyed(ServletContextEvent sce) {
      /* This method is invoked when the Servlet Context 
         (the Web application) is undeployed or 
         Application Server shuts down.
      */
    }

    // -------------------------------------------------------
    // HttpSessionListener implementation
    // -------------------------------------------------------
    public void sessionCreated(HttpSessionEvent se) {
        /* Session is created. */
    }

    public void sessionDestroyed(HttpSessionEvent se) {
        /* Session is destroyed. */
        HttpSession session = se.getSession();
        if(session.getAttribute("user") != null){
            Set<String> onlineUsers = (Set<String>)context.getAttribute("onlineUsers");
            onlineUsers.remove(((User)session.getAttribute("user")).getName());
            context.setAttribute("onlineUsers", onlineUsers);
            System.out.println(onlineUsers.toString());
        }
    }

}
