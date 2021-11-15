package no.amv.database.models;

import java.security.SecureRandom;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.Instant;
import java.util.Base64;

public class Session extends ModelBase {
    String id;
    int userId;
    Timestamp expiresAt;

    public Session(String id, int userId, Timestamp expiresAt) {
        this.id = id;
        this.userId = userId;
        this.expiresAt = expiresAt;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public Timestamp getExpiresAt() {
        return expiresAt;
    }

    public void setExpiresAt(Timestamp expiresAt) {
        this.expiresAt = expiresAt;
    }

    public void save() {
        execute(String.join(" ",
                        "insert into sessions (id, user_id, expires_at)",
                        "values (?, ? ,?)"
                ),
                (stmt) -> {
                    stmt.setString(1, this.id);
                    stmt.setInt(2, this.userId);
                    stmt.setTimestamp(3, this.expiresAt);
                });
    }

    public void delete() {
        execute(String.join(" ",
                        "delete from sessions",
                        "where id = ?"
                ),
                (stmt) -> stmt.setString(1, this.id));
    }

    public static Session getById(String id) {
        var session = get(String.join(" ",
                        "select *",
                        "from sessions",
                        "where id = ?"
                ),
                (stmt) -> stmt.setString(1, id),
                Session::from);
        if (session != null && session.expiresAt.before(Timestamp.from(Instant.now()))) {
            session.delete();
            session = null;
        }

        return session;
    }

    public static Session getByUserId(int id) {
        return get(String.join(" ",
                        "select *",
                        "from sessions",
                        "where user_id = ?"
                ),
                (stmt) -> stmt.setInt(1, id),
                Session::from);
    }

    public static String generateId() {
        var bytes = new byte[18];
        var secureRandom = new SecureRandom();
        secureRandom.nextBytes(bytes);
        return Base64.getEncoder().encodeToString(bytes);
    }

    private static Session from(ResultSet rs) throws SQLException {
        return new Session(
                rs.getString(1),
                rs.getInt(2),
                rs.getTimestamp(3)
        );
    }
}
