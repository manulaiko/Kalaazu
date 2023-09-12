package net.bigpoint.darkorbit.mvc.common.controller.assets.init {

import net.bigpoint.darkorbit.mvc.common.controller.assets.CleanupExternalLoaderCommand;
import net.bigpoint.darkorbit.mvc.common.controller.assets.FileCollectionCleanupCommand;

import org.puremvc.as3.multicore.patterns.command.MacroCommand;

import package_274.class_2315;

public class CleanUpAssetsProxy extends MacroCommand {


    public function CleanUpAssetsProxy() {
        super();
    }

    override protected function initializeMacroCommand(): void {
        super.initializeMacroCommand();
        addSubCommand(FileCollectionCleanupCommand);
        addSubCommand(CleanupExternalLoaderCommand);
        addSubCommand(class_2315);
    }
}
}
