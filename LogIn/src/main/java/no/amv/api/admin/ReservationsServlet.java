package no.amv.api.admin;

import no.amv.database.models.UserReservation;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ReservationsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        var reservations = UserReservation.getActive();
        req.setAttribute("reservations", reservations);
        req.getRequestDispatcher("reservations/list.jsp").forward(req, resp);
    }
}
