package org.puremvc.as3.multicore.interfaces
{
   public interface IFacade extends INotifier
   {
       
      
      function removeCommand(param1:String) : void;
      
      function registerCommand(param1:String, param2:Class) : void;
      
      function removeProxy(param1:String) : IProxy;
      
      function registerProxy(param1:IProxy) : void;
      
      function hasMediator(param1:String) : Boolean;
      
      function retrieveMediator(param1:String) : IMediator;
      
      function hasCommand(param1:String) : Boolean;
      
      function retrieveProxy(param1:String) : IProxy;
      
      function notifyObservers(param1:INotification) : void;
      
      function registerMediator(param1:IMediator) : void;
      
      function removeMediator(param1:String) : IMediator;
      
      function hasProxy(param1:String) : Boolean;
   }
}
