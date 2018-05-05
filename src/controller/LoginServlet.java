package controller;

import static com.googlecode.objectify.ObjectifyService.ofy;

import entity.Account;
import utity.MapError;
import utity.Validate;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;

public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Validate validate = new Validate();

        String username = req.getParameter("username");
        String password = req.getParameter("password");

        String errorUsername = validate.validateUsernameLogin(username);
        String errorrPassword = validate.validatePasswordLogin(password);

        HashMap<String, String> errors = new HashMap<>();
        errors.put("username", errorUsername);
        errors.put("password", errorrPassword);

        HashMap<String, String> valueField = new HashMap<>();
        valueField.put("valueUsername", username);
        valueField.put("valuePassword", password);

        if (!"".equals(errorUsername) || !"".equals(errorrPassword)) {
            req.setAttribute("errors", errors);
        } else {
            Account acc = ofy().load().type(Account.class).filter("username", username).first().now();
            if (acc == null || !password.equals(acc.getPassword())) {
                req.setAttribute("errorLogin", "Username or Password wrong!");
            } else {
                req.setAttribute("acc", acc);
                req.getRequestDispatcher("/loginSuccess.jsp").forward(req, resp);
            }
        }
        req.setAttribute("valueField", valueField);
        req.getRequestDispatcher("/login.jsp").forward(req, resp);
    }
}
