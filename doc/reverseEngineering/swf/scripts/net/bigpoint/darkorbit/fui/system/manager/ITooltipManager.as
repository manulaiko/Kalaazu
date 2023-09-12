package net.bigpoint.darkorbit.fui.system.manager {

import net.bigpoint.darkorbit.fui.components.core.Coreponent;

public interface ITooltipManager {


    function assignTooltipTemplateID(param1: String, param2: Coreponent = null): void;

    function attemptToRemoveTooltip(): void;
}
}
