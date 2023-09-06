package package_240
{
   import net.bigpoint.darkorbit.class_81;
   import net.bigpoint.darkorbit.map.model.ship.class_86;
   import package_100.class_270;
   import package_101.class_1176;
   import package_101.class_1857;
   import package_101.class_1858;
   import package_101.class_271;
   import package_115.class_316;
   import package_130.class_1470;
   import package_38.class_387;
   
   public class class_1471 implements class_1470
   {
       
      
      private const const_522:Object = new Object();
      
      public function class_1471()
      {
         super();
         this.const_522[class_387.DEFAULT] = class_1176;
         this.const_522[class_387.const_2756] = class_1858;
         this.const_522[class_387.const_2007] = class_1857;
      }
      
      public function method_765(param1:int, param2:class_316, param3:int, param4:Object = null) : class_86
      {
         var _loc5_:* = null;
         var _loc6_:* = null;
         if(param1 == class_81.userID)
         {
            _loc5_ = new class_271();
         }
         else
         {
            _loc5_ = new (_loc6_ = this.const_522[param3] as Class || class_1176)();
         }
         return new class_86(param1,param2 as class_316,_loc5_);
      }
   }
}
