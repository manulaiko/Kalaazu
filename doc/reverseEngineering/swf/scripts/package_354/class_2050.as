package package_354
{
   import net.bigpoint.darkorbit.map.model.ship.class_1861;
   import net.bigpoint.darkorbit.map.view2D.class_1206;
   import package_286.class_2024;
   import package_35.class_348;
   import package_423.class_2355;
   
   public class class_2050 extends class_2024
   {
       
      
      private const const_2662:int = 11;
      
      public function class_2050(param1:class_1206, param2:class_348)
      {
         super(param1,param2);
      }
      
      override protected function method_30() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         method_6321(1,true,true,3);
         if(method_5450)
         {
            _loc1_ = (effect as class_348).source.method_1954(class_1861) as class_1861;
            if(_loc1_)
            {
               _loc2_ = method_5450.method_6046(_loc1_) as class_2355;
               if(_loc2_.method_6491 < 0)
               {
                  _loc2_.method_1450(11);
               }
            }
         }
      }
   }
}
