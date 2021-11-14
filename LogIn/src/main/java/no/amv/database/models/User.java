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

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void save() {
        if (this.id > 0) {
            execute(String.join(" ",
                            "update users",
                            "set",
                            "    name = ?,",
                            "    email = ?,",
                            "    password = ?",
                            "where id = ?"
                    ),
                    (stmt) -> {
                        stmt.setString(1, this.name);
                        stmt.setString(2, this.email);
                        stmt.setString(3, this.password);
                        stmt.setInt(4, this.id);
                    });
        } else {
            execute(String.join(" ",
                            "insert into users (name, email, password)",
                            "values (?, ?, ?)"
                    ),
                    (stmt) -> {
                        stmt.setString(1, this.name);
                        stmt.setString(2, this.email);
                        stmt.setString(3, this.password);
                    });
        }
    }

    public void delete() {
        execute(String.join(" ",
                        "delete from users",
                        "where id = ?"
                ),
                (stmt) -> stmt.setInt(1, this.id));
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
