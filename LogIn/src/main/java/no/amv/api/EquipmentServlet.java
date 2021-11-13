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

        var category = req.getParameter("category");
        if (category != null) {
            var categoryInt = Integer.parseInt(category);
            for (int i = equipment.size() - 1; i >= 0; i--) {
                if (equipment.get(i).getCategory() != categoryInt) {
                    equipment.remove(i);
                }
            }
        }

        req.setAttribute("equipment", equipment);
        req.getRequestDispatcher("equipment.jsp").forward(req, resp);
    }
}
