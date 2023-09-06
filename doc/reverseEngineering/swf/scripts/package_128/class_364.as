package package_128
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class class_364 extends Sprite
   {
       
      
      private var var_3846:Rectangle;
      
      private var var_2106:Rectangle;
      
      private var var_1053:Rectangle;
      
      private var var_822:Rectangle;
      
      private var var_2099:Rectangle;
      
      private var _width:Number = 0;
      
      private var _height:Number = 0;
      
      private var var_1716:BitmapData;
      
      private var bitmap:Bitmap;
      
      private var var_2534:Bitmap;
      
      private var var_3668:Bitmap;
      
      private var var_4668:Bitmap;
      
      private var var_250:Bitmap;
      
      private var var_1915:Bitmap;
      
      private var var_3928:Bitmap;
      
      private var var_3693:Bitmap;
      
      private var var_3000:Bitmap;
      
      private var top:BitmapData;
      
      private var bottom:BitmapData;
      
      private var left:BitmapData;
      
      private var right:BitmapData;
      
      private var var_4200:Boolean;
      
      public function class_364(param1:Rectangle, param2:Number, param3:Number, param4:BitmapData, param5:Boolean = false)
      {
         super();
         this.var_3846 = param1;
         this._width = param2;
         this._height = param3;
         this.var_1716 = param4;
         this.var_4200 = param5;
         this.var_2106 = new Rectangle(0,0,this.var_3846.x,this.var_3846.y);
         this.var_1053 = new Rectangle(this.var_3846.x + this.var_3846.width,0,Number(this.var_1716.width) - Number(this.var_3846.x) - Number(this.var_3846.width),this.var_3846.y);
         this.var_822 = new Rectangle(0,this.var_3846.y + this.var_3846.height,this.var_3846.x,Number(this.var_1716.height) - Number(this.var_3846.y) - Number(this.var_3846.height));
         this.var_2099 = new Rectangle(this.var_3846.x + this.var_3846.width,this.var_3846.y + this.var_3846.height,Number(this.var_1716.width) - Number(this.var_3846.x) - Number(this.var_3846.width),Number(this.var_1716.height) - Number(this.var_3846.y) - Number(this.var_3846.height));
         this.init();
      }
      
      private function init() : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc1_:Point = new Point(0,0);
         if(this.var_3846.height >= Number(this.var_1716.width) << 1)
         {
            this.left = new BitmapData(this.var_3846.x,this.var_1716.height);
            this.left.copyPixels(this.var_1716,new Rectangle(0,0,this.left.width,this.left.height),_loc1_);
            this.right = new BitmapData(Number(this.var_1716.width) - Number(this.var_3846.x) - Number(this.var_3846.width),this.var_1716.height);
            this.right.copyPixels(this.var_1716,new Rectangle(this.var_3846.x + this.var_3846.width,0,this.right.width,this.right.height),_loc1_);
            this.var_3693 = new Bitmap(this.left);
            this.var_3000 = new Bitmap(this.right);
            addChild(this.var_3693);
            addChild(this.var_3000);
            this.var_3693.x = this.var_3693.y = 0;
            this.var_3000.x = Number(this._width) - Number(this.right.width);
            this.var_3000.y = 0;
            this.var_3846.height = this.var_1716.height;
            _loc2_ = this.method_90(Number(this._width) - Number(this.left.width) - Number(this.right.width),this.var_3846.height,this.var_3846.x,this.var_3846.y);
            this.bitmap = new Bitmap(_loc2_);
            this.bitmap.x = this.left.width;
            this.bitmap.y = 0;
            addChild(this.bitmap);
         }
         else if(this.var_3846.width >= Number(this.var_1716.height) << 1)
         {
            this.top = new BitmapData(this.var_1716.width,this.var_3846.y);
            this.top.copyPixels(this.var_1716,new Rectangle(0,0,this.var_1716.width,this.top.height),_loc1_);
            this.bottom = new BitmapData(this.var_1716.width,Number(this.var_1716.height) - Number(this.var_3846.y) - Number(this.var_3846.height));
            this.bottom.copyPixels(this.var_1716,new Rectangle(0,this.var_3846.y + this.var_3846.height,this.var_1716.width,this.bottom.height),_loc1_);
            this.var_1915 = new Bitmap(this.top);
            this.var_3928 = new Bitmap(this.bottom);
            addChild(this.var_1915);
            addChild(this.var_3928);
            this.var_1915.x = this.var_1915.y = 0;
            this.var_3928.x = 0;
            this.var_3928.y = Number(this._height) - Number(this.bottom.height);
            this.var_3846.width = this.var_1716.width;
            _loc3_ = this.method_965(this.var_3846.width,Number(this._height) - Number(this.top.height) - Number(this.bottom.height),this.var_3846.x,this.var_3846.y);
            this.bitmap = new Bitmap(_loc3_);
            this.bitmap.x = 0;
            this.bitmap.y = this.top.height;
            addChild(this.bitmap);
         }
         else
         {
            (_loc4_ = new BitmapData(this.var_2106.width,this.var_2106.height)).copyPixels(this.var_1716,this.var_2106,_loc1_);
            this.var_2534 = new Bitmap(_loc4_);
            addChild(this.var_2534);
            (_loc5_ = new BitmapData(this.var_1053.width,this.var_1053.height)).copyPixels(this.var_1716,new Rectangle(Number(this.var_1716.width) - Number(this.var_1053.width),0,this.var_1053.width,this.var_1053.height),_loc1_);
            this.var_4668 = new Bitmap(_loc5_);
            addChild(this.var_4668);
            (_loc6_ = new BitmapData(this.var_822.width,this.var_822.height)).copyPixels(this.var_1716,new Rectangle(0,Number(this.var_1716.height) - Number(this.var_822.height),this.var_822.width,this.var_822.height),_loc1_);
            this.var_3668 = new Bitmap(_loc6_);
            addChild(this.var_3668);
            (_loc7_ = new BitmapData(this.var_2099.width,this.var_2099.height)).copyPixels(this.var_1716,new Rectangle(Number(this.var_1716.width) - Number(this.var_2099.width),Number(this.var_1716.height) - Number(this.var_2099.height),this.var_2099.width,this.var_2099.height),_loc1_);
            this.var_250 = new Bitmap(_loc7_);
            addChild(this.var_250);
            this.slice();
            this.var_2534.x = this.var_2534.y = 0;
            this.var_3668.x = 0;
            this.var_3668.y = Number(this._height) - Number(this.var_822.height);
            this.var_4668.x = Number(this._width) - Number(this.var_1053.width);
            this.var_4668.y = 0;
            this.var_250.x = Number(this._width) - Number(this.var_2099.width);
            this.var_250.y = Number(this._height) - Number(this.var_2099.height);
         }
      }
      
      private function method_965(param1:Number, param2:Number, param3:Number, param4:Number) : BitmapData
      {
         var _loc5_:BitmapData = new BitmapData(param1,param2);
         var _loc6_:Rectangle = new Rectangle(param3,param4,param1,this.var_3846.height);
         var _loc7_:int = 0;
         while(_loc7_ < param2)
         {
            _loc5_.copyPixels(this.var_1716,_loc6_,new Point(0,_loc7_));
            _loc7_ += this.var_3846.height;
         }
         return _loc5_;
      }
      
      private function method_90(param1:Number, param2:Number, param3:Number, param4:Number) : BitmapData
      {
         var _loc5_:BitmapData = new BitmapData(param1,param2);
         var _loc6_:Rectangle = new Rectangle(param3,param4,this.var_3846.width,param2);
         var _loc7_:int = 0;
         while(_loc7_ < param1)
         {
            _loc5_.copyPixels(this.var_1716,_loc6_,new Point(_loc7_,0));
            _loc7_ += this.var_3846.width;
         }
         return _loc5_;
      }
      
      private function slice() : void
      {
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:* = null;
         var _loc12_:* = null;
         var _loc13_:* = null;
         var _loc14_:int = 0;
         var _loc15_:int = 0;
         if(Boolean(this.bitmap) && Boolean(this.contains(this.bitmap)))
         {
            removeChild(this.bitmap);
         }
         var _loc1_:Number = Number(this._height) - Number(this.var_1053.height) - Number(this.var_2099.height);
         var _loc2_:Number = Number(this._height) - Number(this.var_2106.height) - Number(this.var_822.height);
         var _loc3_:Number = _loc2_ >= _loc1_ ? _loc2_ : _loc1_;
         var _loc4_:Number = Number(this._width) - Number(this.var_2106.width) - Number(this.var_1053.width);
         var _loc5_:Number = Number(this._width) - Number(this.var_822.width) - Number(this.var_2099.width);
         var _loc6_:Number = _loc4_ >= _loc5_ ? _loc4_ : _loc5_;
         var _loc7_:Number = 0;
         if(this.var_3846.width <= Number(this.var_1716.width) << 1)
         {
            this.top = this.method_90(_loc6_,this.var_2106.height,this.var_3846.x,0);
            this.bottom = this.method_90(_loc6_,this.var_822.height,this.var_3846.x,Number(this.var_1716.height) - Number(this.var_822.height));
         }
         if(this.var_3846.height <= Number(this.var_1716.height) << 1)
         {
            this.left = this.method_965(this.var_2106.width,_loc3_,0,this.var_3846.y);
            this.right = this.method_965(this.var_1053.width,_loc3_,Number(this.var_1716.width) - Number(this.var_1053.width),this.var_3846.y);
         }
         var _loc8_:BitmapData = new BitmapData(this._width,this._height);
         if(this.top)
         {
            _loc8_.copyPixels(this.top,new Rectangle(0,0,this.top.width,this.top.height),new Point(this.var_2106.width,0));
            _loc7_ = Number(this.top.width);
         }
         if(this.bottom)
         {
            _loc8_.copyPixels(this.bottom,new Rectangle(0,0,this.bottom.width,this.bottom.height),new Point(this.var_822.width,Number(this._height) - Number(this.var_822.height)));
         }
         if(this.left)
         {
            _loc8_.copyPixels(this.left,new Rectangle(0,0,this.left.width,this.left.height),new Point(0,this.var_2106.height));
         }
         if(this.right)
         {
            _loc8_.copyPixels(this.right,new Rectangle(0,0,this.right.width,this.right.height),new Point(Number(this._width) - Number(this.var_1053.width),this.var_1053.height));
         }
         if(this.var_4200)
         {
            _loc9_ = _loc6_ / Number(this.var_3846.width);
            _loc10_ = _loc3_ / Number(this.var_3846.height);
            (_loc11_ = new Matrix()).scale(_loc9_,_loc10_);
            (_loc12_ = new BitmapData(this.var_3846.width,this.var_3846.height)).copyPixels(this.var_1716,new Rectangle(this.var_3846.x,this.var_3846.y,this.var_3846.width,this.var_3846.height),new Point(0,0));
            (_loc13_ = new BitmapData(_loc6_,_loc3_)).draw(_loc12_,_loc11_);
            _loc8_.copyPixels(_loc13_,new Rectangle(0,0,_loc13_.width,_loc13_.height),new Point(this.var_2106.width,this.var_2106.height));
         }
         else
         {
            _loc14_ = 0;
            while(_loc14_ < _loc6_)
            {
               _loc15_ = 0;
               while(_loc15_ < _loc3_)
               {
                  _loc8_.copyPixels(this.var_1716,this.var_3846,new Point(this.var_2106.width + _loc14_,this.var_2106.height + _loc15_));
                  _loc15_ += this.var_3846.height;
               }
               _loc14_ += this.var_3846.width;
            }
         }
         this.bitmap = new Bitmap(_loc8_);
         addChild(this.bitmap);
         this.setChildIndex(this.bitmap,0);
      }
      
      public function updateSize(param1:Number, param2:Number) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         this._width = Math.max(param1,this.var_1716.width);
         this._height = Math.max(param2,this.var_1716.height);
         if(this.var_3846.height == this.var_1716.height)
         {
            if(Boolean(this.bitmap) && Boolean(this.contains(this.bitmap)))
            {
               removeChild(this.bitmap);
            }
            this.var_3000.x = Number(this._width) - Number(this.right.width);
            this.var_3000.y = 0;
            _loc3_ = this.method_90(Number(this._width) - Number(this.left.width) - Number(this.right.width),this.var_3846.height,this.var_3846.x,this.var_3846.y);
            this.bitmap = new Bitmap(_loc3_);
            this.bitmap.x = this.left.width;
            this.bitmap.y = 0;
            addChild(this.bitmap);
         }
         else if(this.var_3846.width == this.var_1716.width)
         {
            if(Boolean(this.bitmap) && Boolean(this.contains(this.bitmap)))
            {
               removeChild(this.bitmap);
            }
            this.var_3928.x = 0;
            this.var_3928.y = Number(this._height) - Number(this.bottom.height);
            _loc4_ = this.method_965(this.var_3846.width,Number(this._height) - Number(this.top.height) - Number(this.bottom.height),this.var_3846.x,this.var_3846.y);
            this.bitmap = new Bitmap(_loc4_);
            this.bitmap.x = 0;
            this.bitmap.y = this.top.height;
            addChild(this.bitmap);
         }
         else
         {
            this.var_2534.y = 0;
            this.var_2534.x = 0;
            this.var_3668.x = 0;
            this.var_3668.y = Number(this._height) - Number(this.var_822.height);
            this.var_4668.x = Number(this._width) - Number(this.var_1053.width);
            this.var_4668.y = 0;
            this.var_250.x = Number(this._width) - Number(this.var_2099.width);
            this.var_250.y = Number(this._height) - Number(this.var_2099.height);
            this.slice();
         }
      }
   }
}
