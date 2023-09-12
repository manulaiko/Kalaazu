package net.bigpoint.darkorbit.fui.components.list {

import net.bigpoint.darkorbit.fui.components.core.ICoreponent;
import net.bigpoint.darkorbit.fui.components.core.data.IDataReceptible;
import net.bigpoint.darkorbit.fui.components.core.interfaces.ISelectable;

public interface IItemDataAssigner extends ICoreponent, ISelectable, IDataReceptible {


    function set index(param1: int): void;
}
}
