module kalaazu.persistence {
    exports com.manulaiko.kalaazu.persistence;
    exports entities;

    requires kalaazu;
    requires java.sql;
    requires speedment;
}