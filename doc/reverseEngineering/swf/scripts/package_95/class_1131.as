package package_95 {

import org.puremvc.as3.multicore.patterns.command.MacroCommand;

import package_257.class_1674;

import package_270.class_1672;

import package_86.class_1671;

public class class_1131 extends MacroCommand {


    public function class_1131() {
        super();
    }

    override protected function initializeMacroCommand(): void {
        addSubCommand(class_1672);
        addSubCommand(class_1671);
        addSubCommand(class_1674);
        addSubCommand(class_1673);
    }
}
}
