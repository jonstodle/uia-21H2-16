package no.amv.filters;

import no.amv.database.models.Session;
import no.amv.database.models.User;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Arrays;

public class AuthFilter extends HttpFilter {
    @Override
    protected void doFilter(HttpServletRequest req, HttpServletResponse res, FilterChain chain) throws IOException, ServletException {
        var user = getUser(req);
        if (isOpenPath(req) || user != null) {
            req.setAttribute("user", user);
            chain.doFilter(req, res);
        } else {
            res.sendRedirect("/amv/login");
        }
    }

    boolean isOpenPath(HttpServletRequest req) throws MalformedURLException {
        var url = new URL(req.getRequestURL().toString());
        return url.getPath().startsWith("/amv/static") || url.getPath().startsWith("/amv/login");
    }

    User getUser(HttpServletRequest req) {
        var cookies = req.getCookies();
        if (cookies == null) {
            return null;
        }

        var cookieMaybe = Arrays.stream(cookies).filter(c -> c.getName().equals("amv-session")).findFirst();
        if (cookieMaybe.isEmpty()) {
            return null;
        }

        var sessionId = cookieMaybe.get().getValue();
        var session = Session.getById(sessionId);
        if (session == null) {
            return null;
        }

        return User.getById(session.getUserId());
    }
}
