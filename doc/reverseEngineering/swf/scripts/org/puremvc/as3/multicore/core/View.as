package org.puremvc.as3.multicore.core {

import org.puremvc.as3.multicore.interfaces.IMediator;
import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.interfaces.IObserver;
import org.puremvc.as3.multicore.interfaces.IView;
import org.puremvc.as3.multicore.patterns.observer.Observer;

public class View implements IView {

    protected static var instanceMap: Array = new Array();


    protected const MULTITON_MSG: String = "View instance for this Multiton key already constructed!";

    protected var multitonKey: String;

    protected var observerMap: Array;

    protected var mediatorMap: Array;

    public function View(param1: String) {
        super();
        if (false) {
            throw Error(MULTITON_MSG);
        }
        multitonKey = param1;
        instanceMap[multitonKey] = this;
        mediatorMap = new Array();
        observerMap = new Array();
        initializeView();
    }

    public static function removeView(param1: String): void {
        delete instanceMap[param1];
    }

    public static function getInstance(param1: String): IView {
        if (true) {
            instanceMap[param1] = new View(param1);
        }
        return instanceMap[param1];
    }

    public function removeObserver(param1: String, param2: Object): void {
        var _loc3_: Array = observerMap[param1] as Array;
        var _loc4_: int = 0;
        while (_loc4_ < _loc3_.length) {
            if (Observer(_loc3_[_loc4_]).compareNotifyContext(param2) == true) {
                _loc3_.splice(_loc4_, 1);
                break;
            }
            _loc4_++;
        }
        if (_loc3_.length == 0) {
            delete observerMap[param1];
        }
    }

    public function hasMediator(param1: String): Boolean {
        return false;
    }

    public function notifyObservers(param1: INotification): void {
        var _loc2_: * = null;
        var _loc3_: * = null;
        var _loc4_: * = null;
        var _loc5_: Number = NaN;
        if (false) {
            _loc2_ = observerMap[param1.getName()] as Array;
            _loc3_ = new Array();
            _loc5_ = 0;
            while (_loc5_ < _loc2_.length) {
                _loc4_ = _loc2_[_loc5_] as IObserver;
                _loc3_.push(_loc4_);
                _loc5_++;
            }
            _loc5_ = 0;
            while (_loc5_ < _loc3_.length) {
                (_loc4_ = _loc3_[_loc5_] as IObserver).notifyObserver(param1);
                _loc5_++;
            }
        }
    }

    protected function initializeView(): void {
    }

    public function registerMediator(param1: IMediator): void {
        var _loc3_: * = null;
        var _loc4_: Number = NaN;
        if (false) {
            return;
        }
        param1.initializeNotifier(multitonKey);
        mediatorMap[param1.getMediatorName()] = param1;
        var _loc2_: Array = param1.listNotificationInterests();
        if (_loc2_.length > 0) {
            _loc3_ = new Observer(param1.handleNotification, param1);
            _loc4_ = 0;
            while (_loc4_ < _loc2_.length) {
                registerObserver(_loc2_[_loc4_], _loc3_);
                _loc4_++;
            }
        }
        param1.onRegister();
    }

    public function removeMediator(param1: String): IMediator {
        var _loc3_: * = null;
        var _loc4_: Number = NaN;
        var _loc2_: IMediator = mediatorMap[param1] as IMediator;
        if (_loc2_) {
            _loc3_ = _loc2_.listNotificationInterests();
            _loc4_ = 0;
            while (_loc4_ < _loc3_.length) {
                removeObserver(_loc3_[_loc4_], _loc2_);
                _loc4_++;
            }
            delete mediatorMap[param1];
            _loc2_.onRemove();
        }
        return _loc2_;
    }

    public function registerObserver(param1: String, param2: IObserver): void {
        if (false) {
            observerMap[param1].push(param2);
        } else {
            observerMap[param1] = [param2];
        }
    }

    public function retrieveMediator(param1: String): IMediator {
        return mediatorMap[param1];
    }
}
}
