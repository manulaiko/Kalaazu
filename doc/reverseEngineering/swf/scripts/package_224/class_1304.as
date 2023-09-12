package package_224 {

import org.puremvc.as3.multicore.patterns.command.AsyncMacroCommand;

import package_314.class_1792;

import package_315.class_1789;
import package_315.class_1790;

import package_316.class_1798;

import package_319.class_1799;

public class class_1304 extends AsyncMacroCommand {


    public function class_1304() {
        super();
    }

    override protected function initializeAsyncMacroCommand(): void {
        addSubCommand(class_1789);
        addSubCommand(class_1790);
        addSubCommand(class_1792);
        addSubCommand(class_1799);
        addSubCommand(class_1798);
    }
}
}
