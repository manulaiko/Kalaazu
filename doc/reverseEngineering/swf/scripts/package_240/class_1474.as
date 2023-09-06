package package_240
{
   import net.bigpoint.darkorbit.map.model.ship.class_378;
   import net.bigpoint.darkorbit.map.model.ship.class_86;
   import package_101.class_1175;
   import package_115.class_316;
   import package_130.class_1470;
   import package_131.class_380;
   
   public class class_1474 implements class_1470
   {
       
      
      public function class_1474()
      {
         super();
      }
      
      public function method_765(param1:int, param2:class_316, param3:int, param4:Object = null) : class_86
      {
         var _loc5_:* = null;
         var _loc6_:class_380;
         if(_loc6_ = param4 as class_380)
         {
            _loc5_ = new class_86(param1,param2,new class_1175());
            class_378.method_569(_loc6_.method_6048,_loc5_,_loc6_.method_5059);
         }
         return _loc5_;
      }
   }
}
