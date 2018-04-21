import com.manulaiko.kalaazu.persistence.database.generated.KalaazuApplicationBuilder;
import com.manulaiko.kalaazu.persistence.database.entities.maps.MapsManager;
import com.manulaiko.kalaazu.persistence.database.entities.maps_portals.MapsPortals;
import com.manulaiko.kalaazu.persistence.database.entities.maps_portals.MapsPortalsManager;

import java.time.Duration;
import java.time.Instant;

import static com.speedment.enterprise.datastore.runtime.function.EntityCollectors.groupingBy;

/**
 * @author Manulaiko <manulaiko@gmail.com>
 */
public class Main {
    public static void main(String[] args) {
        var app     = new KalaazuApplicationBuilder().build();
        var maps    = app.getOrThrow(MapsManager.class);
        var portals = app.getOrThrow(MapsPortalsManager.class);

        System.out.println("Searching...");
        var start = Instant.now();
        maps.stream()
            .forEach((m) -> portals.stream()
                                   .filter(MapsPortals.MAPS_ID.equal(m.getId()))
                                   .forEach(p -> System.out.println(
                                           "Portal for map " + m.getName() + ": " + p.getId() + " - " + p.getPosition())));
        var end = Instant.now();

        System.out.println("Took " + Duration.between(start, end));
    }
}
