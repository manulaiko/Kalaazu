module kalaazu.persistence {
    exports com.manulaiko.kalaazu.persistence;

    requires kalaazu;
    requires org.mariadb.jdbc;
    requires java.sql;
    requires speedment;
}