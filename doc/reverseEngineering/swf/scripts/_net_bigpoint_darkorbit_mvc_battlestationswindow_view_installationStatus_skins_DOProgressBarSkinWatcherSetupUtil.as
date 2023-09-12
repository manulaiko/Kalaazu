package {

import mx.binding.IWatcherSetupUtil2;
import mx.binding.PropertyWatcher;
import mx.core.IFlexModuleFactory;

import package_250.class_1540;

public class _net_bigpoint_darkorbit_mvc_battlestationswindow_view_installationStatus_skins_DOProgressBarSkinWatcherSetupUtil implements IWatcherSetupUtil2 {


    public function _net_bigpoint_darkorbit_mvc_battlestationswindow_view_installationStatus_skins_DOProgressBarSkinWatcherSetupUtil() {
        super();
    }

    public static function init(param1: IFlexModuleFactory): void {
        class_1540.watcherSetupUtil = new _net_bigpoint_darkorbit_mvc_battlestationswindow_view_installationStatus_skins_DOProgressBarSkinWatcherSetupUtil();
    }

    public function setup(param1: Object, param2: Function, param3: Function, param4: Array, param5: Array): void {
        param5[0] = new PropertyWatcher("_trackBgBitmapData", {"propertyChange": true}, [param4[0]], param2);
        param5[0].updateParent(param1);
    }
}
}
