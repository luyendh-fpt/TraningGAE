package controller;

import com.googlecode.objectify.ObjectifyService;
import entity.Account;

import javax.servlet.*;
import java.io.IOException;
import java.util.logging.Filter;

public class MyFilter implements javax.servlet.Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        ObjectifyService.register(Account.class);
        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {

    }
}
