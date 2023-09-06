package net.bigpoint.darkorbit.mvc.mapElements.common.controller
{
   import net.bigpoint.darkorbit.map.model.traits.class_1180;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import package_38.class_756;
   import package_84.class_243;
   
   public class MapAssetIconRemoveHighlightHandlerCommand extends class_243
   {
       
      
      public function MapAssetIconRemoveHighlightHandlerCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:class_756 = param1.getBody() as class_756;
         var _loc3_:class_1180 = name_47.map.method_327(_loc2_.var_3184).method_1954(class_1180) as class_1180;
         if(_loc3_)
         {
            _loc3_.highlight.value = false;
         }
      }
   }
}
