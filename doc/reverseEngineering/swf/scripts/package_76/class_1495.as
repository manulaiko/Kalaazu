package package_76
{
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.geom.ColorTransform;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class class_1495
   {
      
      private static const const_1163:Point = new Point();
       
      
      public function class_1495()
      {
         super();
      }
      
      public static function method_3992(param1:BitmapData) : Boolean
      {
         var var_3037:Boolean = false;
         var var_499:BitmapData = param1;
         try
         {
            var_3037 = var_499 && var_499.width > 0 && var_499.height > 0 ? true : false;
         }
         catch(error:Error)
         {
            var_3037 = false;
         }
         return var_3037;
      }
      
      public static function method_4316(param1:BitmapData, param2:Number) : BitmapData
      {
         var _loc3_:Rectangle = new Rectangle(0,0,param1.width,param1.height);
         var _loc4_:ColorTransform;
         (_loc4_ = new ColorTransform()).alphaMultiplier = param2;
         param1.colorTransform(_loc3_,_loc4_);
         return param1;
      }
      
      public static function scaleBitmapData(param1:BitmapData, param2:Number, param3:Number) : BitmapData
      {
         param2 = Math.abs(param2);
         param3 = Math.abs(param3);
         var _loc6_:Boolean = param1.transparent;
         var _loc7_:BitmapData = new BitmapData(1,1,_loc6_,0);
         var _loc8_:Matrix;
         (_loc8_ = new Matrix()).scale(param2,param3);
         _loc7_.draw(param1,_loc8_);
         return _loc7_;
      }
      
      public static function method_6267(param1:BitmapData) : BitmapData
      {
         var _loc2_:Rectangle = param1.getColorBoundsRect(4278190080,0,false);
         var _loc3_:BitmapData = new BitmapData(_loc2_.width,_loc2_.height,true,0);
         _loc3_.copyPixels(param1,_loc2_,const_1163);
         return _loc3_;
      }
      
      public static function drawToBitmapData(param1:DisplayObject) : BitmapData
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(param1 && param1.width > 0 && param1.height > 0)
         {
            _loc2_ = new BitmapData(param1.width,param1.height,true,0);
            _loc3_ = param1.getBounds(param1);
            _loc4_ = new Matrix(1,0,0,1,-_loc3_.x,-_loc3_.y);
            _loc2_.draw(param1,_loc4_);
            return _loc2_;
         }
         return null;
      }
   }
}
