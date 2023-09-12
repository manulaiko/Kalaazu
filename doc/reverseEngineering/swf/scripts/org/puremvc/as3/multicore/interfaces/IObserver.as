package org.puremvc.as3.multicore.interfaces {

public interface IObserver {


    function compareNotifyContext(param1: Object): Boolean;

    function setNotifyContext(param1: Object): void;

    function setNotifyMethod(param1: Function): void;

    function notifyObserver(param1: INotification): void;
}
}
