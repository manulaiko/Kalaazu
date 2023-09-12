package net.bigpoint.darkorbit.mvc.common {

public class ConnectionNotifications {

    public static const NAME: String = "ConnectionNotification";

    public static const ERROR: String = NAME + "Error";

    public static const INIT: String = NAME + "Init";

    public static const READY: String = NAME + "Ready";

    public static const SEND_COMMAND: String = NAME + "SendCommand";

    public static const SEND_NETTY_REQUEST: String = "SEND_NETTY_REQUEST";


    public function ConnectionNotifications() {
        super();
    }
}
}
