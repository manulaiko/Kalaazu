package {

import mx.binding.IWatcherSetupUtil2;
import mx.binding.PropertyWatcher;
import mx.core.IFlexModuleFactory;

import package_3.class_2;

public class _net_bigpoint_darkorbit_mvc_tdm_matchresultWindow_view_window_components_tooltip_DOToolTipListSkinTDMWatcherSetupUtil implements IWatcherSetupUtil2 {


    public function _net_bigpoint_darkorbit_mvc_tdm_matchresultWindow_view_window_components_tooltip_DOToolTipListSkinTDMWatcherSetupUtil() {
        super();
    }

    public static function init(param1: IFlexModuleFactory): void {
        class_2.watcherSetupUtil = new _net_bigpoint_darkorbit_mvc_tdm_matchresultWindow_view_window_components_tooltip_DOToolTipListSkinTDMWatcherSetupUtil();
    }

    public function setup(param1: Object, param2: Function, param3: Function, param4: Array, param5: Array): void {
        param5[3] = new PropertyWatcher("_messageText", {"propertyChange": true}, [param4[3]], param2);
        param5[6] = new PropertyWatcher("headerRenderer", {"propertyChange": true}, [param4[7]], param2);
        param5[0] = new PropertyWatcher("_headerText", {"propertyChange": true}, [param4[0]], param2);
        param5[5] = new PropertyWatcher("headerColumnSeparator", {"propertyChange": true}, [param4[6]], param2);
        param5[3].updateParent(param1);
        param5[6].updateParent(param1);
        param5[0].updateParent(param1);
        param5[5].updateParent(param1);
    }
}
}
