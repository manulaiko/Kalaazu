package starling.display
{
   import flash.display3D.Context3DBlendFactor;
   import starling.errors.AbstractClassError;
   
   public class BlendMode
   {
      
      private static var sBlendFactors:Array = [{
         "none":[Context3DBlendFactor.ONE,Context3DBlendFactor.ZERO],
         "normal":[Context3DBlendFactor.SOURCE_ALPHA,Context3DBlendFactor.ONE_MINUS_SOURCE_ALPHA],
         "add":[Context3DBlendFactor.SOURCE_ALPHA,Context3DBlendFactor.DESTINATION_ALPHA],
         "multiply":[Context3DBlendFactor.DESTINATION_COLOR,Context3DBlendFactor.ONE_MINUS_SOURCE_ALPHA],
         "screen":[Context3DBlendFactor.SOURCE_ALPHA,Context3DBlendFactor.ONE],
         "erase":[Context3DBlendFactor.ZERO,Context3DBlendFactor.ONE_MINUS_SOURCE_ALPHA],
         "below":[Context3DBlendFactor.ONE_MINUS_DESTINATION_ALPHA,Context3DBlendFactor.DESTINATION_ALPHA]
      },{
         "none":[Context3DBlendFactor.ONE,Context3DBlendFactor.ZERO],
         "normal":[Context3DBlendFactor.ONE,Context3DBlendFactor.ONE_MINUS_SOURCE_ALPHA],
         "add":[Context3DBlendFactor.ONE,Context3DBlendFactor.ONE],
         "multiply":[Context3DBlendFactor.DESTINATION_COLOR,Context3DBlendFactor.ONE_MINUS_SOURCE_ALPHA],
         "screen":[Context3DBlendFactor.ONE,Context3DBlendFactor.ONE_MINUS_SOURCE_COLOR],
         "erase":[Context3DBlendFactor.ZERO,Context3DBlendFactor.ONE_MINUS_SOURCE_ALPHA],
         "below":[Context3DBlendFactor.ONE_MINUS_DESTINATION_ALPHA,Context3DBlendFactor.DESTINATION_ALPHA]
      }];
      
      public static const AUTO:String = "auto";
      
      public static const NONE:String = "none";
      
      public static const NORMAL:String = "normal";
      
      public static const ADD:String = "add";
      
      public static const MULTIPLY:String = "multiply";
      
      public static const SCREEN:String = "screen";
      
      public static const ERASE:String = "erase";
      
      public static const BELOW:String = "below";
       
      
      public function BlendMode()
      {
         super();
         throw new AbstractClassError();
      }
      
      public static function getBlendFactors(param1:String, param2:Boolean = true) : Array
      {
         var _loc3_:Object = sBlendFactors[int(param2)];
         if(param1 in _loc3_)
         {
            return _loc3_[param1];
         }
         throw new ArgumentError("Invalid blend mode");
      }
      
      public static function register(param1:String, param2:String, param3:String, param4:Boolean = true) : void
      {
         var _loc5_:Object;
         (_loc5_ = sBlendFactors[int(param4)])[param1] = [param2,param3];
         var _loc6_:Object = sBlendFactors[int(!param4)];
         if(!(param1 in _loc6_))
         {
            _loc6_[param1] = [param2,param3];
         }
      }
   }
}
