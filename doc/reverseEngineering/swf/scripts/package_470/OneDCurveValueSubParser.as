package package_470
{
   import package_438.class_2421;
   import package_466.class_2598;
   import package_485.OneDCurveSetter;
   
   public class OneDCurveValueSubParser extends class_2421
   {
       
      
      public function OneDCurveValueSubParser(param1:String)
      {
         super(param1,const_1615);
      }
      
      public static function get identifier() : *
      {
         return class_2598.OneDCurveValueSubParser;
      }
      
      override public function method_5169(param1:*, param2:Number = 30) : void
      {
         super.method_5169(param1,param2);
         var_4689 = new OneDCurveSetter(var_78,_data.anchorDatas);
      }
   }
}
