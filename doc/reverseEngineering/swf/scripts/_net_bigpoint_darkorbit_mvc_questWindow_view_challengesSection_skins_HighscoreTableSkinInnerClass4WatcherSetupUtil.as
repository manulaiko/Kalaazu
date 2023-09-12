package {

import mx.binding.IWatcherSetupUtil2;
import mx.binding.PropertyWatcher;
import mx.core.IFlexModuleFactory;

import package_7.class_44;

public class _net_bigpoint_darkorbit_mvc_questWindow_view_challengesSection_skins_HighscoreTableSkinInnerClass4WatcherSetupUtil implements IWatcherSetupUtil2 {


    public function _net_bigpoint_darkorbit_mvc_questWindow_view_challengesSection_skins_HighscoreTableSkinInnerClass4WatcherSetupUtil() {
        super();
    }

    public static function init(param1: IFlexModuleFactory): void {
        class_44.watcherSetupUtil = new _net_bigpoint_darkorbit_mvc_questWindow_view_challengesSection_skins_HighscoreTableSkinInnerClass4WatcherSetupUtil();
    }

    public function setup(param1: Object, param2: Function, param3: Function, param4: Array, param5: Array): void {
        param5[0] = new PropertyWatcher("column", {"columnChanged": true}, [param4[0], param4[1]], param2);
        param5[2] = new PropertyWatcher("columnIndex", {"columnIndexChanged": true}, [param4[1]], null);
        param5[1] = new PropertyWatcher("headerText", {"headerTextChanged": true}, [param4[0]], null);
        param5[0].updateParent(param1);
        param5[0].addChild(param5[2]);
        param5[0].addChild(param5[1]);
    }
}
}
