package no.amv.api;

import no.amv.database.models.Lease;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@MultipartConfig
public class LeasesServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        var uploadParam = req.getParameter("upload");
        if (uploadParam != null) {
            req.getRequestDispatcher("leases/upload.jsp").forward(req, resp);
            return;
        }

        var downloadParam = req.getParameter("download");
        if (downloadParam != null) {
            var downloadId = Integer.parseInt(downloadParam);
            var lease = Lease.getById(downloadId);

            resp.setContentType("application/octet-stream");
            resp.setHeader("Content-Disposition", "attachement: filename=\"" + lease.getName() + "\"");
            resp.getOutputStream().write(lease.getData());

            return;
        }

        var deleteParam = req.getParameter("delete");
        if (deleteParam != null) {
            var deleteId = Integer.parseInt(deleteParam);
            var lease = Lease.getById(deleteId);

            req.setAttribute("lease", lease);
            req.getRequestDispatcher("leases/delete.jsp").forward(req, resp);
            return;
        }

        var leases = Lease.getList();
        req.setAttribute("leases", leases);
        req.getRequestDispatcher("leases/list.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        var uploadParam = req.getParameter("upload");
        if (uploadParam != null) {
            var filePart = req.getPart("file");
            var filename = filePart.getSubmittedFileName();
            var fileStream = filePart.getInputStream().readAllBytes();

            new Lease(0, filename, fileStream).save();

            resp.sendRedirect("/amv/leases");
            return;
        }

        var deleteParam = req.getParameter("delete");
        if (deleteParam != null) {
            var deleteId = Integer.parseInt(deleteParam);
            var lease = Lease.getById(deleteId);
            lease.delete();
            resp.sendRedirect("/amv/leases");
            return;
        }
    }
}
