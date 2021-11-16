package no.amv.api.admin;

import no.amv.database.models.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class UsersServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        var editParam = req.getParameter("edit");
        if (editParam != null) {
            if (!editParam.equals("")) {
                var editId = Integer.parseInt(editParam);
                var user = User.getById(editId);
                req.setAttribute("user", user);
            }
            req.getRequestDispatcher("users/edit.jsp").forward(req, resp);
            return;
        }

        var deleteParam = req.getParameter("delete");
        if (deleteParam != null) {
            var deleteId = Integer.parseInt(deleteParam);
            var user = User.getById(deleteId);
            req.setAttribute("user", user);
            req.getRequestDispatcher("users/delete.jsp").forward(req, resp);
            return;
        }

        var users = User.getList();
        req.setAttribute("users", users);
        req.getRequestDispatcher("users/list.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        var editParam = req.getParameter("edit");
        if (editParam != null) {
            var user = new User(0, "", "", "", User.generateSalt());

            if (!editParam.equals("")) {
                var editId = Integer.parseInt(editParam);
                user = User.getById(editId);
            }

            user.setName(req.getParameter("name"));
            user.setEmail(req.getParameter("email"));

            var password = req.getParameter("password");
            if (password != null && password.equals("")) {
                user.setPassword(password);
            } else if (user.getPassword().equals("")) {
                // Generate a random password if user has no password,
                // and a new one hasn't been set
                user.setPassword(User.generateSalt());
            }

            user.save();

            resp.sendRedirect("/amv/admin/users");
            return;
        }

        var deleteParam = req.getParameter("delete");
        if (deleteParam != null) {
            var deleteId = Integer.parseInt(deleteParam);
            var user = User.getById(deleteId);
            user.delete();
        }

        resp.sendRedirect("/amv/admin/users");
    }
}
