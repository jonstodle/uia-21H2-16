package no.amv.database.models;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class User extends ModelBase {
    int id;
    String name;
    String email;
    String password;

    public User(int id, String name, String email, String password) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.password = password;
    }

    public void save() {
        execute(String.join(" ",
                        "replace into users (id, name, email, password)",
                        "values (?, ?, ?, ?)"
                ),
                (stmt) -> {
                    stmt.setInt(1, this.id);
                    stmt.setString(2, this.name);
                    stmt.setString(3, this.email);
                    stmt.setString(4, this.password);
                });
    }

    public static ArrayList<User> getList() {
        return select(String.join(" ",
                        "select *",
                        "from users"
                ),
                User::from);
    }

    public static User getById(int id) {
        return get(String.join(" ",
                        "select *",
                        "from users",
                        "where id = ?",
                        "limit 1"
                ),
                (stmt) -> stmt.setInt(1, id),
                User::from);
    }

    private static User from(ResultSet rs) throws SQLException {
        return new User(
                rs.getInt(1),
                rs.getString(2),
                rs.getString(3),
                rs.getString(4)
        );
    }
}
