import io.vertx.core.Vertx;
import io.vertx.core.json.JsonArray;
import io.vertx.core.json.JsonObject;

/**
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class EventBus {
    /**
     * Main method.
     *
     * @param args Command line arguments.
     */
    public static void main(String[] args) {
        System.out.println("Starting vertx...");
        var vertx = Vertx.vertx();

        System.out.println("Registering handlers...");
        vertx.eventBus()
             .consumer("test.array", h -> {
                 var array = (JsonArray) h.body();

                 array.forEach(System.out::println);
             });

        System.out.println("Sending events...");
        var array = new JsonArray();
        array.add("Hello")
             .add("World!")
             .add(
                     new JsonObject().put("username", "user")
                                     .put("password", "password")
             );

        vertx.eventBus()
             .send("test.array", array);
    }
}
