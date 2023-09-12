package {

import mx.binding.IWatcherSetupUtil2;
import mx.binding.PropertyWatcher;
import mx.core.IFlexModuleFactory;

import package_49.class_139;

public class _net_bigpoint_darkorbit_mvc_questWindow_view_components_QuestGiverWindowViewWatcherSetupUtil implements IWatcherSetupUtil2 {


    public function _net_bigpoint_darkorbit_mvc_questWindow_view_components_QuestGiverWindowViewWatcherSetupUtil() {
        super();
    }

    public static function init(param1: IFlexModuleFactory): void {
        class_139.watcherSetupUtil = new _net_bigpoint_darkorbit_mvc_questWindow_view_components_QuestGiverWindowViewWatcherSetupUtil();
    }

    public function setup(param1: Object, param2: Function, param3: Function, param4: Array, param5: Array): void {
        param5[3] = new PropertyWatcher("tabList", {"propertyChange": true}, [param4[1]], param2);
        param5[4] = new PropertyWatcher("questGiverPortrait", {"propertyChange": true}, [param4[2]], param2);
        param5[5] = new PropertyWatcher("height", {"heightChanged": true}, [param4[2]], null);
        param5[0] = new PropertyWatcher("mainTabBar", {"propertyChange": true}, [param4[0]], param2);
        param5[2] = new PropertyWatcher("height", {"heightChanged": true}, [param4[0]], null);
        param5[1] = new PropertyWatcher("y", {"yChanged": true}, [param4[0]], null);
        param5[6] = new PropertyWatcher("questGiverPortraitNameText", {"propertyChange": true}, [param4[2]], param2);
        param5[7] = new PropertyWatcher("height", {"propertyChange": true}, [param4[2]], null);
        param5[3].updateParent(param1);
        param5[4].updateParent(param1);
        param5[4].addChild(param5[5]);
        param5[0].updateParent(param1);
        param5[0].addChild(param5[2]);
        param5[0].addChild(param5[1]);
        param5[6].updateParent(param1);
        param5[6].addChild(param5[7]);
    }
}
}
