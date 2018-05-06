package com.kalaazu.persistence;

import com.kalaazu.eventsystem.EventManagerBuilder;
import com.kalaazu.math.Vector2;
import com.kalaazu.persistence.database.entities.Items;
import com.kalaazu.persistence.database.entities.Maps;
import com.speedment.runtime.core.ApplicationBuilder;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestInstance;

import java.util.Arrays;
import java.util.stream.Collectors;

import static org.junit.jupiter.api.Assertions.*;

@TestInstance(TestInstance.Lifecycle.PER_CLASS)
class PersistenceTest {
    public static Persistence persistence;

    @BeforeAll
    @Test
    void setUp() {
        persistence = new Persistence(
                new EventManagerBuilder().build()
        );

        assertFalse(persistence.isInitialized());

        persistence.initialize(
                "localhost",
                3306,
                "kalaazu",
                "manulaiko",
                "",
                Arrays.asList(
                        ApplicationBuilder.LogType.APPLICATION_BUILDER,
                        ApplicationBuilder.LogType.CONNECTION,
                        ApplicationBuilder.LogType.PERSIST,
                        ApplicationBuilder.LogType.REMOVE,
                        ApplicationBuilder.LogType.STREAM,
                        ApplicationBuilder.LogType.STREAM_OPTIMIZER,
                        ApplicationBuilder.LogType.TRANSACTION,
                        ApplicationBuilder.LogType.UPDATE
                )
        );

        assertTrue(persistence.isInitialized());
    }

    @Test
    void find() {
        assertTrue(persistence.isInitialized());

        var credits = persistence.find(1, Items.class);

        assertNotNull(credits);
        assertTrue(credits.isPresent());
        assertEquals(credits.get()
                            .getName(), "Credits");
    }

    @Test
    void all() {
        assertTrue(persistence.isInitialized());

        var items = persistence.all(Items.class)
                               .collect(Collectors.toList());

        assertNotNull(items);
        assertNotEquals(items.size(), 0);
        items.forEach(Assertions::assertNotNull);
    }

    @Test
    void get() {
        assertTrue(persistence.isInitialized());

        var credits = persistence.get(1, Items.class);

        assertNotNull(credits);
        assertEquals(credits.getName(), "Credits");
    }

    @Test
    void relations() {
        assertTrue(persistence.isInitialized());

        var maps = persistence.all(Maps.class)
                              .collect(Collectors.toList());

        assertNotNull(maps);

        maps.forEach(m -> {
            assertNotNull(m);
            assertNotNull(m.getNpcs());
            assertNotNull(m.getFaction());
            assertNotNull(m.getPortals());
            assertNotNull(m.getStations());

            m.getNpcs()
             .forEach(n -> {
                 assertNotNull(n);
                 assertNotNull(n.getNpc());
                 assertEquals(m, n.getMap());
             });

            m.getFaction()
             .ifPresent(Assertions::assertNotNull);

            m.getPortals()
             .forEach(p -> {
                 assertNotNull(p);
                 assertEquals(m, p.getMap());
             });

            m.getStations()
             .forEach(Assertions::assertNotNull);
        });
    }
}