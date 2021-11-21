package no.amv.api;

import no.amv.Utils;
import no.amv.database.models.Equipment;
import no.amv.database.models.Reservation;
import no.amv.database.models.UserReservation;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.time.Duration;

public class ReservationsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        var newParam = req.getParameter("new");
        if (newParam != null) {
            var newId = Integer.parseInt(newParam);
            var equipment = Equipment.getById(newId);
            req.setAttribute("equipment", equipment);
            req.getRequestDispatcher("reservations/new.jsp").forward(req, resp);
            return;
        }

        var user = Utils.getUser(req);
        var reservations = UserReservation.getByUserId(user.getId());
        req.setAttribute("reservations", reservations);
        req.getRequestDispatcher("reservations/list.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        var newParam = req.getParameter("new");
        if (newParam != null) {
            var newId = Integer.parseInt(newParam);
            var fromDate = Date.valueOf(req.getParameter("from-date"));
            var toDate = Date.valueOf(req.getParameter("to-date"));
            var user = Utils.getUser(req);
            var equipment = Equipment.getById(newId);

            if (toDate.before(fromDate)) {
                resp.sendRedirect("/amv/reservations?error=To+date+must+be+same+day+or+after+from+date&new=" + newParam);
                return;
            } else if (Duration.between(fromDate.toLocalDate().atStartOfDay(), toDate.toLocalDate().atStartOfDay()).toDays() > equipment.getMaxRentalDays()) {
                resp.sendRedirect("/amv/reservations?error=Can+not+rent+equipment+for+this+long&new=" + newParam);
                return;
            }

            new Reservation(0, user.getId(), newId, fromDate, toDate, null).save();
            resp.sendRedirect("/amv/reservations");
            return;
        }

        var returnParam = req.getParameter("return");
        if (returnParam != null) {
            var returnId = Integer.parseInt(returnParam);
            var reservation = Reservation.getById(returnId);
            reservation.returnEquipment();
            resp.sendRedirect("/amv/reservations");
            return;
        }
    }
}
