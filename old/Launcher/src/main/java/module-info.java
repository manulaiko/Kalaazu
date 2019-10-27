module kalaazu {
    exports com.kalaazu.main;

    requires kalaazu.persistence;
    requires kalaazu.cms;
    requires lombok;
    requires vertx.core;
}