package no.amv.api.admin;

import no.amv.database.models.Reservation;
import no.amv.database.models.User;
import no.amv.database.models.UserReservation;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.stream.Collectors;

public class SettlementsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        var users = User.getWithUnsettledReservations();
        req.setAttribute("users", users);

        var reservations = new HashMap<Integer, ArrayList<UserReservation>>();
        for (var user : users) {
            var userReservations = UserReservation.getByUserId(user.getId()).stream()
                    .filter(ur -> ur.getPaidDate() == null)
                    .collect(Collectors.toCollection(ArrayList::new));
            reservations.put(user.getId(), userReservations);
        }
        req.setAttribute("reservations", reservations);

        req.getRequestDispatcher("settlements/list.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        var singleParam = req.getParameter("single");
        if (singleParam != null) {
            var singleId = Integer.parseInt(singleParam);
            Reservation.getById(singleId).markAsPaid();
        }

        var allParam = req.getParameter("all");
        if (allParam != null) {
            var allId = Integer.parseInt(allParam);
            var user = User.getById(allId);
            Reservation.getByUserId(user.getId()).stream()
                    .filter(r -> r.getPaidDate() == null)
                    .forEach(Reservation::markAsPaid);
        }

        resp.sendRedirect("/amv/admin/settlements");
    }
}
