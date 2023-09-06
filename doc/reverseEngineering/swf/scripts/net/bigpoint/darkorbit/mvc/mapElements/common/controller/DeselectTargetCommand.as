package net.bigpoint.darkorbit.mvc.mapElements.common.controller
{
   import org.puremvc.as3.multicore.interfaces.INotification;
   import package_84.class_243;
   
   public class DeselectTargetCommand extends class_243
   {
       
      
      public function DeselectTargetCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         if(map)
         {
            map.method_4929.target = null;
         }
      }
   }
}
