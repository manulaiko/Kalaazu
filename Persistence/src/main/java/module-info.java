module kalaazu.persistence {
    exports com.kalaazu.persistence;
    exports com.kalaazu.persistence.entity;

    requires kalaazu.utils;
    requires lombok;
    requires spring.context;
    requires java.persistence;
    requires java.sql;
}