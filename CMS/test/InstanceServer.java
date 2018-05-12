import com.kalaazu.cms.server.Server;

/**
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class InstanceServer {
    public static void main(String[] args) {
        var server = new Server(8080, "www/views", "www/public_html");

        server.initialize();
        server.start();
    }
}
