package controller;

import static com.googlecode.objectify.ObjectifyService.ofy;
import entity.Account;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/login.jsp").forward(req, resp);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        Account acc = ofy().load().type(Account.class).filter("username", username).first().now();
        long id = acc.getId();
        String user = acc.getUsername();
        String pass = acc.getPassword();
        String name = acc.getFullname();
        String addr = acc.getAddress();
        String avatar = acc.getAvatar();

        req.setAttribute("acc", acc);
        if (username.equals(user)){
            if (password.equals(pass)){
                req.getRequestDispatcher("/loginSuccess.jsp").forward(req, resp);
            }
        }else {
            System.out.println("Username or Password wrong!");
        }
    }
}
