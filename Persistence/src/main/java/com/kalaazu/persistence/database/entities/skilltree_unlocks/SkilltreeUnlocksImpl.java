package com.kalaazu.persistence.database.entities.skilltree_unlocks;

import com.kalaazu.persistence.database.Database;
import com.kalaazu.persistence.database.entities.SkilltreeLevels;
import com.kalaazu.persistence.database.entities.SkilltreeUnlocks;
import com.kalaazu.persistence.database.entities.skilltree_unlocks.generated.GeneratedSkilltreeUnlocksImpl;

/**
 * The default implementation of the {@link
 * SkilltreeUnlocks}-interface.
 * <p>
 * This file is safe to edit. It will not be overwritten by the code generator.
 *
 * @author Manulaiko <manulaiko@gmail.com>
 */
public final class SkilltreeUnlocksImpl
        extends GeneratedSkilltreeUnlocksImpl
        implements SkilltreeUnlocks {
    /**
     * The skill to upgrade.
     */
    private SkilltreeLevels upgrade;

    /**
     * The required skill
     */
    private SkilltreeLevels required;

    @Override
    public SkilltreeLevels getUpgrade() {
        if (this.upgrade != null) {
            return this.upgrade;
        }

        this.upgrade = super.findUpgradeSkilltreeLevelsId(
                Database.getInstance()
                        .db()
                        .manager(SkilltreeLevels.class)
        );

        return this.upgrade;
    }

    @Override
    public SkilltreeLevels getRequired() {
        if (this.required != null) {
            return this.required;
        }

        this.required = super.findRequiredSkilltreeLevelsId(
                Database.getInstance()
                        .db()
                        .manager(SkilltreeLevels.class)
        );

        return this.required;
    }
}