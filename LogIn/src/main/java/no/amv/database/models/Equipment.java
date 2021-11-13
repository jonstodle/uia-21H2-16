package no.amv.database.models;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Equipment extends ModelBase {
    int id;
    String name;
    int category;
    int price;
    int rentStartDay;
    String comment;

    String[] categoryNames = new String[]{
            "diverse «småutstyr»",
            "Spikerpistoler o.l",
            "Utstyr for vedhogst:",
            "Tilhengere",
            "Større utstyr"
    };

    public Equipment(int id, String name, int category, int price, int rentStartDay, String comment) {
        this.id = id;
        this.name = name;
        this.category = category;
        this.price = price;
        this.rentStartDay = rentStartDay;
        this.comment = comment;
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

    public int getCategory() {
        return category;
    }

    public String getCategoryName() {
        return categoryNames[category - 1];
    }

    public void setCategory(int category) {
        this.category = category;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getRentStartDay() {
        return rentStartDay;
    }

    public void setRentStartDay(int rentStartDay) {
        this.rentStartDay = rentStartDay;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public void save() {
        execute(String.join(" ",
                        "replace into equipment (id, name, kind, price, rent_start_day)",
                        "values (?, ?, ?, ?, ?)"
                ),
                (stmt) -> {
                    stmt.setInt(1, this.id);
                    stmt.setString(2, this.name);
                    stmt.setInt(3, this.category);
                    stmt.setInt(4, this.price);
                    stmt.setInt(5, this.rentStartDay);
                    stmt.setString(6, this.comment);
                });
    }

    public static ArrayList<Equipment> getList() {
        return select(String.join(" ",
                        "select *",
                        "from equipment"
                ),
                Equipment::from);
    }

    public static Equipment getById(int id) {
        return get(String.join(" ",
                        "select *",
                        "from equipment",
                        "where id = ?",
                        "limit 1"
                ),
                (stmt) -> stmt.setInt(1, id),
                Equipment::from);
    }

    private static Equipment from(ResultSet rs) throws SQLException {
        return new Equipment(
                rs.getInt(1),
                rs.getString(2),
                rs.getInt(3),
                rs.getInt(4),
                rs.getInt(5),
                rs.getString(6)
        );
    }
}
