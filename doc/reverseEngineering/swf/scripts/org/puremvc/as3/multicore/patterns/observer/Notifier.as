package org.puremvc.as3.multicore.patterns.observer
{
   import org.puremvc.as3.multicore.interfaces.IFacade;
   import org.puremvc.as3.multicore.interfaces.INotifier;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class Notifier implements INotifier
   {
       
      
      protected var multitonKey:String;
      
      protected const MULTITON_MSG:String = "multitonKey for this Notifier not yet initialized!";
      
      public function Notifier()
      {
         super();
      }
      
      public function sendNotification(param1:String, param2:Object = null, param3:String = null) : void
      {
         if(facade != null)
         {
            facade.sendNotification(param1,param2,param3);
         }
      }
      
      protected function get facade() : IFacade
      {
         if(multitonKey == null)
         {
            throw Error(MULTITON_MSG);
         }
         return Facade.getInstance(multitonKey);
      }
      
      public function initializeNotifier(param1:String) : void
      {
         multitonKey = param1;
      }
   }
}
