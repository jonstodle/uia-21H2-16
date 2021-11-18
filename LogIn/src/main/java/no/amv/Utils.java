package no.amv;

import no.amv.database.models.User;

import javax.servlet.http.HttpServletRequest;

public class Utils {
    public static User getUser(HttpServletRequest req) {
        var user = req.getAttribute("user");
        if (user == null) {
            return null;
        }
        return (User) user;
    }
}
