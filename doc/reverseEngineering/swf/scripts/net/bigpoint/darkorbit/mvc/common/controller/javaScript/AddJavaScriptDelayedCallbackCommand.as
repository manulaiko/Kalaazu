package net.bigpoint.darkorbit.mvc.common.controller.javaScript {

import net.bigpoint.darkorbit.mvc.common.model.javaScript.JavaScriptDelayedCallsProxy;

import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.patterns.command.SimpleCommand;

public class AddJavaScriptDelayedCallbackCommand extends SimpleCommand {


    public function AddJavaScriptDelayedCallbackCommand() {
        super();
    }

    override public function execute(param1: INotification): void {
        super.execute(param1);
        (facade.retrieveProxy(JavaScriptDelayedCallsProxy.NAME) as JavaScriptDelayedCallsProxy).addJavaScriptCallbackNotification(param1);
    }
}
}
