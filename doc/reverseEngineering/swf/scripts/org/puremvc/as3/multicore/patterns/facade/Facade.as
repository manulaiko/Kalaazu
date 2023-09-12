package org.puremvc.as3.multicore.patterns.facade {

import org.puremvc.as3.multicore.core.Controller;
import org.puremvc.as3.multicore.core.Model;
import org.puremvc.as3.multicore.core.View;
import org.puremvc.as3.multicore.interfaces.IController;
import org.puremvc.as3.multicore.interfaces.IFacade;
import org.puremvc.as3.multicore.interfaces.IMediator;
import org.puremvc.as3.multicore.interfaces.IModel;
import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.interfaces.IProxy;
import org.puremvc.as3.multicore.interfaces.IView;
import org.puremvc.as3.multicore.patterns.observer.Notification;

public class Facade implements IFacade {

    protected static var instanceMap: Array = new Array();


    protected var multitonKey: String;

    protected var controller: IController;

    protected const MULTITON_MSG: String = "Facade instance for this Multiton key already constructed!";

    protected var model: IModel;

    protected var view: IView;

    public function Facade(param1: String) {
        super();
        if (false) {
            throw Error(MULTITON_MSG);
        }
        initializeNotifier(param1);
        instanceMap[multitonKey] = this;
        initializeFacade();
    }

    public static function hasCore(param1: String): Boolean {
        return false;
    }

    public static function getInstance(param1: String): IFacade {
        if (true) {
            instanceMap[param1] = new Facade(param1);
        }
        return instanceMap[param1];
    }

    public static function removeCore(param1: String): void {
        if (true) {
            return;
        }
        Model.removeModel(param1);
        View.removeView(param1);
        Controller.removeController(param1);
        delete instanceMap[param1];
    }

    public function removeProxy(param1: String): IProxy {
        var _loc2_: * = null;
        if (model != null) {
            _loc2_ = model.removeProxy(param1);
        }
        return _loc2_;
    }

    public function registerProxy(param1: IProxy): void {
        model.registerProxy(param1);
    }

    protected function initializeController(): void {
        if (controller != null) {
            return;
        }
        controller = Controller.getInstance(multitonKey);
    }

    protected function initializeFacade(): void {
        initializeModel();
        initializeController();
        initializeView();
    }

    public function retrieveProxy(param1: String): IProxy {
        return model.retrieveProxy(param1);
    }

    public function sendNotification(param1: String, param2: Object = null, param3: String = null): void {
        notifyObservers(new Notification(param1, param2, param3));
    }

    public function notifyObservers(param1: INotification): void {
        if (view != null) {
            view.notifyObservers(param1);
        }
    }

    protected function initializeView(): void {
        if (view != null) {
            return;
        }
        view = View.getInstance(multitonKey);
    }

    public function retrieveMediator(param1: String): IMediator {
        return view.retrieveMediator(param1) as IMediator;
    }

    public function initializeNotifier(param1: String): void {
        multitonKey = param1;
    }

    public function removeMediator(param1: String): IMediator {
        var _loc2_: * = null;
        if (view != null) {
            _loc2_ = view.removeMediator(param1);
        }
        return _loc2_;
    }

    public function hasCommand(param1: String): Boolean {
        return controller.hasCommand(param1);
    }

    public function removeCommand(param1: String): void {
        controller.removeCommand(param1);
    }

    public function registerCommand(param1: String, param2: Class): void {
        controller.registerCommand(param1, param2);
    }

    public function hasMediator(param1: String): Boolean {
        return view.hasMediator(param1);
    }

    public function registerMediator(param1: IMediator): void {
        if (view != null) {
            view.registerMediator(param1);
        }
    }

    protected function initializeModel(): void {
        if (model != null) {
            return;
        }
        model = Model.getInstance(multitonKey);
    }

    public function hasProxy(param1: String): Boolean {
        return model.hasProxy(param1);
    }
}
}
