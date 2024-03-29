package net.bigpoint.darkorbit.mvc.gui.highlights.controller {

import net.bigpoint.darkorbit.mvc.gui.GuiConstants;
import net.bigpoint.darkorbit.mvc.gui.featuresMenu.FeaturesMenuConstants;
import net.bigpoint.darkorbit.mvc.gui.highlights.model.HighlightProxy;
import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.ItemsControlMenuConstants;

import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.patterns.command.SimpleCommand;

public class RemoveAllHighlights extends SimpleCommand {


    public function RemoveAllHighlights() {
        super();
    }

    override public function execute(param1: INotification): void {
        super.execute(param1);
        var _loc2_: HighlightProxy = facade.retrieveProxy(HighlightProxy.NAME) as HighlightProxy;
        _loc2_.removeAllHighlightersByCategory(ItemsControlMenuConstants.CATEGORY_BAR);
        _loc2_.removeAllHighlightersByCategory(ItemsControlMenuConstants.STANDARD_SLOT_BAR);
        _loc2_.removeAllHighlightersByCategory(ItemsControlMenuConstants.PREMIUM_SLOT_BAR);
        _loc2_.removeAllHighlightersByCategory(ItemsControlMenuConstants.PRO_ACTION_BAR);
        _loc2_.removeAllHighlightersByCategory(FeaturesMenuConstants.MENU_ID);
        _loc2_.removeAllHighlightersByCategory(GuiConstants.WINDOWS_ID);
    }
}
}
