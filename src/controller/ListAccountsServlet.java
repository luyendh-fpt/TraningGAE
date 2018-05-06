package controller;

import com.googlecode.objectify.Objectify;
import com.googlecode.objectify.ObjectifyService;
import entity.Account;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class ListAccountsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int limit = 10, page = 1, count, totalPage;
        if (req.getParameter("limit")!=null) {
            try {
                limit = Integer.parseInt(req.getParameter("limit"));
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        if (req.getParameter("page")!=null) {
            try {
                page = Integer.parseInt(req.getParameter("page"));
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        count = ObjectifyService.ofy().load().type(Account.class).count();

        totalPage = (int) Math.ceil((double)count/(double)limit);

        req.setAttribute("page", page);
        req.setAttribute("limit", limit);
        req.setAttribute("totalPage", totalPage);

        List<Account> listAcc = ObjectifyService.ofy().load().type(Account.class).limit(limit).offset(limit*(page-1)).list();
        req.setAttribute("accounts", listAcc);

        req.getRequestDispatcher("/accounts.jsp").forward(req, resp);
    }
}
