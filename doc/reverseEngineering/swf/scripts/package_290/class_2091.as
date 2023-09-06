package package_290
{
   import flash.display.BitmapData;
   import flash.geom.Rectangle;
   import package_361.class_2090;
   
   public class class_2091 extends class_2090
   {
      
      private static const const_979:int = 5021;
      
      private static const const_1844:int = 3132;
      
      private static const MARGIN:int = 5000;
       
      
      private var var_2831:BitmapData;
      
      private var _bounds:Rectangle;
      
      private var var_3208:Number = 0.1;
      
      public function class_2091(param1:int, param2:Rectangle, param3:int, param4:int)
      {
         var _loc12_:Number = NaN;
         this._bounds = param2;
         if(this._bounds.left < -Number(MARGIN))
         {
            this._bounds.left = -Number(MARGIN);
         }
         if(this._bounds.right > param3 + MARGIN)
         {
            this._bounds.right = param3 + MARGIN;
         }
         if(this._bounds.top < -Number(MARGIN))
         {
            this._bounds.top = -Number(MARGIN);
         }
         if(this._bounds.bottom > param4 + MARGIN)
         {
            this._bounds.bottom = param4 + MARGIN;
         }
         var _loc5_:Number = Math.max(1,param2.width / param3,param2.height / param4) * Number(this.var_3208);
         var _loc6_:Number = param3 * _loc5_;
         var _loc7_:Number = param4 * _loc5_;
         if(_loc6_ > const_979 || _loc7_ > const_1844)
         {
            _loc12_ = Math.max(_loc6_ / Number(const_979),_loc7_ / Number(const_1844));
            this.var_3208 /= _loc12_;
            _loc5_ /= _loc12_;
            _loc6_ /= _loc12_;
            _loc7_ /= _loc12_;
         }
         this.var_2831 = new BitmapData(int(_loc6_),int(_loc7_),true,0);
         var _loc8_:int = Number(this.var_2831.width) * Number(this.var_3208);
         var _loc9_:int = Math.abs(Math.round((param3 - _loc8_) / 2));
         var _loc10_:int = Number(this.var_2831.height) * Number(this.var_3208);
         var _loc11_:int = Math.abs(Math.round((param4 - _loc10_) / 2));
         super(param1,false,1,100,param2.x,param2.y,1,0,null,_loc5_ / Number(this.var_3208));
      }
      
      override public function get method_3162() : BitmapData
      {
         return this.var_2831;
      }
      
      public function get method_4662() : Number
      {
         return this.var_3208;
      }
      
      public function dispose() : void
      {
         this.var_2831.dispose();
         this.var_2831 = null;
      }
      
      public function get bounds() : Rectangle
      {
         return this._bounds;
      }
   }
}
