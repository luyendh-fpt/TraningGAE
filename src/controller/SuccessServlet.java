package controller;

import com.googlecode.objectify.ObjectifyService;
import entity.Account;
import static com.googlecode.objectify.ObjectifyService.ofy;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class SuccessServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/success.jsp").forward(req, resp);
        Account account = (Account)req.getAttribute("account");

        resp.getWriter().print(ofy().load().type(Account.class).first().now().getFullname());
    }
}
