package org.puremvc.as3.multicore.interfaces {

public interface IModel {


    function removeProxy(param1: String): IProxy;

    function retrieveProxy(param1: String): IProxy;

    function registerProxy(param1: IProxy): void;

    function hasProxy(param1: String): Boolean;
}
}
