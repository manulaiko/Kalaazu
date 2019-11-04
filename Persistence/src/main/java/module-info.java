module kalaazu.persistence {
    exports com.kalaazu.persistence;
    exports com.kalaazu.persistence.entity;
    exports com.kalaazu.persistence.service;

    requires kalaazu.utils;
    requires lombok;
    requires spring.context;
    requires java.persistence;
    requires java.sql;
    requires reflections;
    requires spring.core;
    requires spring.data.jpa;
    requires spring.beans;
}