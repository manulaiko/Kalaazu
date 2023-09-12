package net.bigpoint.darkorbit.mvc.common.controller.assets {

import net.bigpoint.darkorbit.mvc.common.model.assets.AssetsProxy;

import org.puremvc.as3.multicore.interfaces.ICommand;
import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.patterns.command.SimpleCommand;

import package_11.class_38;

public class LoadAssetCommand extends SimpleCommand implements ICommand {


    public function LoadAssetCommand() {
        super();
    }

    override public function execute(param1: INotification): void {
        var _loc2_: * = null;
        var _loc8_: * = null;
        _loc2_ = param1.getBody() as Array;
        var _loc3_: String = String(_loc2_[0]);
        var _loc4_: Function = _loc2_[1] as Function;
        var _loc5_: Function = _loc2_[2] as Function;
        var _loc6_: String = !!(_loc2_[3] as String) ? _loc2_[3] as String : AssetsProxy.GAME;
        var _loc7_: AssetsProxy;
        if ((_loc7_ = facade.retrieveProxy(AssetsProxy.NAME) as AssetsProxy).isLoaded(_loc3_, _loc6_)) {
            _loc8_ = _loc7_.getLib(_loc3_, _loc6_);
            _loc4_(_loc8_);
        } else {
            _loc7_.load(_loc3_, _loc4_, _loc5_, _loc6_);
        }
    }
}
}
