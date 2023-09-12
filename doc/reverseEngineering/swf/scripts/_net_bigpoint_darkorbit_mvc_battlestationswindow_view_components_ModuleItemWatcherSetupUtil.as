package {

import mx.binding.IWatcherSetupUtil2;
import mx.core.IFlexModuleFactory;

import package_155.class_999;

public class _net_bigpoint_darkorbit_mvc_battlestationswindow_view_components_ModuleItemWatcherSetupUtil implements IWatcherSetupUtil2 {


    public function _net_bigpoint_darkorbit_mvc_battlestationswindow_view_components_ModuleItemWatcherSetupUtil() {
        super();
    }

    public static function init(param1: IFlexModuleFactory): void {
        class_999.watcherSetupUtil = new _net_bigpoint_darkorbit_mvc_battlestationswindow_view_components_ModuleItemWatcherSetupUtil();
    }

    public function setup(param1: Object, param2: Function, param3: Function, param4: Array, param5: Array): void {
    }
}
}
