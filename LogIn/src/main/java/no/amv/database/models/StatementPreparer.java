package no.amv.database.models;

import java.sql.PreparedStatement;
import java.sql.SQLException;

public interface StatementPreparer {
    void prepare(PreparedStatement statement) throws SQLException;
}
