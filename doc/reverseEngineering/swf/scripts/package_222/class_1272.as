package package_222
{
   import net.bigpoint.darkorbit.mvc.common.sounds.SoundNotifications;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import package_25.class_272;
   import package_38.class_937;
   import package_84.class_243;
   
   public class class_1272 extends class_243
   {
       
      
      public function class_1272()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:class_937 = param1.getBody() as class_937;
         if(_loc2_.var_3280 >= 0 && _loc2_.var_15 >= 0)
         {
            name_47.minimap.method_1759(new class_272(_loc2_.uid,_loc2_.var_3280,_loc2_.var_15,_loc2_.count,"",_loc2_.interval,_loc2_.scale,_loc2_.inverse));
            sendNotification(SoundNotifications.PLAY_SOUND_TRIGGER_MODULE,_loc2_.var_3770);
         }
      }
   }
}
