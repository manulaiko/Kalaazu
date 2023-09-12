package {

import mx.binding.IWatcherSetupUtil2;
import mx.binding.PropertyWatcher;
import mx.core.IFlexModuleFactory;

import net.bigpoint.darkorbit.mvc.common.view.skins.DOTabButtonBaseSkin;

public class _net_bigpoint_darkorbit_mvc_common_view_skins_DOTabButtonBaseSkinWatcherSetupUtil implements IWatcherSetupUtil2 {


    public function _net_bigpoint_darkorbit_mvc_common_view_skins_DOTabButtonBaseSkinWatcherSetupUtil() {
        super();
    }

    public static function init(param1: IFlexModuleFactory): void {
        DOTabButtonBaseSkin.watcherSetupUtil = new _net_bigpoint_darkorbit_mvc_common_view_skins_DOTabButtonBaseSkinWatcherSetupUtil();
    }

    public function setup(param1: Object, param2: Function, param3: Function, param4: Array, param5: Array): void {
        param5[2] = new PropertyWatcher("over", {"propertyChange": true}, [param4[2]], param2);
        param5[5] = new PropertyWatcher("downAndSelected", {"propertyChange": true}, [param4[5]], param2);
        param5[7] = new PropertyWatcher("disabledAndSelected", {"propertyChange": true}, [param4[7]], param2);
        param5[8] = new PropertyWatcher("hostComponent", {"propertyChange": true}, [param4[8]], param2);
        param5[9] = new PropertyWatcher("factionGraphic", {"propertyChange": true}, [param4[8]], null);
        param5[4] = new PropertyWatcher("down", {"propertyChange": true}, [param4[4]], param2);
        param5[3] = new PropertyWatcher("overAndSelected", {"propertyChange": true}, [param4[3]], param2);
        param5[6] = new PropertyWatcher("disabled", {"propertyChange": true}, [param4[6]], param2);
        param5[1] = new PropertyWatcher("upAndSelected", {"propertyChange": true}, [param4[1]], param2);
        param5[0] = new PropertyWatcher("up", {"propertyChange": true}, [param4[0]], param2);
        param5[2].updateParent(param1);
        param5[5].updateParent(param1);
        param5[7].updateParent(param1);
        param5[8].updateParent(param1);
        param5[8].addChild(param5[9]);
        param5[4].updateParent(param1);
        param5[3].updateParent(param1);
        param5[6].updateParent(param1);
        param5[1].updateParent(param1);
        param5[0].updateParent(param1);
    }
}
}
