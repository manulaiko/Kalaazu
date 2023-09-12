package package_94 {

import net.bigpoint.as3toolbox.bplocale.class_88;
import net.bigpoint.darkorbit.gui.windows.class_57;
import net.bigpoint.darkorbit.mvc.common.controller.finisher.FLVFinisher;
import net.bigpoint.darkorbit.mvc.common.model.assets.AssetsProxy;

import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.patterns.command.SimpleCommand;

import package_56.class_152;

public class class_1124 extends SimpleCommand {


    public function class_1124() {
        super();
    }

    override public function execute(param1: INotification): void {
        super.execute(param1);
        var _loc2_: class_57 = class_57.getInstance();
        var _loc3_: AssetsProxy = facade.retrieveProxy(AssetsProxy.NAME) as AssetsProxy;
        var _loc4_: class_152 = _loc2_.createWindow(class_57.const_728) as class_152;
        var _loc5_: FLVFinisher = _loc3_.getLib("disablingPepper") as FLVFinisher;
        _loc4_.method_3597 = _loc5_.getURL();
        _loc4_.text = class_88.getItem("text_pepper_flash_player_fix");
        _loc4_.title = class_88.getItem("low_performance_pepper_flash_player_header");
    }
}
}
