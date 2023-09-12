package {

import mx.binding.IWatcherSetupUtil2;
import mx.binding.PropertyWatcher;
import mx.core.IFlexModuleFactory;

import package_3.class_63;

public class _net_bigpoint_darkorbit_mvc_tdm_matchresultWindow_view_window_components_tooltip_TDMToolTipGridHeadRendererWatcherSetupUtil implements IWatcherSetupUtil2 {


    public function _net_bigpoint_darkorbit_mvc_tdm_matchresultWindow_view_window_components_tooltip_TDMToolTipGridHeadRendererWatcherSetupUtil() {
        super();
    }

    public static function init(param1: IFlexModuleFactory): void {
        class_63.watcherSetupUtil = new _net_bigpoint_darkorbit_mvc_tdm_matchresultWindow_view_window_components_tooltip_TDMToolTipGridHeadRendererWatcherSetupUtil();
    }

    public function setup(param1: Object, param2: Function, param3: Function, param4: Array, param5: Array): void {
        param5[1] = new PropertyWatcher("headerText", {"propertyChange": true}, [param4[1]], param2);
        param5[1].updateParent(param1);
    }
}
}
