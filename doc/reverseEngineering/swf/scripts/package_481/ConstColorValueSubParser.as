package package_481
{
   import flash.geom.ColorTransform;
   import package_438.class_2421;
   import package_466.class_2598;
   import package_491.class_2742;
   
   public class ConstColorValueSubParser extends class_2421
   {
       
      
      public function ConstColorValueSubParser(param1:String)
      {
         super(param1,const_376);
      }
      
      public static function get identifier() : *
      {
         return class_2598.ConstColorValueSubParser;
      }
      
      override public function method_5169(param1:*, param2:Number = 30) : void
      {
         super.method_5169(param1,param2);
         var_4689 = new class_2742(var_78,this.method_844(param1));
      }
      
      private function method_844(param1:Object) : ColorTransform
      {
         var _loc2_:ColorTransform = new ColorTransform();
         if(param1.hasOwnProperty("mr"))
         {
            _loc2_.redMultiplier = param1.mr;
         }
         if(param1.hasOwnProperty("mg"))
         {
            _loc2_.greenMultiplier = param1.mg;
         }
         if(param1.hasOwnProperty("mb"))
         {
            _loc2_.blueMultiplier = param1.mb;
         }
         if(param1.hasOwnProperty("ma"))
         {
            _loc2_.alphaMultiplier = param1.ma;
         }
         if(param1.hasOwnProperty("or"))
         {
            _loc2_.redOffset = param1.or;
         }
         if(param1.hasOwnProperty("og"))
         {
            _loc2_.greenOffset = param1.og;
         }
         if(param1.hasOwnProperty("ob"))
         {
            _loc2_.blueOffset = param1.ob;
         }
         if(param1.hasOwnProperty("oa"))
         {
            _loc2_.alphaOffset = param1.oa;
         }
         return _loc2_;
      }
   }
}
