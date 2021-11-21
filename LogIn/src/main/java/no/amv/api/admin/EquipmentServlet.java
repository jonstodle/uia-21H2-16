package no.amv.api.admin;

import no.amv.database.models.Equipment;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class EquipmentServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        var editParam = req.getParameter("edit");
        if (editParam != null) {
            if (editParam != "") {
                var editId = Integer.parseInt(editParam);
                var equipment = Equipment.getById(editId);
                req.setAttribute("equipment", equipment);
            }
            req.getRequestDispatcher("equipment/edit.jsp").forward(req, resp);
            return;
        }

        var deleteParam = req.getParameter("delete");
        if (deleteParam != null) {
            var deleteId = Integer.parseInt(deleteParam);
            var equipment = Equipment.getById(deleteId);
            req.setAttribute("equipment", equipment);
            req.getRequestDispatcher("equipment/delete.jsp").forward(req, resp);
            return;
        }

        var equipment = Equipment.getList();
        req.setAttribute("equipment", equipment);
        req.getRequestDispatcher("equipment/list.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        var editParam = req.getParameter("edit");
        if (editParam != null) {
            var equipment = new Equipment(0, "", 1, -1, 3, 3, null);

            if (editParam != "") {
                var editId = Integer.parseInt(editParam);
                equipment = Equipment.getById(editId);
            }

            equipment.setName(req.getParameter("name"));
            equipment.setCategory(Integer.parseInt(req.getParameter("category")));
            equipment.setRentStartDay(Integer.parseInt(req.getParameter("rent-starts-on-day")));
            equipment.setMaxRentalDays(Integer.parseInt(req.getParameter("max-rental-days")));
            equipment.setComment(req.getParameter("comment"));

            var newPrice = -1;
            try {
                newPrice = Integer.parseInt(req.getParameter("price")) * 100;
            } catch (Exception e) {
            }
            equipment.setPrice(newPrice);

            equipment.save();

            resp.sendRedirect("/amv/admin/equipment");
            return;
        }

        var deleteParam = req.getParameter("delete");
        if (deleteParam != null) {
            var deleteId = Integer.parseInt(deleteParam);
            var equipment = Equipment.getById(deleteId);
            equipment.delete();
        }

        resp.sendRedirect("/amv/admin/equipment");
    }
}
