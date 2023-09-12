package package_95 {

import net.bigpoint.darkorbit.mvc.gui.featuresMenu.controller.init.InitFeatureMenuCommand;
import net.bigpoint.darkorbit.mvc.gui.highlights.controller.InitHighlightingSystemCommand;
import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.controller.init.InitItemsControlMenuCommand;

import org.puremvc.as3.multicore.patterns.command.AsyncMacroCommand;

import package_353.class_1996;
import package_353.class_1998;
import package_353.class_1999;
import package_353.class_2001;
import package_353.class_2002;

import package_87.class_1997;

public class class_1685 extends AsyncMacroCommand {


    public function class_1685() {
        super();
    }

    override protected function initializeAsyncMacroCommand(): void {
        addSubCommand(class_2002);
        addSubCommand(class_2000);
        addSubCommand(class_1995);
        addSubCommand(class_1999);
        addSubCommand(class_1997);
        addSubCommand(class_1998);
        addSubCommand(class_2001);
        addSubCommand(InitItemsControlMenuCommand);
        addSubCommand(InitFeatureMenuCommand);
        addSubCommand(class_1996);
        addSubCommand(InitHighlightingSystemCommand);
    }
}
}
