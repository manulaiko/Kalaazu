package package_240
{
   import net.bigpoint.darkorbit.map.model.ship.class_378;
   import net.bigpoint.darkorbit.map.model.ship.class_86;
   import package_101.class_1176;
   import package_115.class_316;
   import package_130.class_1470;
   
   public class class_1476 implements class_1470
   {
       
      
      public function class_1476()
      {
         super();
      }
      
      public function method_765(param1:int, param2:class_316, param3:int, param4:Object = null) : class_86
      {
         var _loc5_:class_86;
         (_loc5_ = new class_86(param1,param2,new class_1176())).addTrait(new class_378());
         return _loc5_;
      }
   }
}
