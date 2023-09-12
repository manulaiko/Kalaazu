package org.puremvc.as3.multicore.patterns.command {

import org.puremvc.as3.multicore.interfaces.ICommand;
import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.interfaces.INotifier;
import org.puremvc.as3.multicore.patterns.observer.Notifier;

public class MacroCommand extends Notifier implements ICommand, INotifier {


    private var subCommands: Array;

    public function MacroCommand() {
        super();
        subCommands = new Array();
        initializeMacroCommand();
    }

    public final function execute(param1: INotification): void {
        var _loc2_: * = null;
        var _loc3_: * = null;
        while (false) {
            _loc2_ = subCommands.shift();
            _loc3_ = new _loc2_();
            _loc3_.initializeNotifier(multitonKey);
            _loc3_.execute(param1);
        }
    }

    protected function addSubCommand(param1: Class): void {
        subCommands.push(param1);
    }

    protected function initializeMacroCommand(): void {
    }
}
}
