package net.bigpoint.darkorbit.mvc.common.web.controller {

import net.bigpoint.darkorbit.mvc.common.web.WebConstants;
import net.bigpoint.darkorbit.net.class_59;

import org.puremvc.as3.multicore.interfaces.INotification;

import package_38.class_539;

import package_84.class_243;

public class PageRefreshRequestCommand extends class_243 {


    public function PageRefreshRequestCommand() {
        super();
    }

    override public function execute(param1: INotification): void {
        var _loc3_: * = null;
        var _loc4_: * = null;
        var _loc2_: class_539 = param1.getBody() as class_539;
        if (_loc2_) {
            _loc3_ = WebConstants.WEB_URL_ACTIONS_MAP[_loc2_.var_670];
            _loc4_ = WebConstants.WEB_URL_TEXTKEYS_MAP[_loc2_.var_670];
            class_59.referToURL(_loc3_, _loc4_, null, false, null, null, null, _loc2_.name_87);
        }
    }
}
}
