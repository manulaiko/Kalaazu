package {

import mx.binding.IWatcherSetupUtil2;
import mx.binding.PropertyWatcher;
import mx.core.IFlexModuleFactory;

import package_165.class_1022;

public class _net_bigpoint_darkorbit_mvc_battlestationswindow_view_installationStatus_components_InstallationStatusViewWatcherSetupUtil implements IWatcherSetupUtil2 {


    public function _net_bigpoint_darkorbit_mvc_battlestationswindow_view_installationStatus_components_InstallationStatusViewWatcherSetupUtil() {
        super();
    }

    public static function init(param1: IFlexModuleFactory): void {
        class_1022.watcherSetupUtil = new _net_bigpoint_darkorbit_mvc_battlestationswindow_view_installationStatus_components_InstallationStatusViewWatcherSetupUtil();
    }

    public function setup(param1: Object, param2: Function, param3: Function, param4: Array, param5: Array): void {
        param5[1] = new PropertyWatcher("_leadingClanModulesTipText", {"propertyChange": true}, [param4[3], param4[4], param4[5]], param2);
        param5[0] = new PropertyWatcher("_yourClanModulesTipText", {"propertyChange": true}, [param4[0], param4[1], param4[2]], param2);
        param5[1].updateParent(param1);
        param5[0].updateParent(param1);
    }
}
}
