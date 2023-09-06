package org.puremvc.as3.multicore.interfaces
{
   public interface IView
   {
       
      
      function notifyObservers(param1:INotification) : void;
      
      function registerMediator(param1:IMediator) : void;
      
      function removeMediator(param1:String) : IMediator;
      
      function registerObserver(param1:String, param2:IObserver) : void;
      
      function removeObserver(param1:String, param2:Object) : void;
      
      function hasMediator(param1:String) : Boolean;
      
      function retrieveMediator(param1:String) : IMediator;
   }
}
