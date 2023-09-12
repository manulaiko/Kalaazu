package package_95 {

import org.puremvc.as3.multicore.patterns.command.MacroCommand;

import package_210.class_1683;

import package_273.class_1679;

import package_274.class_1680;

import package_275.class_1681;

import package_276.class_1682;

public class class_1137 extends MacroCommand {


    public function class_1137() {
        super();
    }

    override protected function initializeMacroCommand(): void {
        super.initializeMacroCommand();
        addSubCommand(class_1684);
        addSubCommand(class_1679);
        addSubCommand(class_1682);
        addSubCommand(class_1680);
        addSubCommand(class_1683);
        addSubCommand(class_1678);
        addSubCommand(class_1681);
    }
}
}
