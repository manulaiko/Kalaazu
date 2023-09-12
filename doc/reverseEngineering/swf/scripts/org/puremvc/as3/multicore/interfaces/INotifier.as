package org.puremvc.as3.multicore.interfaces {

public interface INotifier {


    function sendNotification(param1: String, param2: Object = null, param3: String = null): void;

    function initializeNotifier(param1: String): void;
}
}
