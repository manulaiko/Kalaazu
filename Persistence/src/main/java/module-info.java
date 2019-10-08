module kalaazu.persistence {
    exports com.kalaazu.persistence;

    requires kalaazu.utils;
    requires vertx.core;
    requires com.zaxxer.hikari;
    requires org.mariadb.jdbc;
    requires java.sql;
    requires lombok;
    requires org.jooq;
    requires java.compiler;
}