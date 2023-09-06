package package_214
{
   import net.bigpoint.darkorbit.gui.class_187;
   import net.bigpoint.darkorbit.mvc.common.utils.TextUtils;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import package_38.class_873;
   import package_84.class_243;
   
   public class class_1450 extends class_243
   {
       
      
      public function class_1450()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc3_:* = null;
         super.execute(param1);
         var _loc2_:class_873 = param1.getBody() as class_873;
         _loc3_ = TextUtils.getTooltipTextByMessageLocalizedWildcardCommand(_loc2_.message);
         if(_loc2_.style == class_873.const_15)
         {
            switch(_loc2_.visibility)
            {
               case class_873.LOG:
                  guiManager.writeToLog(_loc3_,class_187.const_413);
                  break;
               case class_873.const_2091:
                  guiManager.writeToLog(_loc3_,class_187.const_413);
                  guiManager.method_4761(_loc3_);
                  break;
               case class_873.SCREEN:
                  guiManager.method_4761(_loc3_);
            }
         }
         else
         {
            switch(_loc2_.visibility)
            {
               case class_873.LOG:
                  guiManager.writeToLog(_loc3_,class_187.const_413);
                  break;
               case class_873.const_2091:
                  guiManager.method_6055(_loc3_);
                  guiManager.writeToLog(_loc3_,class_187.const_413);
                  break;
               case class_873.SCREEN:
                  guiManager.method_6055(_loc3_);
            }
         }
      }
   }
}
