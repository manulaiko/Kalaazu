package package_95 {

import net.bigpoint.darkorbit.mvc.common.model.ConnectionProxy;
import net.bigpoint.darkorbit.mvc.common.model.MapManagerProxy;
import net.bigpoint.darkorbit.mvc.common.model.assets.AssetsProxy;
import net.bigpoint.darkorbit.mvc.common.model.assets.UnloadFinisherProxy;
import net.bigpoint.darkorbit.mvc.common.model.javaScript.JavaScriptDelayedCallsProxy;
import net.bigpoint.darkorbit.mvc.common.model.pattern.proxy.PatternManagerProxy;

import org.puremvc.as3.multicore.interfaces.ICommand;
import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.patterns.command.SimpleCommand;

import package_11.class_38;

import package_163.BattleStationProxy;

import package_175.StarmapBattleStationIconProxy;

import package_186.HintsProxy;

import package_255.StatsProxy;

import package_265.CompanyHierarchyProxy;

import package_266.DOTexturesProxy;

import package_267.SectorControlProxy;

import package_42.ProfileProxy;
import package_42.SystemManagerProxy;

public class class_1126 extends SimpleCommand implements ICommand {


    public function class_1126() {
        super();
    }

    override public function execute(param1: INotification): void {
        facade.registerProxy(new ConnectionProxy());
        facade.registerProxy(new PatternManagerProxy());
        facade.registerProxy(new AssetsProxy());
        facade.registerProxy(new UnloadFinisherProxy(new Vector.<class_38>()));
        facade.registerProxy(new StatsProxy());
        facade.registerProxy(new DOTexturesProxy());
        facade.registerProxy(new BattleStationProxy());
        facade.registerProxy(new CompanyHierarchyProxy());
        facade.registerProxy(new StarmapBattleStationIconProxy());
        facade.registerProxy(new SectorControlProxy());
        facade.registerProxy(new ProfileProxy());
        facade.registerProxy(new MapManagerProxy());
        facade.registerProxy(new SystemManagerProxy());
        facade.registerProxy(new HintsProxy());
        facade.registerProxy(new JavaScriptDelayedCallsProxy(new Vector.<INotification>()));
    }
}
}
