package no.amv.database.models;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class UserRole extends ModelBase {
    int id;
    String name;

    public UserRole(int id, String name) {
        this.id = id;
        this.name = name;
    }

    public static ArrayList<UserRole> getByUserId(int id) {
        return select(String.join(" ",
                        "select *",
                        "from user_roles",
                        "where user_id = ?"
                ),
                (stmt) -> stmt.setInt(1, id),
                UserRole::from);
    }

    private static UserRole from(ResultSet rs) throws SQLException {
        return new UserRole(
                rs.getInt(1),
                rs.getString(2)
        );
    }
}
