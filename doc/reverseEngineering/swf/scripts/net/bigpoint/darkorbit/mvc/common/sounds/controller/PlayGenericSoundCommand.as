package net.bigpoint.darkorbit.mvc.common.sounds.controller
{
   import net.bigpoint.darkorbit.mvc.common.sounds.GenericSoundsConstants;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import package_38.class_762;
   import package_84.class_243;
   
   public class PlayGenericSoundCommand extends class_243
   {
       
      
      public function PlayGenericSoundCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:class_762 = param1.getBody() as class_762;
      }
   }
}
