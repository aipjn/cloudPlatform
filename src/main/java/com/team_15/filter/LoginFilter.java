package com.team_15.filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class LoginFilter implements Filter {

    public void destroy() {
    }

    public void doFilter(ServletRequest srequest, ServletResponse sresponse,
                         FilterChain chain) throws IOException, ServletException {

        HttpServletRequest request = (HttpServletRequest) srequest;
        HttpServletResponse response = (HttpServletResponse) sresponse;
        HttpSession session = request.getSession();
        // if not login redirect to login page
        if(session.getAttribute("user") == null){
            response.sendRedirect("login");
            return;
        }
        chain.doFilter(srequest, sresponse);
    }

    public void init(FilterConfig config) {
    }

}
