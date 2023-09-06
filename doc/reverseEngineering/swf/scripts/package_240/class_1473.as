package package_240
{
   import net.bigpoint.darkorbit.map.model.ship.class_1860;
   import net.bigpoint.darkorbit.map.model.ship.class_86;
   import package_115.class_316;
   
   public class class_1473 extends class_1471
   {
       
      
      public function class_1473()
      {
         super();
      }
      
      override public function method_765(param1:int, param2:class_316, param3:int, param4:Object = null) : class_86
      {
         var _loc5_:class_86;
         (_loc5_ = super.method_765(param1,param2,param3,param4) as class_86).addTrait(new class_1860());
         return _loc5_;
      }
   }
}
