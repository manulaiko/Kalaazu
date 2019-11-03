module kalaazu.cms {
    exports com.kalaazu.cms;

    requires kalaazu.persistence;
    requires kalaazu.utils;

    requires lombok;
    requires spring.context;
    requires spring.webmvc;
    requires spring.web;
    requires spring.beans;
    requires java.desktop;
}