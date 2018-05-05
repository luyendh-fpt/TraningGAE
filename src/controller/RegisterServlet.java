package controller;

import com.googlecode.objectify.ObjectifyService;
import entity.Account;
import utity.Validate;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletInputStream;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.*;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.security.Principal;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

public class RegisterServlet extends HttpServlet {
    Validate validate = new Validate();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.getRequestDispatcher("/register.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String fullname = req.getParameter("fullname");
        String address = req.getParameter("address");
        String avatar = req.getParameter("avatar");

        String errorUsername = validate.validateUsername(username);
        String errorPassword = validate.validatePassword(password);
        String errorFullname = validate.validateFullName(fullname);
        String errorAddress = validate.validateAddress(address);

        HashMap<String, String> valuesField = new HashMap<>();
        valuesField.put("usernameValue", username);
        valuesField.put("passwordValue", password);
        valuesField.put("fullnameValue", fullname);
        valuesField.put("addressValue", address);

        HashMap<String, String> errors = new HashMap<>();
        errors.put("username", errorUsername);
        errors.put("password", errorPassword);
        errors.put("fullname", errorFullname);
        errors.put("address", errorAddress);

        if(errorAddress.equals("") && errorFullname.equals("") && errorUsername.equals("") && errorPassword.equals("")){
            Account account = new Account();
            account.setId(System.currentTimeMillis());
            account.setUsername(username);
            account.setPassword(password);
            account.setFullname(fullname);
            account.setAddress(address);
            account.setAvatar(avatar);

            ObjectifyService.ofy().save().entity(account).now();
            req.setAttribute("account", account);
            req.getRequestDispatcher("/success.jsp").forward(req, resp);
        }else {
            req.setAttribute("maperr", errors);
            req.setAttribute("valuefields", valuesField);
        }

        req.getRequestDispatcher("/register.jsp").forward(req,resp);




    }
}
