module kalaazu {
    exports com.kalaazu.main;

    requires kalaazu.persistence;

    requires org.slf4j;
    requires org.slf4j.simple;
    requires vertx.core;
}