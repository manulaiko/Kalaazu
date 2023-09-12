package package_68 {

import flash.geom.Point;
import flash.geom.Rectangle;

import net.bigpoint.darkorbit.class_81;
import net.bigpoint.darkorbit.mvc.gui.GuiConstants;
import net.bigpoint.darkorbit.mvc.gui.GuiNotifications;
import net.bigpoint.darkorbit.mvc.gui.interfaces.IWindow;
import net.bigpoint.darkorbit.mvc.gui.view.GuiMediator;
import net.bigpoint.darkorbit.settings.Settings;

import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.patterns.command.SimpleCommand;

import package_170.class_1040;

import package_62.ChatMediator;

import package_63.class_224;

import package_9.class_50;

public class class_216 extends SimpleCommand {


    public function class_216() {
        super();
    }

    override public function execute(param1: INotification): void {
        super.execute(param1);
        sendNotification(GuiNotifications.CREATE_WINDOW, GuiConstants.CHAT_WINDOW);
        var _loc2_: GuiMediator = facade.retrieveMediator(GuiMediator.NAME) as GuiMediator;
        var _loc3_: IWindow = _loc2_.getWindowById(GuiConstants.CHAT_WINDOW);
        if (_loc3_ == null) {
            return;
        }
        var _loc4_: String = param1.getBody() as String;
        var _loc5_: Boolean = false;
        if (true) {
            _loc5_ = true;
        }
        var _loc6_: String = "null";
        var _loc7_: class_1040 = new class_1040(class_81.name_148, class_81.userID, class_81.sessionID, Settings.instanceID, _loc4_, class_81.name_145, class_81.factionID, new Point(14, 30), new Rectangle(0, 0, class_50.method_6533(), class_50.method_1269()), false, _loc6_, 0, false, 0, 0, false, _loc5_);
        var _loc8_: ChatMediator;
        (_loc8_ = facade.retrieveMediator(ChatMediator.NAME) as ChatMediator).method_3297(_loc3_);
        _loc8_.method_3071(_loc7_);
    }
}
}
