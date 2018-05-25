import com.kalaazu.cms.CMSBuilder;
import com.kalaazu.eventsystem.EventManagerBuilder;
import com.kalaazu.persistence.PersistenceBuilder;

/**
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class InstanceServer {
    public static void main(String[] args) {
        System.out.println("Initializing server...");
        var eventManager = new EventManagerBuilder().build();
        var persistence = new PersistenceBuilder().setEventManager(eventManager)
                                                  .build();
        var cms = new CMSBuilder().setPersistence(persistence)
                                  .setEventManager(eventManager)
                                  .setPort(8080)
                                  .build();

        System.out.println("Starting server...");
        cms.start();
        System.out.println("Server started!");
    }
}
