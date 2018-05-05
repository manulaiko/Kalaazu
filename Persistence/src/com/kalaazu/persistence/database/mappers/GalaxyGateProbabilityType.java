package com.kalaazu.persistence.database.mappers;

/**
 * GalaxyGate probability type.
 * ============================
 *
 * Maps `galaxygates_probabilities`.`type` to an enum.
 *
 * 0 = ammo
 * 1 = resource
 * 2 = voucher
 * 3 = logfile
 * 4 = part
 * 5 = special
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public enum GalaxyGateProbabilityType {
    AMMO,
    RESOURCE,
    VOUCHER,
    LOGFILE,
    PART,
    SPECIAL
}
