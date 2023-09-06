package com.bigpoint.utils
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.Dictionary;
   import package_76.class_1495;
   
   public class class_968
   {
      
      private static const const_2530:String = "SubTexture";
       
      
      private var _atlas:Dictionary;
      
      public function class_968(param1:Bitmap, param2:XML)
      {
         super();
         this.init(param1,param2);
      }
      
      private function init(param1:Bitmap, param2:XML) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:* = null;
         var _loc8_:* = null;
         this._atlas = new Dictionary();
         for each(_loc3_ in param2.child(const_2530))
         {
            _loc4_ = _loc3_.attribute("name");
            _loc5_ = int(_loc3_.attribute("width"));
            _loc6_ = int(_loc3_.attribute("height"));
            _loc7_ = new Rectangle(int(_loc3_.attribute("x")),int(_loc3_.attribute("y")),_loc5_,_loc6_);
            (_loc8_ = new BitmapData(_loc5_,_loc6_)).copyPixels(param1.bitmapData,_loc7_,new Point(0,0));
            this._atlas[_loc4_] = _loc8_;
         }
      }
      
      public function method_4093(param1:String, param2:Boolean = false) : BitmapData
      {
         var _loc3_:BitmapData = this._atlas[param1] as BitmapData;
         if(_loc3_)
         {
            if(param2)
            {
               _loc3_ = class_1495.method_6267(_loc3_);
            }
         }
         return _loc3_;
      }
   }
}
