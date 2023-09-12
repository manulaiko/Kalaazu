package package_96 {

import net.bigpoint.darkorbit.mvc.common.view.components.resultHeader.control.LoadHeaderLibraryAsyncCommand;

import org.puremvc.as3.multicore.patterns.command.AsyncMacroCommand;

public class class_256 extends AsyncMacroCommand {


    public function class_256() {
        super();
    }

    override protected function initializeAsyncMacroCommand(): void {
        super.initializeAsyncMacroCommand();
        addSubCommand(LoadHeaderLibraryAsyncCommand);
        addSubCommand(class_1148);
        addSubCommand(class_1147);
        addSubCommand(class_1146);
    }
}
}
