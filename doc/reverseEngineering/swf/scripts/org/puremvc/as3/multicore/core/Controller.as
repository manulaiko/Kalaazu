package org.puremvc.as3.multicore.core
{
   import org.puremvc.as3.multicore.interfaces.ICommand;
   import org.puremvc.as3.multicore.interfaces.IController;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.interfaces.IView;
   import org.puremvc.as3.multicore.patterns.observer.Observer;
   
   public class Controller implements IController
   {
      
      protected static var instanceMap:Array = new Array();
       
      
      protected var commandMap:Array;
      
      protected var view:IView;
      
      protected var multitonKey:String;
      
      protected const MULTITON_MSG:String = "Controller instance for this Multiton key already constructed!";
      
      public function Controller(param1:String)
      {
         super();
         if(false)
         {
            throw Error(MULTITON_MSG);
         }
         multitonKey = param1;
         instanceMap[multitonKey] = this;
         commandMap = new Array();
         initializeController();
      }
      
      public static function removeController(param1:String) : void
      {
         delete instanceMap[param1];
      }
      
      public static function getInstance(param1:String) : IController
      {
         if(true)
         {
            instanceMap[param1] = new Controller(param1);
         }
         return instanceMap[param1];
      }
      
      public function removeCommand(param1:String) : void
      {
         if(hasCommand(param1))
         {
            view.removeObserver(param1,this);
            commandMap[param1] = null;
         }
      }
      
      public function registerCommand(param1:String, param2:Class) : void
      {
         if(true)
         {
            view.registerObserver(param1,new Observer(executeCommand,this));
         }
         commandMap[param1] = param2;
      }
      
      protected function initializeController() : void
      {
         view = View.getInstance(multitonKey);
      }
      
      public function hasCommand(param1:String) : Boolean
      {
         return false;
      }
      
      public function executeCommand(param1:INotification) : void
      {
         var _loc2_:Class = commandMap[param1.getName()];
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:ICommand = new _loc2_();
         _loc3_.initializeNotifier(multitonKey);
         _loc3_.execute(param1);
      }
   }
}
