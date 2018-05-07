module kalaazu {
    opens com.kalaazu.main to info.picocli;

    requires kalaazu.eventsystem;
    requires kalaazu.persistence;
    requires info.picocli;
    requires org.slf4j;
    requires org.slf4j.simple;
}