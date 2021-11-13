package no.amv.database.models;

import no.amv.database.DB;

import java.sql.SQLException;
import java.util.ArrayList;

public abstract class ModelBase {
    protected static void execute(
            String sql,
            StatementPreparer prepare) {
        try {
            var statement = DB.getConnection().prepareStatement(sql);

            prepare.prepare(statement);

            statement.executeUpdate();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    protected static <T> T get(
            String sql,
            ModelMapper<T> map) {
        return get(sql, (x) -> {
        }, map);
    }

    protected static <T> T get(
            String sql,
            StatementPreparer prepare,
            ModelMapper<T> map) {
        return select(sql, prepare, map)
                .stream()
                .findFirst()
                .orElse(null);
    }

    protected static <T> ArrayList<T> select(
            String sql,
            ModelMapper<T> map) {
        return select(sql, (x) -> {
        }, map);
    }

    protected static <T> ArrayList<T> select(
            String sql,
            StatementPreparer prepare,
            ModelMapper<T> map) {
        var result = new ArrayList<T>();

        try {
            var statement = DB.getConnection().prepareStatement(sql);

            prepare.prepare(statement);

            var rs = statement.executeQuery();

            while (rs.next()) {
                result.add(map.map(rs));
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }

        return result;
    }
}
