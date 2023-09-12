package package_96 {

import net.bigpoint.darkorbit.gui.windows.class_57;

import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.patterns.command.AsyncCommand;

import package_277.TDMResultWindowMediator;

import package_51.class_141;

public class class_1147 extends AsyncCommand {


    public function class_1147() {
        super();
    }

    override public function execute(param1: INotification): void {
        var _loc2_: * = null;
        var _loc3_: * = null;
        var _loc4_: * = null;
        super.execute(param1);
        if (!facade.hasMediator(TDMResultWindowMediator.NAME)) {
            _loc2_ = class_57.getInstance();
            _loc3_ = _loc2_.createWindow(class_57.const_3194) as class_141;
            _loc4_ = new TDMResultWindowMediator(_loc3_);
            facade.registerMediator(_loc4_);
        }
        commandComplete();
    }
}
}
