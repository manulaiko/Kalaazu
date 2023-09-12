package {

import mx.binding.IWatcherSetupUtil2;
import mx.binding.PropertyWatcher;
import mx.core.IFlexModuleFactory;

import package_162.class_1016;

public class _net_bigpoint_darkorbit_mvc_battlestationswindow_view_moduleInstallation_components_ModuleInstallationViewWatcherSetupUtil implements IWatcherSetupUtil2 {


    public function _net_bigpoint_darkorbit_mvc_battlestationswindow_view_moduleInstallation_components_ModuleInstallationViewWatcherSetupUtil() {
        super();
    }

    public static function init(param1: IFlexModuleFactory): void {
        class_1016.watcherSetupUtil = new _net_bigpoint_darkorbit_mvc_battlestationswindow_view_moduleInstallation_components_ModuleInstallationViewWatcherSetupUtil();
    }

    public function setup(param1: Object, param2: Function, param3: Function, param4: Array, param5: Array): void {
        param5[0] = new PropertyWatcher("xOffsetInnerModules", {"propertyChange": true}, [param4[0], param4[1], param4[10], param4[11]], param2);
        param5[1] = new PropertyWatcher("xOffsetOuterModules", {"propertyChange": true}, [param4[2], param4[3], param4[8], param4[9]], param2);
        param5[0].updateParent(param1);
        param5[1].updateParent(param1);
    }
}
}
