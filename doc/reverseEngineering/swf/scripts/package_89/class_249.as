package package_89 {

import org.puremvc.as3.multicore.patterns.command.MacroCommand;

import package_187.class_1114;

public class class_249 extends MacroCommand {


    public function class_249() {
        super();
    }

    override protected function initializeMacroCommand(): void {
        super.initializeMacroCommand();
        addSubCommand(class_1114);
    }
}
}
