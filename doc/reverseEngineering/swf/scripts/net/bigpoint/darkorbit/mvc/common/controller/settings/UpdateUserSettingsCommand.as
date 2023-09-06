package net.bigpoint.darkorbit.mvc.common.controller.settings
{
   import org.puremvc.as3.multicore.interfaces.INotification;
   import package_37.class_363;
   import package_38.class_638;
   import package_84.class_243;
   
   public class UpdateUserSettingsCommand extends class_243
   {
       
      
      public function UpdateUserSettingsCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:class_638 = param1.getBody() as class_638;
         if(_loc2_)
         {
            class_363.execute(_loc2_.var_4239);
            if(!_loc2_.var_4114.var_1922)
            {
               class_363.execute(_loc2_.var_4114);
            }
            else
            {
               guiManager.method_6344 = true;
            }
            if(!_loc2_.var_2076.var_1922)
            {
               class_363.execute(_loc2_.var_2076);
            }
            else
            {
               guiManager.method_3963 = true;
            }
            if(!_loc2_.var_4616.var_1922)
            {
               class_363.execute(_loc2_.var_4616);
            }
            else
            {
               guiManager.method_5295 = true;
            }
            if(!_loc2_.var_687.var_1922)
            {
               class_363.execute(_loc2_.var_687);
            }
            else
            {
               guiManager.setDefaultQualitySettings = true;
            }
            if(_loc2_.var_3004 != null)
            {
               class_363.execute(_loc2_.var_3004);
            }
            guiManager.method_1298();
         }
      }
   }
}
