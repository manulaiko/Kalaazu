package net.bigpoint.darkorbit.mvc.mapElements.common.controller
{
   import net.bigpoint.darkorbit.map.model.traits.class_1180;
   import net.bigpoint.darkorbit.mvc.common.sounds.SoundNotifications;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import package_29.class_85;
   import package_38.class_886;
   import package_84.class_243;
   
   public class MapAssetIconAddHighlightHandlerCommand extends class_243
   {
       
      
      public function MapAssetIconAddHighlightHandlerCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc4_:* = null;
         var _loc2_:class_886 = param1.getBody() as class_886;
         var _loc3_:class_85 = name_47.map.method_327(_loc2_.var_3184);
         if(_loc3_)
         {
            if(_loc4_ = _loc3_.method_1954(class_1180) as class_1180)
            {
               _loc4_.highlight.value = true;
            }
            sendNotification(SoundNotifications.PLAY_SOUND_TRIGGER_MODULE,_loc2_.var_3770);
         }
      }
   }
}
