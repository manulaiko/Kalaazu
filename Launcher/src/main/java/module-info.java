module kalaazu {
    exports com.kalaazu.main;

    requires kalaazu.persistence;

    requires slf4j.api;
    requires slf4j.simple;
    requires vertx.core;
}