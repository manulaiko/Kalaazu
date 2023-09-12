package com.kalaazu.server.service;

import com.kalaazu.math.Vector2;
import com.kalaazu.persistence.entity.MapsEntity;
import com.kalaazu.persistence.service.MapsService;
import com.kalaazu.server.entities.Collectable;
import com.kalaazu.server.entities.Npc;
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

        map.getMapsNpcs().forEach(npc -> {
            for (int i = 0; i < npc.getAmount(); i++) {
                var n = new Npc(npc.getNpcsByNpcsId(), map);

                n.setPosition(Vector2.random(map.getLimits()));
                n.setId(UUID.randomUUID());

                npcs.add(n);
            }
        });


        this.npcs.put(mapId, npcs);
    }
}
