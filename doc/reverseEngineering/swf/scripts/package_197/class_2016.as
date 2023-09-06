package package_197
{
   import com.bigpoint.utils.class_73;
   import com.greensock.TweenLite;
   import flash.display.Bitmap;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.geom.Rectangle;
   import package_11.class_39;
   import package_9.ResourceManager;
   
   public class class_2016 extends Sprite
   {
      
      private static const const_1048:class_73 = new class_73();
       
      
      private var _vo:class_2017;
      
      private var var_2659:Vector.<MovieClip>;
      
      private var var_3371:MovieClip;
      
      private var var_2198:Bitmap;
      
      private var var_850:Boolean;
      
      private var _rect:Rectangle;
      
      private var var_2986:Boolean = false;
      
      public function class_2016(param1:class_2017, param2:Rectangle)
      {
         this.var_2659 = new Vector.<MovieClip>();
         super();
         this._vo = param1;
         this._rect = param2;
         visible = false;
         ResourceManager.name_15.load("lensflare" + this._vo.typeID,this.method_2958);
      }
      
      public function method_1125(param1:class_1743, param2:Vector.<class_1205>) : void
      {
         if(!visible)
         {
            return;
         }
         param1.method_5468(this._vo,const_1048);
         this.x = const_1048.x;
         this.y = const_1048.y;
         var _loc3_:Boolean = Boolean(this.method_3510(param2));
         if(_loc3_ != this.var_2986)
         {
            this.var_2986 = _loc3_;
            if(this.var_2986)
            {
               this.method_3864();
            }
            else
            {
               this.method_1076();
            }
         }
         this.method_424();
         if(this.var_3371)
         {
            this.var_3371.rotation -= 0.15;
         }
      }
      
      public function cleanup() : void
      {
         this.var_3371 = null;
         if(this.var_2198)
         {
            this.var_2198.bitmapData.dispose();
         }
         while(numChildren)
         {
            removeChild(getChildAt(0));
         }
      }
      
      public function set rect(param1:Rectangle) : void
      {
         this._rect = param1;
      }
      
      private function method_2958(param1:class_39) : void
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         while(param1.hasEmbeddedObject("lens" + _loc3_))
         {
            _loc2_ = param1.getEmbeddedMovieClip("lens" + _loc3_);
            _loc2_.alpha = 0;
            if(this._vo.blendMode)
            {
               _loc2_.blendMode = this._vo.blendMode;
            }
            this.var_2659.push(_loc2_);
            addChild(_loc2_);
            _loc3_++;
         }
         if(this._vo.method_1851)
         {
            this.var_3371 = MovieClip(param1.getEmbeddedMovieClip("star"));
            this.var_3371.play();
            this.addChildAt(this.var_3371,0);
            ResourceManager.name_15.load("lensFlash",this.method_1069);
         }
         else
         {
            visible = true;
         }
      }
      
      private function method_1069(param1:class_39) : void
      {
         this.var_2198 = param1.getEmbeddedBitmap("lensFlash");
         this.var_2198.x = -Number(this.var_2198.width) / 2;
         this.var_2198.y = -Number(this.var_2198.height) / 2;
         addChild(this.var_2198);
         this.var_2198.visible = false;
         visible = true;
      }
      
      private function method_3510(param1:Vector.<class_1205>) : Boolean
      {
         if(x < 0 || x > this._rect.width || y < 0 || y > this._rect.height)
         {
            return false;
         }
         var _loc2_:int = param1.length;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if(param1[_loc3_].method_822(x,y))
            {
               return false;
            }
            _loc3_++;
         }
         return true;
      }
      
      private function method_3864() : void
      {
         var _loc1_:int = int(this.var_2659.length);
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_)
         {
            TweenLite.to(this.var_2659[_loc2_],0.1,{"alpha":1});
            _loc2_++;
         }
         if(this.var_3371 != null)
         {
            TweenLite.to(this.var_3371,0,{"alpha":1});
            if(this.var_850)
            {
               this.var_2198.alpha = 0;
               this.var_2198.visible = true;
               TweenLite.to(this.var_2198,0.2,{
                  "alpha":0.75,
                  "onComplete":this.method_499,
                  "onCompleteParams":[this.var_2198]
               });
               this.var_850 = false;
            }
         }
      }
      
      private function method_499(param1:Bitmap) : void
      {
         TweenLite.to(param1,3,{
            "alpha":0,
            "onComplete":this.method_741,
            "onCompleteParams":[param1]
         });
      }
      
      private function method_741(param1:Bitmap) : void
      {
         param1.visible = false;
      }
      
      private function method_1076() : void
      {
         var _loc1_:int = int(this.var_2659.length);
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_)
         {
            TweenLite.to(this.var_2659[_loc2_],0,{"alpha":0});
            _loc2_++;
         }
         if(this.var_3371 != null)
         {
            TweenLite.to(this.var_3371,0,{"alpha":0});
         }
      }
      
      private function method_424() : void
      {
         var _loc6_:* = null;
         var _loc1_:int = int(this.var_2659.length);
         var _loc2_:Number = Number(x) - Number(this._rect.width) / 2;
         var _loc3_:Number = Number(y) - Number(this._rect.height) / 2;
         var _loc4_:Number = -_loc2_ * 3 / _loc1_;
         var _loc5_:Number = -_loc3_ * 3 / _loc1_;
         var _loc7_:int = 0;
         while(_loc7_ < _loc1_)
         {
            (_loc6_ = this.var_2659[_loc7_]).x = _loc4_ * _loc7_;
            _loc6_.y = _loc5_ * _loc7_;
            _loc7_++;
         }
         var _loc8_:Number = (Math.sqrt(_loc2_ * _loc2_ + _loc3_ * _loc3_) + 50) * 0.0033;
         _loc8_ = Math.max(0,Math.min(_loc8_,1));
      }
   }
}
