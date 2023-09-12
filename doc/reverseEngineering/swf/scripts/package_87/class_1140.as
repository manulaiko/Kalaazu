package package_87 {

import com.greensock.plugins.ColorTransformPlugin;
import com.greensock.plugins.DynamicPropsPlugin;
import com.greensock.plugins.GlowFilterPlugin;
import com.greensock.plugins.IDisplayObject.TransformAroundCenterPluginIDisplayObject;
import com.greensock.plugins.IDisplayObject.TransformAroundPointPluginIDisplayObject;
import com.greensock.plugins.TransformAroundCenterPlugin;
import com.greensock.plugins.TweenPlugin;
import com.greensock.plugins.factoryPlugins.DynamicPropsPluginFactory;

import flash.display.Stage;
import flash.display.StageAlign;
import flash.display.StageScaleMode;

import net.bigpoint.darkorbit.class_9;
import net.bigpoint.darkorbit.net.class_96;

import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.patterns.command.AsyncCommand;

import package_13.class_51;

import package_15.class_54;

import package_17.class_62;

import package_27.class_82;

import package_37.class_170;

import package_9.class_1686;
import package_9.class_50;

public class class_1140 extends AsyncCommand {


    public function class_1140() {
        super();
    }

    override public function execute(param1: INotification): void {
        var _loc2_: class_51 = param1.getBody() as class_51;
        this.method_5991(_loc2_);
        commandComplete();
    }

    private function method_5991(param1: class_51): void {
        var _loc2_: class_9 = param1.main;
        var _loc3_: class_62 = class_62.getInstance();
        var _loc4_: Stage;
        (_loc4_ = param1.stage).stageFocusRect = false;
        _loc4_.align = StageAlign.TOP_LEFT;
        _loc4_.scaleMode = StageScaleMode.NO_SCALE;
        _loc4_.frameRate = 60;
        class_1686.method_3489(_loc2_);
        class_50.getInstance().init(_loc2_);
        class_96.method_3489(_loc2_);
        class_170.method_3489(_loc2_);
        class_82.init(_loc2_);
        class_170.method_2515(_loc3_);
        TweenPlugin.activate([TransformAroundCenterPlugin, ColorTransformPlugin, DynamicPropsPlugin, GlowFilterPlugin, TransformAroundCenterPluginIDisplayObject, TransformAroundPointPluginIDisplayObject, DynamicPropsPluginFactory]);
        _loc2_.name_47 = class_50.getInstance();
        _loc2_.name_161 = new class_54(_loc2_);
    }
}
}
