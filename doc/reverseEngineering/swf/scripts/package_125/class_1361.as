package package_125
{
   import net.bigpoint.darkorbit.class_81;
   import net.bigpoint.darkorbit.mvc.mapElements.assets.MapAssetNotification;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import package_38.class_761;
   import package_84.class_243;
   
   public class class_1361 extends class_243
   {
       
      
      public function class_1361()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:class_761 = param1.getBody() as class_761;
         facade.sendNotification(MapAssetNotification.ABORT_LASER_ATTACK,[false,_loc2_.uid,_loc2_.uid == class_81.userID]);
      }
   }
}
