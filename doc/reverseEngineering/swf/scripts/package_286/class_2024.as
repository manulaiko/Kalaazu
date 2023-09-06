package package_286
{
   import net.bigpoint.darkorbit.map.model.ship.class_86;
   import net.bigpoint.darkorbit.map.model.traits.class_309;
   import net.bigpoint.darkorbit.map.view2D.class_1206;
   import package_35.class_348;
   import package_360.class_2084;
   
   public class class_2024 extends class_2019
   {
       
      
      public function class_2024(param1:class_1206, param2:class_348, param3:Boolean = true, param4:Boolean = true, param5:Boolean = true)
      {
         super(param1,param2,param3,param4,param5);
      }
      
      protected function get ship() : class_86
      {
         return !!effect ? (effect as class_348).source as class_86 : null;
      }
      
      protected function get method_5450() : class_2084
      {
         return method_3528.method_5826.method_6501(this.ship.method_1954(class_309)) as class_2084;
      }
   }
}
