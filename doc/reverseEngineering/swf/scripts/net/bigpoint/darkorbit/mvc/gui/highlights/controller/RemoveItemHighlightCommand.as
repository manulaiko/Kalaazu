package net.bigpoint.darkorbit.mvc.gui.highlights.controller {

import net.bigpoint.darkorbit.mvc.gui.highlights.model.HighlightItemVO;
import net.bigpoint.darkorbit.mvc.gui.highlights.model.HighlightProxy;

import org.puremvc.as3.multicore.interfaces.INotification;

import package_84.class_243;

public class RemoveItemHighlightCommand extends class_243 {


    public function RemoveItemHighlightCommand() {
        super();
    }

    override public function execute(param1: INotification): void {
        super.execute(param1);
        var _loc2_: HighlightItemVO = param1.getBody() as HighlightItemVO;
        var _loc3_: HighlightProxy = retrieveProxy(HighlightProxy.NAME) as HighlightProxy;
        if (_loc3_.hasHighlighterOfType(_loc2_)) {
            _loc3_.removeAllHighlightersByVo(_loc2_);
        }
    }
}
}
