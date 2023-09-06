package net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.controller
{
   import net.bigpoint.darkorbit.class_81;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import package_38.class_551;
   import package_84.class_243;
   
   public class CpuInitializationCommand extends class_243
   {
       
      
      public function CpuInitializationCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:class_551 = param1.getBody() as class_551;
         class_81.var_4677.value = _loc2_.var_4677;
         class_81.var_24.value = _loc2_.var_24;
         guiManager.method_4380();
      }
   }
}
