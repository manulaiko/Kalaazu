package org.puremvc.as3.multicore.patterns.mediator
{
   import org.puremvc.as3.multicore.interfaces.IMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.interfaces.INotifier;
   import org.puremvc.as3.multicore.patterns.observer.Notifier;
   
   public class Mediator extends Notifier implements IMediator, INotifier
   {
      
      public static const NAME:String = "Mediator";
       
      
      protected var viewComponent:Object;
      
      protected var mediatorName:String;
      
      public function Mediator(param1:String = null, param2:Object = null)
      {
         super();
         this.mediatorName = param1 != null ? param1 : NAME;
         this.viewComponent = param2;
      }
      
      public function listNotificationInterests() : Array
      {
         return [];
      }
      
      public function onRegister() : void
      {
      }
      
      public function onRemove() : void
      {
      }
      
      public function getViewComponent() : Object
      {
         return viewComponent;
      }
      
      public function handleNotification(param1:INotification) : void
      {
      }
      
      public function getMediatorName() : String
      {
         return mediatorName;
      }
      
      public function setViewComponent(param1:Object) : void
      {
         this.viewComponent = param1;
      }
   }
}
