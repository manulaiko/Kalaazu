package com.kalaazu.server.service;

import com.kalaazu.math.Vector2;
import com.kalaazu.persistence.entity.MapsEntity;
import com.kalaazu.persistence.service.MapsService;
import com.kalaazu.server.entities.*;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.LinkedHashSet;
import java.util.Map;
import java.util.Set;
import java.util.UUID;
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

    private Map<Byte, MapsEntity> maps;

    private Map<Byte, Set<Npc>> npcs;
    private Map<Byte, Set<Collectable>> collectables;
    private Map<Byte, Set<Station>> stations;
    private Map<Byte, Set<Portal>> portals;
    private Map<Byte, Set<Player>> players;


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

        map.getMapsNpcs()
                .forEach(npc -> {
                    for (int i = 0; i < npc.getAmount(); i++) {
                        var n = new Npc(npc.getNpcsByNpcsId(), map);

                        n.setPosition(Vector2.random(map.getLimits()));
                        n.setId(UUID.randomUUID());

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
                        c.setId(UUID.randomUUID());

                        collectables.add(c);
                    }
                });

        map.getMapsStations()
                .forEach(station -> {
                    var s = new Station(station, map);

                    s.setId(UUID.randomUUID());
                    s.setPosition(station.getPosition());

                    stations.add(s);
                });

        map.getMapsPortals()
                .forEach(portal -> {
                    var p = new Portal(portal, map);

                    p.setId(UUID.randomUUID());
                    p.setPosition(portal.getPosition());

                    portals.add(p);
                });

        log.info("Initialized {} npcs, {} collectables, {} stations and {} portals", npcs.size(), collectables.size(), stations.size(), portals.size());

        this.npcs.put(mapId, npcs);
        this.collectables.put(mapId, collectables);
        this.stations.put(mapId, stations);
        this.portals.put(mapId, portals);
    }
}
