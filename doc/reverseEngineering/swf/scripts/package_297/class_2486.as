package package_297
{
   import away3d.animators.class_2649;
   import away3d.animators.class_2665;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.Dictionary;
   import net.bigpoint.darkorbit.map.view3D.display3D.class_1210;
   import package_294.class_2429;
   import package_304.class_2114;
   import package_307.class_1776;
   import package_369.class_2117;
   import package_386.class_2666;
   import package_431.class_2667;
   import package_434.class_2413;
   
   public class class_2486
   {
      
      private static const const_2778:Dictionary = new Dictionary(true);
      
      {
         class_1210.instance.const_466.add(clearCache);
      }
      
      public function class_2486()
      {
         super();
      }
      
      public static function method_5588(param1:int, param2:int, param3:int) : int
      {
         var _loc4_:* = int(class_2413.method_4086(Math.max(param1,param2)));
         while(int(_loc4_ / param1) * int(_loc4_ / param2) < param3)
         {
            _loc4_ <<= 1;
         }
         return _loc4_;
      }
      
      public static function clearCache() : void
      {
         var _loc1_:* = null;
         for(_loc1_ in const_2778)
         {
            const_2778[_loc1_] = null;
            delete const_2778[_loc1_];
         }
      }
      
      public static function method_6114(param1:String, param2:MovieClip = null, param3:class_2429 = null, param4:int = 25) : class_2114
      {
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:int = 0;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:* = null;
         var _loc15_:* = null;
         var _loc16_:* = null;
         var _loc17_:int = 0;
         var _loc18_:int = 0;
         var _loc19_:* = null;
         var _loc5_:class_2114;
         if((_loc5_ = const_2778[param1]) == null)
         {
            (_loc7_ = new class_1776()).alphaBlending = true;
            _loc7_.alphaPremultiplied = true;
            _loc5_ = new class_2114(param3,_loc7_);
            if(param1)
            {
               const_2778[param1] = _loc5_;
            }
            _loc11_ = new Matrix();
            if(param2.totalFrames == 1)
            {
               _loc9_ = int(class_2413.method_4086(Math.max(param2.width,param2.height)));
               _loc10_ = new BitmapData(_loc9_,_loc9_,true,0);
               _loc8_ = param2.getBounds(param2);
               _loc11_.translate(-_loc8_.x,-_loc8_.y);
               _loc11_.scale(_loc10_.width / _loc8_.width,_loc10_.height / _loc8_.height);
               _loc10_.draw(param2,_loc11_);
            }
            else
            {
               _loc8_ = new Rectangle();
               _loc12_ = 1;
               _loc12_ = 1;
               while(_loc12_ <= param2.totalFrames)
               {
                  param2.gotoAndStop(_loc12_);
                  _loc8_ = _loc8_.union(param2.getBounds(param2));
                  _loc12_++;
               }
               param2.gotoAndStop(1);
               _loc9_ = int(method_5588(_loc8_.width,_loc8_.height,param2.totalFrames));
               _loc10_ = new BitmapData(_loc9_,_loc9_,true,0);
               _loc13_ = int(_loc9_ / _loc8_.width);
               (_loc14_ = new class_2667()).name = "default";
               _loc11_ = new Matrix();
               _loc15_ = new BitmapData(_loc8_.width,_loc8_.height,true,0);
               _loc16_ = new Point();
               _loc17_ = 0;
               _loc18_ = 0;
               _loc12_ = 1;
               while(_loc12_ <= param2.totalFrames)
               {
                  _loc17_ = (_loc12_ - 1) % _loc13_;
                  _loc18_ = int((_loc12_ - 1) / _loc13_);
                  param2.gotoAndStop(_loc12_);
                  _loc11_.identity();
                  _loc11_.translate(-_loc8_.x + (_loc8_.width - param2.width),-_loc8_.y + (_loc8_.height - param2.height));
                  _loc15_.fillRect(_loc15_.rect,16777215);
                  _loc15_.draw(param2,_loc11_,null,null,null,true);
                  _loc16_.x = _loc17_ * _loc8_.width;
                  _loc16_.y = _loc18_ * _loc8_.height;
                  _loc10_.copyPixels(_loc15_,_loc15_.rect,_loc16_);
                  _loc14_.addFrame(new class_2666(_loc16_.x / _loc9_,_loc16_.y / _loc9_,_loc8_.width / _loc9_,_loc8_.height / _loc9_,0),1000 / param4);
                  _loc12_++;
               }
               (_loc19_ = new class_2665()).addAnimation(_loc14_);
               _loc5_.animator = new class_2649(_loc19_);
            }
            if(_loc10_.width < 2048 && _loc10_.height < 2048)
            {
               _loc7_.texture = new class_2117(_loc10_,true);
            }
         }
         var _loc6_:class_2114;
         if((_loc6_ = _loc5_.clone() as class_2114).animator is class_2649)
         {
            class_2649(_loc6_.animator).play("default");
            class_2649(_loc6_.animator).stop();
            class_2649(_loc6_.animator).fps = param4;
         }
         return _loc6_;
      }
      
      public static function method_4813(param1:DisplayObject) : class_2117
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:Matrix = new Matrix();
         _loc3_ = int(class_2413.method_4086(Math.max(param1.width,param1.height)));
         _loc4_ = new BitmapData(_loc3_,_loc3_,true,0);
         _loc2_ = param1.getBounds(param1);
         _loc5_.translate(-_loc2_.x,-_loc2_.y);
         _loc5_.scale(_loc4_.width / _loc2_.width,_loc4_.height / _loc2_.height);
         _loc4_.draw(param1,_loc5_);
         return new class_2117(_loc4_,true);
      }
   }
}
