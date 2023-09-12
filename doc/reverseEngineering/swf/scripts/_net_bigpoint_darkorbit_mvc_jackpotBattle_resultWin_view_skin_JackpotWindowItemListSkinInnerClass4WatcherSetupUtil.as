package {

import mx.binding.IWatcherSetupUtil2;
import mx.binding.PropertyWatcher;
import mx.core.IFlexModuleFactory;

import package_5.class_27;

public class _net_bigpoint_darkorbit_mvc_jackpotBattle_resultWin_view_skin_JackpotWindowItemListSkinInnerClass4WatcherSetupUtil implements IWatcherSetupUtil2 {


    public function _net_bigpoint_darkorbit_mvc_jackpotBattle_resultWin_view_skin_JackpotWindowItemListSkinInnerClass4WatcherSetupUtil() {
        super();
    }

    public static function init(param1: IFlexModuleFactory): void {
        class_27.watcherSetupUtil = new _net_bigpoint_darkorbit_mvc_jackpotBattle_resultWin_view_skin_JackpotWindowItemListSkinInnerClass4WatcherSetupUtil();
    }

    public function setup(param1: Object, param2: Function, param3: Function, param4: Array, param5: Array): void {
        param5[0] = new PropertyWatcher("column", {"columnChanged": true}, [param4[0]], param2);
        param5[1] = new PropertyWatcher("headerText", {"headerTextChanged": true}, [param4[0]], null);
        param5[0].updateParent(param1);
        param5[0].addChild(param5[1]);
    }
}
}
