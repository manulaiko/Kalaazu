package package_224 {

import org.puremvc.as3.multicore.patterns.command.AsyncMacroCommand;

import package_314.class_1787;
import package_314.class_1791;
import package_314.class_1792;
import package_314.class_1794;

import package_315.class_1788;
import package_315.class_1789;
import package_315.class_1790;

import package_316.class_1793;

public class class_1277 extends AsyncMacroCommand {


    public function class_1277() {
        super();
    }

    override protected function initializeAsyncMacroCommand(): void {
        addSubCommand(class_1789);
        addSubCommand(class_1794);
        addSubCommand(class_1790);
        addSubCommand(class_1792);
        addSubCommand(class_1787);
        addSubCommand(class_1791);
        addSubCommand(class_1793);
        addSubCommand(class_1788);
    }
}
}
