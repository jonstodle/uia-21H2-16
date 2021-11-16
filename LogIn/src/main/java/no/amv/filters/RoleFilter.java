package no.amv.filters;

import no.amv.database.models.User;
import no.amv.database.models.UserRole;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class RoleFilter extends HttpFilter {
    @Override
    protected void doFilter(HttpServletRequest req, HttpServletResponse res, FilterChain chain) throws IOException, ServletException {
        var role = getInitParameter("role");
        var user = req.getAttribute("user");

        if (user != null &&
                UserRole.getByUserId(((User) user).getId()).stream().anyMatch(ur -> ur.getName().equals(role))) {
            chain.doFilter(req, res);
        } else {
            res.sendError(401);
        }
    }
}
