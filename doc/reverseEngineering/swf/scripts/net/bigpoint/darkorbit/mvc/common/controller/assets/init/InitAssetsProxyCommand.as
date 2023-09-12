package net.bigpoint.darkorbit.mvc.common.controller.assets.init {

import org.puremvc.as3.multicore.patterns.command.AsyncMacroCommand;

public class InitAssetsProxyCommand extends AsyncMacroCommand {


    public function InitAssetsProxyCommand() {
        super();
    }

    override protected function initializeAsyncMacroCommand(): void {
        super.initializeAsyncMacroCommand();
        addSubCommand(InitGameFileCollectionCommand);
        addSubCommand(InitLocalFileCollectionCommand);
        addSubCommand(InitAchievementsFileCollectionCommand);
        addSubCommand(InitItemFileCollectionCommand);
        addSubCommand(InitUberLibraryCommand);
        addSubCommand(AssetsControllerPrepCommand);
    }
}
}
