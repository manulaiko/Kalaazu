package {

import mx.binding.IWatcherSetupUtil2;
import mx.binding.PropertyWatcher;
import mx.core.IFlexModuleFactory;

import net.bigpoint.darkorbit.mvc.common.view.skins.DOOuterViewContainerSkin;

public class _net_bigpoint_darkorbit_mvc_common_view_skins_DOOuterViewContainerSkinWatcherSetupUtil implements IWatcherSetupUtil2 {


    public function _net_bigpoint_darkorbit_mvc_common_view_skins_DOOuterViewContainerSkinWatcherSetupUtil() {
        super();
    }

    public static function init(param1: IFlexModuleFactory): void {
        DOOuterViewContainerSkin.watcherSetupUtil = new _net_bigpoint_darkorbit_mvc_common_view_skins_DOOuterViewContainerSkinWatcherSetupUtil();
    }

    public function setup(param1: Object, param2: Function, param3: Function, param4: Array, param5: Array): void {
        param5[0] = new PropertyWatcher("borderColour", {"propertyChange": true}, [param4[0]], param2);
        param5[3] = new PropertyWatcher("backgroundColour", {"propertyChange": true}, [param4[3]], param2);
        param5[2] = new PropertyWatcher("borderAlpha", {"propertyChange": true}, [param4[2]], param2);
        param5[4] = new PropertyWatcher("backgroundAlpha", {"propertyChange": true}, [param4[4]], param2);
        param5[1] = new PropertyWatcher("borderWeight", {"propertyChange": true}, [param4[1]], param2);
        param5[0].updateParent(param1);
        param5[3].updateParent(param1);
        param5[2].updateParent(param1);
        param5[4].updateParent(param1);
        param5[1].updateParent(param1);
    }
}
}
