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
        if (this.id > 0) {
            // Not needed?
        } else {
            execute(String.join(" ",
                            "insert into reservations (user_id, equipment_id, start_date, returned_date)",
                            "values (?, ?, ?, ?)"
                    ),
                    (stmt) -> {
                        stmt.setInt(1, this.userId);
                        stmt.setInt(2, this.equipmentId);
                        stmt.setDate(3, this.startDate);
                        stmt.setDate(4, this.returnedDate);
                    });
        }
    }

    public void returnEquipment() {
        execute(String.join(" ",
                        "update reservations",
                        "set",
                        "    returned_date = now()",
                        "where id = ?"
                ),
                (stmt) -> stmt.setInt(1, this.id));
    }

    public static ArrayList<Reservation> getList() {
        return select(String.join(" ",
                        "select *",
                        "from reservations"
                ),
                Reservation::from);
    }

    public static Reservation getById(int id) {
        return get(String.join(" ",
                        "select *",
                        "from reservations",
                        "where id = ?",
                        "limit 1"
                ),
                (stmt) -> stmt.setInt(1, id),
                Reservation::from);
    }

    public static ArrayList<Reservation> getByUserId(int id) {
        return select(String.join(" ",
                        "select *",
                        "from reservations",
                        "where user_id = ?"
                ),
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
