module kalaazu.persistence {
    exports com.kalaazu.persistence;

    requires kalaazu.utils;
    requires vertx.core;
    requires vertx.mysql.client;
    requires vertx.sql.client;
    requires java.sql;
    requires lombok;
    requires org.jooq;
    requires java.compiler;
}