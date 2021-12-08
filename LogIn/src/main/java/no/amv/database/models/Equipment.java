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
    int maxRentalDays;
    String comment;

    static String[] categoryNames = new String[]{
            "Diverse «småutstyr»",
            "Spikerpistoler o.l",
            "Utstyr for vedhogst:",
            "Tilhengere",
            "Større utstyr"
    };

    public Equipment(int id, String name, int category, int price, int rentStartDay, int maxRentalDays, String comment) {
        this.id = id;
        this.name = name;
        this.category = category;
        this.price = price;
        this.rentStartDay = rentStartDay;
        this.comment = comment;
        this.maxRentalDays = maxRentalDays;
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

    public int getMaxRentalDays() {
        return maxRentalDays;
    }

    public void setMaxRentalDays(int maxRentalDays) {
        this.maxRentalDays = maxRentalDays;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public static String[] getCategoryNames() {
        return categoryNames;
    }

    public String getCategoryName() {
        return categoryNames[category - 1];
    }

    public void save() {
        if (this.id > 0) {
            execute(String.join(" ",
                            "update equipment",
                            "set",
                            "    name = ?,",
                            "    category = ?,",
                            "    price = ?,",
                            "    rent_start_day = ?,",
                            "    max_rental_days = ?,",
                            "    comment = ?",
                            "where id = ?"
                    ),
                    (stmt) -> {
                        stmt.setString(1, this.name);
                        stmt.setInt(2, this.category);
                        stmt.setInt(3, this.price);
                        stmt.setInt(4, this.rentStartDay);
                        stmt.setInt(5, this.maxRentalDays);
                        stmt.setString(6, this.comment);
                        stmt.setInt(7, this.id);
                    });
        } else {
            execute(String.join(" ",
                            "insert into equipment (name, category, price, rent_start_day, max_rental_days, comment)",
                            "values (?, ?, ?, ?, ?, ?)"
                    ),
                    (stmt) -> {
                        stmt.setString(1, this.name);
                        stmt.setInt(2, this.category);
                        stmt.setInt(3, this.price);
                        stmt.setInt(4, this.rentStartDay);
                        stmt.setInt(5, this.maxRentalDays);
                        stmt.setString(6, this.comment);
                    });
        }
    }

    public void delete() {
        execute(String.join(" ",
                        "delete from equipment",
                        "where id = ?"
                ),
                (stmt) -> stmt.setInt(1, this.id));
    }

    public static ArrayList<Equipment> getList() {
        return select(String.join(" ",
                        "select *",
                        "from equipment"
                ),
                Equipment::from);
    }

    public static ArrayList<Equipment> getListOfAvailable() {
        return select(String.join(" ",
                        "select *",
                        "from equipment",
                        "where id not in (",
                        "    select equipment_id",
                        "    from reservations",
                        "    where start_date <= now()",
                        "        and coalesce(returned_date, now()) >= now()",
                        ")"
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
                rs.getInt(6),
                rs.getString(7)
        );
    }
}
