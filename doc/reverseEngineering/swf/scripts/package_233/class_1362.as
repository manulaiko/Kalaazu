package package_233 {

import net.bigpoint.darkorbit.mvc.common.view.components.resultHeader.control.LoadHeaderLibraryAsyncCommand;

import org.puremvc.as3.multicore.patterns.command.AsyncMacroCommand;

public class class_1362 extends AsyncMacroCommand {


    public function class_1362() {
        super();
    }

    override protected function initializeAsyncMacroCommand(): void {
        super.initializeAsyncMacroCommand();
        addSubCommand(LoadHeaderLibraryAsyncCommand);
        addSubCommand(class_1821);
        addSubCommand(class_1822);
    }
}
}
