package no.amv.database.models;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;

public class User extends ModelBase {
    int id;
    String name;
    String email;
    String password;
    String salt;

    public User(int id, String name, String email, String password, String salt) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.password = password;
        this.salt = salt;
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
        try {
            var md = MessageDigest.getInstance("SHA-512");
            md.update(this.salt.getBytes(StandardCharsets.UTF_8));
            var digest = md.digest(password.getBytes(StandardCharsets.UTF_8));
            this.password = Base64.getEncoder().encodeToString(digest);
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
    }

    public boolean checkPassword(String password) {
        try {
            var md = MessageDigest.getInstance("SHA-512");
            md.update(this.salt.getBytes(StandardCharsets.UTF_8));
            var digest = md.digest(password.getBytes(StandardCharsets.UTF_8));
            return Base64.getEncoder().encodeToString(digest) == this.password;
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            return false;
        }
    }

    public String getSalt() {
        return salt;
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
                            "insert into users (name, email, password, salt)",
                            "values (?, ?, ?, ?)"
                    ),
                    (stmt) -> {
                        stmt.setString(1, this.name);
                        stmt.setString(2, this.email);
                        stmt.setString(3, this.password);
                        stmt.setString(4, this.salt);
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

    public static String generateSalt() {
        var bytes = new byte[16];
        var secureRandom = new SecureRandom();
        secureRandom.nextBytes(bytes);
        return new String(bytes);
    }

    private static User from(ResultSet rs) throws SQLException {
        return new User(
                rs.getInt(1),
                rs.getString(2),
                rs.getString(3),
                rs.getString(4),
                rs.getString(5)
        );
    }
}
