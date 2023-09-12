package package_408 {

import flash.display.DisplayObjectContainer;
import flash.display.Sprite;

import net.bigpoint.darkorbit.fui.UISystem;
import net.bigpoint.darkorbit.fui.components.core.Container;
import net.bigpoint.darkorbit.mvc.gui.GuiConstants;

import org.puremvc.as3.multicore.interfaces.INotification;

import package_320.InfluenceWindowNotifications;
import package_320.class_2517;

import package_33.class_93;

import package_46.class_131;

import package_475.InfluenceWindowMediator;

import package_84.class_1134;

public class class_2543 extends class_1134 {


    public function class_2543() {
        super();
    }

    override public function execute(param1: INotification): void {
        super.execute(param1);
        var _loc2_: class_131 = (!!guiManager.method_468(GuiConstants.INFLUENCE_WINDOW) ? guiManager.method_468(GuiConstants.INFLUENCE_WINDOW) : guiManager.createWindow(GuiConstants.INFLUENCE_WINDOW)) as class_131;
        var _loc3_: class_93 = _loc2_.method_3694(0);
        var _loc4_: DisplayObjectContainer = new Sprite();
        _loc3_.addElement(_loc4_);
        UISystem.getInstance().loadAndBuildWithResKey(class_2517.const_194, _loc4_, this.method_2357, [_loc2_, _loc4_]);
    }

    private function method_2357(param1: class_131, param2: Sprite): void {
        var _loc3_: Container = param2.getChildAt(0) as Container;
        var _loc4_: InfluenceWindowMediator = new InfluenceWindowMediator(_loc3_, param1);
        registerMediator(_loc4_);
        param1.autoSize();
        sendNotification(InfluenceWindowNotifications.UPDATE_VIEW_FULL);
        registerCommand(InfluenceWindowNotifications.CLEANUP, class_2678);
        commandComplete();
    }
}
}
