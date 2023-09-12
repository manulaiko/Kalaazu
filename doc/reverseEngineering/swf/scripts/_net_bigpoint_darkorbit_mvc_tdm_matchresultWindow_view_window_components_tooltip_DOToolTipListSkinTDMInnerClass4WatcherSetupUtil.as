package {

import mx.binding.IWatcherSetupUtil2;
import mx.binding.PropertyWatcher;
import mx.core.IFlexModuleFactory;

import package_3.class_13;

public class _net_bigpoint_darkorbit_mvc_tdm_matchresultWindow_view_window_components_tooltip_DOToolTipListSkinTDMInnerClass4WatcherSetupUtil implements IWatcherSetupUtil2 {


    public function _net_bigpoint_darkorbit_mvc_tdm_matchresultWindow_view_window_components_tooltip_DOToolTipListSkinTDMInnerClass4WatcherSetupUtil() {
        super();
    }

    public static function init(param1: IFlexModuleFactory): void {
        class_13.watcherSetupUtil = new _net_bigpoint_darkorbit_mvc_tdm_matchresultWindow_view_window_components_tooltip_DOToolTipListSkinTDMInnerClass4WatcherSetupUtil();
    }

    public function setup(param1: Object, param2: Function, param3: Function, param4: Array, param5: Array): void {
        param5[0] = new PropertyWatcher("column", {"columnChanged": true}, [param4[0]], param2);
        param5[1] = new PropertyWatcher("headerText", {"headerTextChanged": true}, [param4[0]], null);
        param5[0].updateParent(param1);
        param5[0].addChild(param5[1]);
    }
}
}
