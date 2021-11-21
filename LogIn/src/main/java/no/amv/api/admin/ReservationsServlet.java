package no.amv.api.admin;

import no.amv.database.models.Reservation;
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

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        var markPaidParam = req.getParameter("markPaid");
        if (markPaidParam != null) {
            var markPaidId = Integer.parseInt(markPaidParam);
            var reservation = Reservation.getById(markPaidId);
            reservation.markAsPaid();
        }

        resp.sendRedirect("/amv/admin/reservations");
    }
}
