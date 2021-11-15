package no.amv.api;

import no.amv.database.models.Session;
import no.amv.database.models.User;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Timestamp;
import java.time.LocalDateTime;

public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        var logoutParam = req.getParameter("logout");
        if (logoutParam != null) {
            req.getRequestDispatcher("login/logout.jsp").forward(req, resp);
            return;
        }

        req.getRequestDispatcher("login/login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        var logoutParam = req.getParameter("logout");
        if (logoutParam != null) {
            var user = (User) req.getAttribute("user");

            var session = Session.getByUserId(user.getId());
            session.delete();

            resp.sendRedirect("/amv/login");
            return;
        }

        var username = req.getParameter("username");
        var password = req.getParameter("password");
        if (username == null || username == "" || password == null || password == "") {
            resp.sendRedirect("/amv/login?failed");
            return;
        }

        var user = User.getByUsername(username);
        if (user == null) {
            resp.sendRedirect("/amv/login?failed");
            return;
        }

        if (!user.isValidPassword(password)) {
            resp.sendRedirect("/amv/login?failed");
            return;
        }

        var session = new Session(Session.generateId(), user.getId(), Timestamp.valueOf(LocalDateTime.now().plusDays(30)));
        session.save();

        var cookie = new Cookie("amv-session", session.getId());
        cookie.setHttpOnly(true);
        cookie.setSecure(true);
        cookie.setMaxAge(30 * 24 * 60 * 60); // 30 days

        resp.addCookie(cookie);
        resp.sendRedirect("/amv/equipment");
    }
}
