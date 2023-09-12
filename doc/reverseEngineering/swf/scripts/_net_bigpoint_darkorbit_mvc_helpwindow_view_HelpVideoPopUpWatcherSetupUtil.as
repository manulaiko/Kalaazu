package {

import mx.binding.IWatcherSetupUtil2;
import mx.binding.PropertyWatcher;
import mx.core.IFlexModuleFactory;

import package_56.class_152;

public class _net_bigpoint_darkorbit_mvc_helpwindow_view_HelpVideoPopUpWatcherSetupUtil implements IWatcherSetupUtil2 {


    public function _net_bigpoint_darkorbit_mvc_helpwindow_view_HelpVideoPopUpWatcherSetupUtil() {
        super();
    }

    public static function init(param1: IFlexModuleFactory): void {
        class_152.watcherSetupUtil = new _net_bigpoint_darkorbit_mvc_helpwindow_view_HelpVideoPopUpWatcherSetupUtil();
    }

    public function setup(param1: Object, param2: Function, param3: Function, param4: Array, param5: Array): void {
        param5[1] = new PropertyWatcher("_text", {"propertyChange": true}, [param4[2]], param2);
        param5[3] = new PropertyWatcher("_helpVideoURL", {"propertyChange": true}, [param4[4]], param2);
        param5[1].updateParent(param1);
        param5[3].updateParent(param1);
    }
}
}
