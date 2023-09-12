package org.puremvc.as3.multicore.interfaces {

public interface INotification {


    function getType(): String;

    function getName(): String;

    function toString(): String;

    function setBody(param1: Object): void;

    function getBody(): Object;

    function setType(param1: String): void;
}
}
