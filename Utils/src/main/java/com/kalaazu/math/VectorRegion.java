package com.kalaazu.math;

import lombok.Data;
import lombok.RequiredArgsConstructor;

/**
 * Vector region class.
 * ====================
 *
 * Represents a region composed of 2 vectors:
 *  * Top left
 *  * Bottom right
 *
 * @author manulaiko <manulaiko@gmail.com>
 */
@Data
@RequiredArgsConstructor
public class VectorRegion {
    private final Vector topLeft;
    private final Vector bottomRight;

    public VectorRegion(String region) {
        var str = region.split("\\|");

        topLeft = new Vector(str[0]);
        bottomRight = new Vector(str[1]);
    }

    /**
     * Checks if a vector is within this region.
     *
     * @param vector Vector to check.
     *
     * @return Whether vector is in this region or not.
     */
    public boolean isWithin(Vector vector) {
        var x = vector.getX();
        var y = vector.getY();
        var tX = topLeft.getX();
        var tY = topLeft.getY();
        var bX = bottomRight.getX();
        var bY = bottomRight.getY();

        return (x >= tX && x <= bX) && (y >= tY && x <= bY);
    }

    public VectorRegion margin() {
        return new VectorRegion(topLeft.addMargin(), bottomRight.subMargin());
    }

    @Override
    public String toString() {
        return topLeft + "|" + bottomRight;
    }
}
