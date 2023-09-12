package {

import mx.binding.IWatcherSetupUtil2;
import mx.binding.PropertyWatcher;
import mx.core.IFlexModuleFactory;

import package_60.class_1033;

public class _net_bigpoint_darkorbit_mvc_settings_view_components_DisplaySettingsTabContentWatcherSetupUtil implements IWatcherSetupUtil2 {


    public function _net_bigpoint_darkorbit_mvc_settings_view_components_DisplaySettingsTabContentWatcherSetupUtil() {
        super();
    }

    public static function init(param1: IFlexModuleFactory): void {
        class_1033.watcherSetupUtil = new _net_bigpoint_darkorbit_mvc_settings_view_components_DisplaySettingsTabContentWatcherSetupUtil();
    }

    public function setup(param1: Object, param2: Function, param3: Function, param4: Array, param5: Array): void {
        param5[1] = new PropertyWatcher("qualitySettingList", {"propertyChange": true}, [param4[1], param4[2], param4[3], param4[4], param4[5], param4[6]], param2);
        param5[0] = new PropertyWatcher("resolutionList", {"propertyChange": true}, [param4[0]], param2);
        param5[1].updateParent(param1);
        param5[0].updateParent(param1);
    }
}
}
