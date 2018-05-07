module kalaazu {
    exports com.kalaazu.math;

    opens com.kalaazu.main to info.picocli;

    requires kalaazu.eventsystem;
    requires kalaazu.persistence;
    requires info.picocli;
}