package no.amv.database.models;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Lease extends ModelBase {
    int id;
    String name;
    byte[] data;

    public Lease(int id, String name, byte[] data) {
        this.id = id;
        this.name = name;
        this.data = data;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public byte[] getData() {
        return data;
    }

    public void setData(byte[] data) {
        this.data = data;
    }

    public void save() {
        if (this.id > 0) {
            execute(String.join(" ",
                            "update leases",
                            "set",
                            "    name = ?,",
                            "    data = ?,",
                            "where id = ?"
                    ),
                    (stmt) -> {
                        stmt.setString(1, this.name);
                        stmt.setBytes(2, this.data);
                        stmt.setInt(3, this.id);
                    });
        } else {
            execute(String.join(" ",
                            "insert into leases (name, data)",
                            "values (?, ?)"
                    ),
                    (stmt) -> {
                        stmt.setString(1, this.name);
                        stmt.setBytes(2, this.data);
                    });
        }
    }

    public void delete() {
        execute(String.join(" ",
                        "delete from leases",
                        "where id = ?"
                ),
                (stmt) -> stmt.setInt(1, this.id));
    }

    public static ArrayList<Lease> getList() {
        return select(String.join(" ",
                        "select id, name, null",
                        "from leases"
                ),
                Lease::from);
    }

    public static Lease getById(int id) {
        return get(String.join(" ",
                        "select *",
                        "from leases",
                        "where id = ?",
                        "limit 1"
                ),
                (stmt) -> stmt.setInt(1, id),
                Lease::from);
    }

    public static Lease from(ResultSet rs) throws SQLException {
        return new Lease(
                rs.getInt(1),
                rs.getString(2),
                rs.getBytes(3)
        );
    }
}
