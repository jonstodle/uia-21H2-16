package no.amv.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DB {
    private static Connection connection;

    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        Class.forName("org.mariadb.jdbc.Driver");

        if (connection == null) {
            connection = DriverManager.getConnection(
                    "jdbc:mariadb://172.17.0.1:3308/amv",
                    "root",
                    "12345"
            );
        }

        return connection;
    }
}
