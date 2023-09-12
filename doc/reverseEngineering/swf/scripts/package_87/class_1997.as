package package_87 {

import flash.display.DisplayObjectContainer;

import mx.logging.ILogger;
import mx.logging.Log;

import net.bigpoint.as3toolbox.bplocale.class_88;
import net.bigpoint.darkorbit.fui.UISystem;
import net.bigpoint.darkorbit.fui.builder.IUIBuilder;
import net.bigpoint.darkorbit.fui.builder.MappingInstanceNames;
import net.bigpoint.darkorbit.fui.builder.UIBuilder;
import net.bigpoint.darkorbit.fui.builder.repository.TextStyleRepository;
import net.bigpoint.darkorbit.fui.builder.xml.XMLBasedUIBuilder;
import net.bigpoint.darkorbit.fui.builder.xml.creators.custom.ResultLabelBuilder;
import net.bigpoint.darkorbit.fui.builder.xml.mapping.XMLNodeNameToInstanceMap;
import net.bigpoint.darkorbit.fui.system.loader.UISystemLoader;
import net.bigpoint.darkorbit.fui.system.manager.FocusManager;
import net.bigpoint.darkorbit.fui.system.manager.MouseManager;
import net.bigpoint.darkorbit.fui.system.manager.PopUpManager;
import net.bigpoint.darkorbit.fui.system.manager.TooltipManager;
import net.bigpoint.darkorbit.mvc.common.model.assets.AssetsProxy;
import net.bigpoint.darkorbit.settings.Settings;

import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.patterns.command.AsyncCommand;

import package_11.class_262;

import package_9.class_50;

public class class_1997 extends AsyncCommand {


    public function class_1997() {
        super();
    }

    override public function execute(param1: INotification): void {
        super.execute(param1);
        var _loc2_: UISystem = UISystem.getInstance();
        var _loc3_: AssetsProxy = facade.retrieveProxy(AssetsProxy.NAME) as AssetsProxy;
        _loc2_.stage = class_50.getInstance().stage;
        _loc2_.builder = this.method_2646();
        _loc2_.uiloader = new UISystemLoader(_loc3_);
        var _loc4_: ILogger = Log.getLogger("UISystem");
        _loc2_.localizationFunctionReference = class_88.getItem;
        _loc2_.logInfoFunctionReference = _loc4_.info;
        _loc2_.logWarnFunctionReference = _loc4_.warn;
        _loc2_.focusManager = new FocusManager();
        var _loc5_: DisplayObjectContainer = class_50.getInstance().method_2602();
        _loc2_.popupManager = new PopUpManager(_loc5_);
        var _loc6_: DisplayObjectContainer = class_50.getInstance().method_2076();
        _loc2_.tooltipManager = new TooltipManager(_loc6_);
        var _loc7_: DisplayObjectContainer = class_50.getInstance().method_1621();
        _loc2_.mouseManager = new MouseManager(_loc7_);
        TextStyleRepository.getInstance().useDeviceFonts = true;
        _loc3_.load("gameclientCommonUIStructure", this.method_5178);
    }

    private function method_2646(): IUIBuilder {
        var _loc1_: UIBuilder = new UIBuilder();
        var _loc2_: XMLBasedUIBuilder = _loc1_.builders[XMLBasedUIBuilder.TYPE] as XMLBasedUIBuilder;
        _loc2_.registerFromDictionary(new XMLNodeNameToInstanceMap());
        _loc2_.register(MappingInstanceNames.RESULT_LABEL, new ResultLabelBuilder().create);
        return _loc1_;
    }

    protected function method_5178(param1: class_262): void {
        UISystem.getInstance().loadAndBuild(param1.method_4925(), null, this.method_5165);
    }

    protected function method_5165(): void {
        this.commandComplete();
    }
}
}
