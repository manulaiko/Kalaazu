package net.bigpoint.darkorbit.mvc.mapElements.assets.viewBuilder.commands {

import org.puremvc.as3.multicore.patterns.command.AsyncMacroCommand;

public class LoadMapAssetViewCommand extends AsyncMacroCommand {


    public function LoadMapAssetViewCommand() {
        super();
    }

    override protected function initializeAsyncMacroCommand(): void {
        super.initializeAsyncMacroCommand();
        addSubCommand(LoadMapAssetXMLCommand);
        addSubCommand(SetXMLDataCommand);
        addSubCommand(ParseMapAssetXMLCommand);
        addSubCommand(LoadTextureAndAtlasCommand);
        addSubCommand(CreateMapAssetViewCommand);
    }
}
}
