package package_468
{
   import package_438.class_2421;
   import package_466.class_2598;
   import package_484.class_2724;
   
   public class ThreeDSphereValueSubParser extends class_2421
   {
       
      
      public function ThreeDSphereValueSubParser(param1:String)
      {
         super(param1,const_1615);
      }
      
      public static function get identifier() : *
      {
         return class_2598.ThreeDSphereValueSubParser;
      }
      
      override public function method_5169(param1:*, param2:Number = 30) : void
      {
         super.method_5169(param1,param2);
         var_4689 = new class_2724(var_78,_data.innerRadius,_data.outerRadius,_data.centerX,_data.centerY,_data.centerZ);
      }
   }
}
