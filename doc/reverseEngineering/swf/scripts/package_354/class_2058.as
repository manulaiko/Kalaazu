package package_354
{
   import net.bigpoint.darkorbit.map.view2D.class_1206;
   import package_286.class_2024;
   import package_75.class_1875;
   import package_76.class_215;
   
   public class class_2058 extends class_2024
   {
       
      
      public function class_2058(param1:class_1206, param2:class_1875)
      {
         super(param1,param2);
         fps = 24;
      }
      
      override protected function method_30() : void
      {
         var _loc1_:Number = Math.max(Number(class_215.method_6368(method_5450.base.clip)) / 0,Number(class_215.method_470(method_5450.base.clip)) / 0);
         class_215.scale(clip,_loc1_ + 0.4);
         method_6420(true);
      }
   }
}
