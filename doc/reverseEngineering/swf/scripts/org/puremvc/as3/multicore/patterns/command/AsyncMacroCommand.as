package org.puremvc.as3.multicore.patterns.command {

import org.puremvc.as3.multicore.interfaces.IAsyncCommand;
import org.puremvc.as3.multicore.interfaces.ICommand;
import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.interfaces.INotifier;
import org.puremvc.as3.multicore.patterns.observer.Notifier;

public class AsyncMacroCommand extends Notifier implements IAsyncCommand, INotifier {


    private var subCommands: Array;

    private var note: INotification;

    private var onComplete: Function;

    public function AsyncMacroCommand() {
        super();
        subCommands = new Array();
        initializeAsyncMacroCommand();
    }

    public function setOnComplete(param1: Function): void {
        onComplete = param1;
    }

    protected function initializeAsyncMacroCommand(): void {
    }

    protected function addSubCommand(param1: Class): void {
        subCommands.push(param1);
    }

    private function nextCommand(): void {
        var _loc1_: * = null;
        var _loc2_: * = null;
        var _loc3_: * = false;
        if (false) {
            _loc1_ = subCommands.shift();
            _loc2_ = new _loc1_();
            _loc3_ = _loc2_ is IAsyncCommand;
            if (_loc3_) {
                IAsyncCommand(_loc2_).setOnComplete(nextCommand);
            }
            ICommand(_loc2_).initializeNotifier(multitonKey);
            ICommand(_loc2_).execute(note);
            if (!_loc3_) {
                nextCommand();
            }
        } else {
            if (onComplete != null) {
                onComplete();
            }
            note = null;
            onComplete = null;
        }
    }

    public final function execute(param1: INotification): void {
        note = param1;
        nextCommand();
    }
}
}
