package com.kalaazu.server.service;

import com.kalaazu.math.Vector2;
import com.kalaazu.persistence.entity.MapsEntity;
import com.kalaazu.persistence.service.MapsService;
import com.kalaazu.server.commands.OutCommand;
import com.kalaazu.server.entities.*;
import com.kalaazu.server.event.GameSessionStartedEvent;
import com.kalaazu.server.event.SendCommandsEvent;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.ApplicationContext;
import org.springframework.context.event.EventListener;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.random.RandomGenerator;
import java.util.stream.Collectors;

/**
 * Map service.
 * ============
 * <p>
 * Service for game maps.
 *
 * @author manulaiko <manulaiko@gmail.com>
 */
@Service
@RequiredArgsConstructor
@Slf4j
public class MapService {
    private final MapsService service;
    private final ApplicationContext ctx;

    private Map<Byte, MapsEntity> maps;

    private Map<Byte, Set<Npc>> npcs = new HashMap<>();
    private Map<Byte, Set<Collectable>> collectables = new HashMap<>();
    private Map<Byte, Set<Station>> stations = new HashMap<>();
    private Map<Byte, Set<Portal>> portals = new HashMap<>();
    private Map<Byte, Set<Player>> players = new HashMap<>();


    public void initialize() {
        log.info("Loading maps..");
        maps = service.findAll()
                .stream()
                .collect(Collectors.toMap(MapsEntity::getId, (v) -> v));

        maps.forEach(this::initializeMap);
    }

    private void initializeMap(Byte mapId, MapsEntity map) {
        log.info("Initializing map {}", map.getName());

        var npcs = new LinkedHashSet<Npc>();
        var collectables = new LinkedHashSet<Collectable>();
        var stations = new LinkedHashSet<Station>();
        var portals = new LinkedHashSet<Portal>();

        var r = RandomGenerator.getDefault();

        map.getMapsNpcs()
                .forEach(npc -> {
                    for (int i = 0; i < npc.getAmount(); i++) {
                        var n = ctx.getBean(Npc.class);
                        n.setMap(map);
                        n.setNpc(npc.getNpcsByNpcsId());
                        n.setSpeed(n.getNpc().getSpeed());
                        n.setPosition(Vector2.random(map.getLimits()));
                        n.setId(r.nextInt());

                        npcs.add(n);
                    }
                });

        map.getMapsCollectables()
                .forEach(collectable -> {
                    for (int i = 0; i < collectable.getAmount(); i++) {
                        var c = new Collectable(collectable.getCollectablesByCollectablesId(), map);

                        var to = collectable.getTo();
                        if (to == null) {
                            to = map.getLimits();
                        }

                        c.setPosition(Vector2.random(collectable.getFrom(), to));
                        c.setId(r.nextInt());

                        collectables.add(c);
                    }
                });

        map.getMapsStations()
                .forEach(station -> {
                    var s = new Station(station, map);

                    s.setId(r.nextInt());
                    s.setPosition(station.getPosition());

                    stations.add(s);
                });

        map.getMapsPortals()
                .forEach(portal -> {
                    var p = new Portal(portal, map);

                    p.setId(r.nextInt());
                    p.setPosition(portal.getPosition());

                    portals.add(p);
                });

        log.info("Initialized {} npcs, {} collectables, {} stations and {} portals", npcs.size(), collectables.size(), stations.size(), portals.size());

        this.npcs.put(mapId, npcs);
        this.collectables.put(mapId, collectables);
        this.stations.put(mapId, stations);
        this.portals.put(mapId, portals);
    }

    @EventListener
    public void initializePlayer(GameSessionStartedEvent event) {
        var session = event.getSession();
        var account = session.getAccount();
        var ship = session.getShip();
        var config = session.getConfiguration();
        var map = session.getMapId();

        if (!maps.containsKey(map)) {
            log.info("Invalid map {}!", map);

            return;
        }

        log.info("Initializing player {}", account.getId());

        var player = ctx.getBean(Player.class);
        player.setGameSession(session);
        player.setMap(maps.get(map));
        player.setId(account.getId());
        player.setPosition(ship.getPosition());
        player.setSpeed((short) (config.getSpeed() + 1000));

        session.setPlayer(player);

        var commands = new ArrayList<OutCommand>();

        npcs.getOrDefault(map, new HashSet<>())
                // TODO filter near entities
                .forEach(npc -> commands.add(npc.getEntityCreationCommand()));


        ctx.publishEvent(new SendCommandsEvent(session, commands, this));
    }
}
