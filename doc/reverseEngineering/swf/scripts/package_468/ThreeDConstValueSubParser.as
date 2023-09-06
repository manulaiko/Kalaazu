package package_468
{
   import flash.geom.Vector3D;
   import package_438.class_2421;
   import package_466.class_2598;
   import package_484.class_2694;
   
   public class ThreeDConstValueSubParser extends class_2421
   {
       
      
      public function ThreeDConstValueSubParser(param1:String)
      {
         super(param1,const_376);
      }
      
      public static function get identifier() : *
      {
         return class_2598.ThreeDConstValueSubParser;
      }
      
      override public function method_5169(param1:*, param2:Number = 30) : void
      {
         super.method_5169(param1,param2);
         var_4689 = new class_2694(var_78,new Vector3D(_data.x,_data.y,_data.z));
      }
   }
}
