package no.amv.api;

import no.amv.database.models.Equipment;
import no.amv.database.models.Reservation;
import no.amv.database.models.UserReservation;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;

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

        var reservations = UserReservation.getByUserId(1);
        req.setAttribute("reservations", reservations);
        req.getRequestDispatcher("reservations/list.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        var newParam = req.getParameter("new");
        if (newParam != null) {
            var newId = Integer.parseInt(newParam);
            var date = Date.valueOf(req.getParameter("date"));
            new Reservation(0, 1, newId, date, null).save();
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
