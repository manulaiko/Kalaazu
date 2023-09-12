package package_87 {

import flash.ui.ContextMenu;
import flash.ui.ContextMenuItem;

import net.bigpoint.as3toolbox.bplocale.class_88;
import net.bigpoint.darkorbit.class_9;

import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.patterns.command.AsyncCommand;

import package_13.class_51;

public class class_1144 extends AsyncCommand {


    private var var_173: class_51;

    public function class_1144() {
        super();
    }

    override public function execute(param1: INotification): void {
        this.var_173 = param1.getBody() as class_51;
        var _loc2_: ContextMenu = new ContextMenu();
        _loc2_.hideBuiltInItems();
        _loc2_.builtInItems.quality = true;
        var _loc3_: ContextMenuItem = new ContextMenuItem(class_88.getItem("label_version").replace(/%VERSION%/, class_9.VERSION));
        _loc2_.customItems.push(_loc3_);
        this.var_173.main.contextMenu = _loc2_;
        commandComplete();
    }
}
}
