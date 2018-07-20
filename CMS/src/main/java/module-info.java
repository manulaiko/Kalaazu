module kalaazu.cms {
    exports com.kalaazu.cms;

    requires kalaazu.persistence;
    requires kalaazu.utils;

    requires vertx.web;
    requires vertx.core;
    requires vertx.bridge.common;
    requires rocker.runtime;
}