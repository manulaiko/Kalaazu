module kalaazu.persistence {
    exports com.manulaiko.kalaazu.persistence;
    exports com.manulaiko.kalaazu.persistence.database.entities;

    requires kalaazu;
    requires requery;
    requires java.sql;
}