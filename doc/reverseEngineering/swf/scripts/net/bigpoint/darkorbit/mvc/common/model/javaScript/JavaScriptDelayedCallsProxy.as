package net.bigpoint.darkorbit.mvc.common.model.javaScript {

import net.bigpoint.darkorbit.mvc.common.JavaScriptCallNotification;

import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.patterns.proxy.Proxy;

public class JavaScriptDelayedCallsProxy extends Proxy {

    public static const NAME: String = "JavaScriptDelayedCallsProxy";


    public function JavaScriptDelayedCallsProxy(param1: Object = null) {
        super(NAME, param1);
    }

    private function get javaScriptCallbacks(): Vector.<INotification> {
        return data as Vector.<INotification>;
    }

    public function addJavaScriptCallbackNotification(param1: INotification): void {
        this.javaScriptCallbacks.push(param1);
    }

    public function callAllDelayedCalls(): void {
        var _loc1_: * = null;
        while (this.javaScriptCallbacks.length > 0) {
            _loc1_ = this.javaScriptCallbacks.pop();
            sendNotification(JavaScriptCallNotification.CALL_JAVA_SCRIPT, _loc1_.getBody(), _loc1_.getType());
        }
    }
}
}
