package no.amv.database.models;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Reservation extends ModelBase {
    int id;
    int userId;
    int equipmentId;
    Date startDate;
    Date returnedDate;

    public Reservation(int id, int userId, int equipmentId, Date startDate, Date returnedDate) {
        this.id = id;
        this.userId = userId;
        this.equipmentId = equipmentId;
        this.startDate = startDate;
        this.returnedDate = returnedDate;
    }

    public void save() {
        execute("""
                        replace into reservations (id, user_id, equipment_id, start_date, returned_date)
                        values (?, ?, ?, ?, ?)
                        """,
                (stmt) -> {
                    stmt.setInt(1, this.id);
                    stmt.setInt(2, this.userId);
                    stmt.setInt(3, this.equipmentId);
                    stmt.setDate(4, this.startDate);
                    stmt.setDate(5, this.returnedDate);
                });
    }

    public static ArrayList<Reservation> getList() {
        return select("""
                        select *
                        from reservations
                        """,
                Reservation::from);
    }

    public static Reservation getById(int id) {
        return get("""
                        select *
                        from reservations
                        where id = ?
                        limit 1
                        """,
                (stmt) -> stmt.setInt(1, id),
                Reservation::from);
    }

    public static ArrayList<Reservation> getByUserId(int id) {
        return select("""
                        select *
                        from reservations
                        where user_id = ?
                        """,
                (stmt) -> stmt.setInt(1, id),
                Reservation::from);
    }

    private static Reservation from(ResultSet rs) throws SQLException {
        return new Reservation(
                rs.getInt(1),
                rs.getInt(2),
                rs.getInt(3),
                rs.getDate(4),
                rs.getDate(5)
        );
    }
}
