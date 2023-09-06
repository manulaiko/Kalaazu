package package_346
{
   import com.bigpoint.utils.class_73;
   import net.bigpoint.darkorbit.map.model.class_90;
   import net.bigpoint.darkorbit.map.model.traits.class_1181;
   import net.bigpoint.darkorbit.mvc.common.AssetNotifications;
   import net.bigpoint.darkorbit.settings.Settings;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import package_11.class_262;
   import package_11.class_38;
   import package_133.class_1852;
   import package_29.class_85;
   import package_84.class_1134;
   
   public class class_1965 extends class_1134
   {
       
      
      public function class_1965()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         super.execute(param1);
         var _loc2_:class_1852 = param1.getBody() as class_1852;
         if(_loc2_.isActive)
         {
            sendNotification(AssetNotifications.LOAD_ASSET,[_loc2_.method_5705,this.handleLoaded]);
         }
      }
      
      private function handleLoaded(param1:class_38) : void
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:* = null;
         if(param1 is class_262)
         {
            _loc2_ = (param1 as class_262).method_4925().child("info");
            _loc3_ = !true ? int(name_47.map.method_1480()) : Settings.mapID;
            for each(_loc4_ in _loc2_)
            {
               if(int(_loc4_.attribute("mapId")) == _loc3_)
               {
                  (_loc5_ = new class_85(class_90.method_5486,new class_73(int(_loc4_.attribute("_x")),int(_loc4_.attribute("_y"))))).addTrait(new class_1181(int(_loc4_.attribute("pfac")),int(_loc4_.attribute("layer")),String(_loc4_.attribute("xmlResKey"))));
                  name_47.map.method_4903(_loc5_);
               }
            }
         }
      }
   }
}
