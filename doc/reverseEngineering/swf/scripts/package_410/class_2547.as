package package_410 {

import net.bigpoint.darkorbit.fui.UISystem;
import net.bigpoint.darkorbit.mvc.gui.GuiConstants;

import org.puremvc.as3.multicore.interfaces.INotification;

import package_317.DominationNotificationNames;
import package_317.class_2515;

import package_318.class_1796;

import package_46.class_131;

import package_477.DominationWindowMediator;

import package_84.class_1134;

public class class_2547 extends class_1134 {


    public function class_2547() {
        super();
    }

    override public function execute(param1: INotification): void {
        var _loc2_: * = null;
        facade.removeCommand(DominationNotificationNames.INIT);
        _loc2_ = guiManager.method_468(GuiConstants.DOMINATION_WINDOW);
        if (_loc2_ == null) {
            _loc2_ = guiManager.createWindow(GuiConstants.DOMINATION_WINDOW) as class_131;
        }
        UISystem.getInstance().loadAndBuildWithResKey(class_2515.const_194, _loc2_.method_2321(), this.method_2357, [_loc2_]);
    }

    private function method_2357(param1: class_131): void {
        var _loc2_: DominationWindowMediator = new DominationWindowMediator(param1);
        facade.registerMediator(_loc2_);
        registerCommand(DominationNotificationNames.CLEANUP, class_2681);
        var _loc3_: class_1796 = facade.retrieveProxy(class_1796.NAME) as class_1796;
        _loc3_.updateView();
        commandComplete();
    }
}
}
