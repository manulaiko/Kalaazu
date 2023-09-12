package net.bigpoint.darkorbit.mvc.common.model.pattern.proxy {

import flash.events.Event;
import flash.net.URLLoader;

import net.bigpoint.darkorbit.class_9;
import net.bigpoint.darkorbit.mvc.common.model.AbstractLoadProxy;

import package_22.class_198;

public class PatternManagerProxy extends AbstractLoadProxy {

    public static const NAME: String = "PatternManagerProxy";


    public function PatternManagerProxy() {
        super(NAME);
    }

    override public function load(param1: String, param2: Function = null): void {
        super.load(param1, param2);
    }

    public function init(param1: XML): void {
        class_9.var_2751 = param1;
        class_198.method_3072(class_9.var_2751);
    }

    override protected function handleLoaded(param1: Event): void {
        super.handleLoaded(param1);
        this.init(new XML((param1.currentTarget as URLLoader).data));
        executeCallback();
    }
}
}
