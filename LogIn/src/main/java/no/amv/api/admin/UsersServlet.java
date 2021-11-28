package no.amv.api.admin;

import no.amv.database.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@MultipartConfig
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

        var importParam = req.getParameter("import");
        if (importParam != null) {
            req.getRequestDispatcher("users/import.jsp").forward(req, resp);
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
            var user = new User(0, "", "", "", User.generateSalt(), false);

            if (!editParam.equals("")) {
                var editId = Integer.parseInt(editParam);
                user = User.getById(editId);
            }

            user.setName(req.getParameter("name"));
            user.setEmail(req.getParameter("email"));

            var isAdmin = req.getParameter("isAdmin");
            user.setAdmin(isAdmin != null && isAdmin.equals("true"));

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

        var importParam = req.getParameter("import");
        if (importParam != null) {
            var filePart = req.getPart("file");
            new String(filePart.getInputStream().readAllBytes())
                    .lines()
                    .map(l -> {
                        var split = l.split(",");
                        var user = new User(
                                0,
                                split[0],
                                split[1],
                                split[2],
                                User.generateSalt(),
                                false
                        );
                        user.setPassword(split[2]);
                        return user;
                    })
                    .forEach(User::save);

            resp.sendRedirect("/amv/admin/users");
            return;
        }

        resp.sendRedirect("/amv/admin/users");
    }
}
