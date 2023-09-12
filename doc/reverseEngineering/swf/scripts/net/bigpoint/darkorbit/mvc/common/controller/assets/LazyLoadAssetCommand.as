package net.bigpoint.darkorbit.mvc.common.controller.assets {

import net.bigpoint.darkorbit.mvc.common.model.assets.AssetsProxy;

import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.patterns.command.SimpleCommand;

public class LazyLoadAssetCommand extends SimpleCommand {


    public function LazyLoadAssetCommand() {
        super();
    }

    override public function execute(param1: INotification): void {
        var _loc2_: * = null;
        super.execute(param1);
        _loc2_ = param1.getBody() as Array;
        var _loc3_: String = String(_loc2_[0]);
        var _loc4_: String = _loc2_[1] as String;
        var _loc5_: Function = _loc2_[2] as Function;
        var _loc6_: Function = _loc2_[3] as Function;
        var _loc7_: AssetsProxy;
        (_loc7_ = facade.retrieveProxy(AssetsProxy.NAME) as AssetsProxy).lazyLoad(_loc3_, _loc5_, _loc6_, _loc4_);
    }
}
}
