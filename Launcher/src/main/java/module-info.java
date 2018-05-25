module kalaazu {
    exports com.kalaazu.main;

    requires kalaazu.persistence;
    requires kalaazu.cms;

    requires slf4j.api;
    requires slf4j.simple;
    requires vertx.core;
}