package no.amv.filters;

import no.amv.database.models.User;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class AdminFilter extends HttpFilter {
    @Override
    protected void doFilter(HttpServletRequest req, HttpServletResponse res, FilterChain chain) throws IOException, ServletException {
        var user = req.getAttribute("user");

        if (user != null && ((User) user).isAdmin()) {
            chain.doFilter(req, res);
        } else {
            res.sendError(401);
        }
    }
}
