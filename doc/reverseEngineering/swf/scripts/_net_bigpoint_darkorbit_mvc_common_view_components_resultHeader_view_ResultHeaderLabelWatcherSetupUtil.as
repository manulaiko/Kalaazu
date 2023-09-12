package {

import mx.binding.IWatcherSetupUtil2;
import mx.binding.PropertyWatcher;
import mx.core.IFlexModuleFactory;

import net.bigpoint.darkorbit.mvc.common.view.components.resultHeader.view.ResultHeaderLabel;

public class _net_bigpoint_darkorbit_mvc_common_view_components_resultHeader_view_ResultHeaderLabelWatcherSetupUtil implements IWatcherSetupUtil2 {


    public function _net_bigpoint_darkorbit_mvc_common_view_components_resultHeader_view_ResultHeaderLabelWatcherSetupUtil() {
        super();
    }

    public static function init(param1: IFlexModuleFactory): void {
        ResultHeaderLabel.watcherSetupUtil = new _net_bigpoint_darkorbit_mvc_common_view_components_resultHeader_view_ResultHeaderLabelWatcherSetupUtil();
    }

    public function setup(param1: Object, param2: Function, param3: Function, param4: Array, param5: Array): void {
        param5[14] = new PropertyWatcher("_trackingLeft", {"propertyChange": true}, [param4[31], param4[36]], param2);
        param5[7] = new PropertyWatcher("_gradient", {"propertyChange": true}, [param4[13]], param2);
        param5[12] = new PropertyWatcher("_font", {"propertyChange": true}, [param4[29], param4[34]], param2);
        param5[9] = new PropertyWatcher("_texture", {"propertyChange": true}, [param4[18]], param2);
        param5[13] = new PropertyWatcher("_fontSize", {"propertyChange": true}, [param4[30], param4[35]], param2);
        param5[0] = new PropertyWatcher("textmask", {"propertyChange": true}, [param4[0], param4[1], param4[6], param4[7], param4[9], param4[10], param4[14], param4[15], param4[17], param4[21], param4[22], param4[26], param4[27]], param2);
        param5[2] = new PropertyWatcher("height", {"heightChanged": true}, [param4[1], param4[6], param4[27]], null);
        param5[1] = new PropertyWatcher("width", {"widthChanged": true}, [param4[0], param4[7], param4[9], param4[10], param4[14], param4[15], param4[17], param4[21], param4[22], param4[26]], null);
        param5[3] = new PropertyWatcher("_backGround", {"propertyChange": true}, [param4[2]], param2);
        param5[11] = new PropertyWatcher("_headerText", {"propertyChange": true}, [param4[28], param4[33]], param2);
        param5[10] = new PropertyWatcher("_effectImg", {"propertyChange": true}, [param4[25]], param2);
        param5[14].updateParent(param1);
        param5[7].updateParent(param1);
        param5[12].updateParent(param1);
        param5[9].updateParent(param1);
        param5[13].updateParent(param1);
        param5[0].updateParent(param1);
        param5[0].addChild(param5[2]);
        param5[0].addChild(param5[1]);
        param5[3].updateParent(param1);
        param5[11].updateParent(param1);
        param5[10].updateParent(param1);
    }
}
}
