package no.amv.database.models;

import java.sql.ResultSet;
import java.sql.SQLException;

public interface ModelMapper<T> {
    T map(ResultSet rs) throws SQLException;
}
