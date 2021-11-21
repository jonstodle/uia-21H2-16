package no.amv.database.models;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class UserReservation extends ModelBase {
    int reservationId;
    String user;
    String equipment;
    Date startDate;
    Date endDate;
    Date returnedDate;

    public UserReservation(int reservationId, String user, String equipment, Date startDate, Date endDate, Date returnedDate) {
        this.reservationId = reservationId;
        this.user = user;
        this.equipment = equipment;
        this.startDate = startDate;
        this.endDate = endDate;
        this.returnedDate = returnedDate;
    }

    public int getReservationId() {
        return reservationId;
    }

    public String getUser() {
        return user;
    }

    public String getEquipment() {
        return equipment;
    }

    public void setEquipment(String equipment) {
        this.equipment = equipment;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public Date getReturnedDate() {
        return returnedDate;
    }

    public void setReturnedDate(Date returnedDate) {
        this.returnedDate = returnedDate;
    }

    public static ArrayList<UserReservation> getByUserId(int id) {
        return select(String.join(" ",
                        "select r.id, null, e.name, r.start_date, r.end_date, r.returned_date",
                        "from equipment e",
                        "join reservations r on e.id = r.equipment_id",
                        "where r.user_id = ?",
                        "order by coalesce(returned_date, '9999-01-01') desc"
                ),
                (stmt) -> stmt.setInt(1, id),
                UserReservation::from);
    }

    public static ArrayList<UserReservation> getActive() {
        return select(String.join(" ",
                        "select r.id, u.name, e.name, r.start_date, r.end_date, r.returned_date",
                        "from equipment e",
                        "join reservations r on e.id = r.equipment_id",
                        "join users u on r.user_id = u.id",
                        "where r.returned_date is null",
                        "order by coalesce(returned_date, '9999-01-01') desc"
                ),
                UserReservation::from);
    }

    private static UserReservation from(ResultSet rs) throws SQLException {
        return new UserReservation(
                rs.getInt(1),
                rs.getString(2),
                rs.getString(3),
                rs.getDate(4),
                rs.getDate(5),
                rs.getDate(6)
        );
    }
}
