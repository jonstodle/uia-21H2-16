package no.amv.api;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class EquipmentServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        var equipment = no.amv.database.models.Equipment.getList();
        req.setAttribute("equipment", equipment);
        req.getRequestDispatcher("equipment.jsp").forward(req, resp);
    }
}
