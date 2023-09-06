package package_423
{
   import net.bigpoint.darkorbit.class_126;
   import net.bigpoint.darkorbit.map.common.IDisposable;
   import net.bigpoint.darkorbit.map.model.ship.class_1860;
   import net.bigpoint.darkorbit.map.model.ship.class_86;
   import net.bigpoint.darkorbit.settings.Settings;
   import package_360.class_2084;
   import package_360.class_2381;
   
   public class class_2382 extends class_2381 implements IDisposable
   {
       
      
      private var var_127:class_2084;
      
      public function class_2382(param1:class_1860, param2:class_2084)
      {
         super();
         this.var_127 = param2;
         this.method_3478();
         this.var_127.base.loaded.add(this.method_3478);
      }
      
      private function method_3478() : void
      {
         var _loc1_:* = null;
         if(this.ship.shipPattern.podType != class_126.const_576)
         {
            method_2447 = this.ship.rotation;
            if(Settings.qualityShip.value > Settings.QUALITY_LOW)
            {
               _loc1_ = this.ship.shipPattern.method_41(this.ship.info.factionID.value).srcKey;
               load(_loc1_,"mc");
            }
            else
            {
               load("replacementShips","ship49_pod");
            }
         }
         else
         {
            clip = null;
         }
      }
      
      private function get ship() : class_86
      {
         return this.var_127.ship;
      }
      
      override public function disposeView(param1:Boolean = false) : void
      {
         this.var_127.base.loaded.remove(this.method_3478);
         super.disposeView(param1);
      }
   }
}
