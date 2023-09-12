package net.bigpoint.darkorbit.mvc.gui.highlights.controller {

import net.bigpoint.darkorbit.mvc.gui.highlights.model.HighlightProxy;

import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.patterns.command.SimpleCommand;

public class RemoveHighlightByCategoryCommand extends SimpleCommand {


    public function RemoveHighlightByCategoryCommand() {
        super();
    }

    override public function execute(param1: INotification): void {
        super.execute(param1);
        var _loc2_: HighlightProxy = facade.retrieveProxy(HighlightProxy.NAME) as HighlightProxy;
        _loc2_.removeAllHighlightersByCategory(String(param1.getBody()));
    }
}
}
