package package_76
{
   import com.greensock.TweenLite;
   import com.greensock.easing.Linear;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import package_181.class_1104;
   
   public class class_1733 extends Sprite
   {
       
      
      private var var_397:Boolean;
      
      private var var_500:DisplayObject;
      
      public var fps:int;
      
      private var var_2071:int;
      
      public function class_1733(param1:DisplayObject = null, param2:int = 30)
      {
         super();
         this.var_500 = param1;
         this.fps = param2;
      }
      
      public function method_2332(param1:DisplayObject, param2:Boolean = true) : void
      {
         if(this.var_500)
         {
            this.stopAnimation(false);
            class_215.removeDisplayObject(this.var_500);
            if(this.var_500 is class_1104)
            {
               class_1104(this.var_500).stop();
            }
         }
         this.var_500 = param1;
         this.clip.visible = false;
         if(param2)
         {
            this.addChild(param1);
         }
         this.method_1969();
      }
      
      private function method_1969() : void
      {
         if(this.clip is MovieClip)
         {
            MovieClip(this.clip).gotoAndStop(this.var_2071);
         }
         else if(this.clip is class_1104)
         {
            class_1104(this.clip).gotoAndStop(this.var_2071);
         }
      }
      
      public function method_6420(param1:Boolean = true, param2:int = 1, param3:Boolean = true, param4:Boolean = false, param5:Boolean = false) : void
      {
         var _loc6_:int = 0;
         var _loc8_:Number = NaN;
         this.stopAnimation(param3);
         this.var_2071 = param2;
         if(this.clip is MovieClip)
         {
            _loc6_ = int(MovieClip(this.clip).framesLoaded);
            MovieClip(this.clip).gotoAndStop(param2);
         }
         else if(this.clip is class_1104)
         {
            _loc6_ = int(class_1104(this.clip).framesLoaded);
            class_1104(this.clip).gotoAndStop(param2);
         }
         var _loc7_:Number = _loc6_ / Number(this.fps);
         if(param5)
         {
            _loc6_ = 1;
         }
         _loc8_ = 0;
         this.clip.visible = true;
         if(param3)
         {
            _loc8_ = 0.5;
            this.clip.alpha = 0;
            TweenLite.to(this.clip,_loc8_,{
               "ease":Linear.easeNone,
               "alpha":1
            });
         }
         if(param1)
         {
            this.method_4771(_loc7_,_loc6_);
         }
         else if(param4)
         {
            this.method_3988(_loc7_,_loc6_);
         }
         else if(param3)
         {
            this.method_5887(_loc7_,_loc6_);
         }
         else
         {
            this.method_3106(_loc7_,_loc6_);
         }
      }
      
      public function method_6321(param1:int = 1, param2:Boolean = true, param3:Boolean = false, param4:int = 3) : void
      {
         var _loc5_:int = 0;
         this.stopAnimation(param2);
         if(this.clip is MovieClip)
         {
            _loc5_ = int(MovieClip(this.clip).framesLoaded);
            MovieClip(this.clip).gotoAndStop(param1);
         }
         else if(this.clip is class_1104)
         {
            _loc5_ = int(class_1104(this.clip).framesLoaded);
            class_1104(this.clip).gotoAndStop(param1);
         }
         var _loc6_:Number = _loc5_ / Number(this.fps);
         this.clip.visible = true;
         if(param2)
         {
            this.clip.alpha = 0;
            this.method_6210(0.5);
         }
         this.method_5727(_loc6_,_loc5_,param4,param2);
      }
      
      private function method_5727(param1:Number, param2:int, param3:int, param4:Boolean = true) : void
      {
         this.method_1969();
         if(param3 > 0)
         {
            TweenLite.to(this.clip,param1,{
               "ease":Linear.easeNone,
               "frame":param2,
               "onComplete":this.method_5727,
               "onCompleteParams":[param1,param2,--param3]
            });
         }
         else if(param4)
         {
            this.method_4532(0.5);
         }
      }
      
      private function method_4771(param1:Number, param2:int) : void
      {
         this.method_1969();
         TweenLite.to(this.clip,param1,{
            "ease":Linear.easeNone,
            "frame":param2,
            "onComplete":this.method_4771,
            "onCompleteParams":[param1,param2]
         });
      }
      
      private function method_3988(param1:Number, param2:int) : void
      {
         TweenLite.to(this.clip,param1,{
            "ease":Linear.easeNone,
            "frame":param2,
            "onComplete":this.disposeView
         });
      }
      
      private function method_5887(param1:Number, param2:int) : void
      {
         TweenLite.to(this.clip,param1,{
            "ease":Linear.easeNone,
            "frame":param2,
            "onComplete":this.method_4532,
            "onCompleteParams":[0.5]
         });
      }
      
      private function method_3106(param1:Number, param2:int) : void
      {
         TweenLite.to(this.clip,param1,{
            "ease":Linear.easeNone,
            "frame":param2
         });
      }
      
      public function stopAnimation(param1:Boolean = true) : void
      {
         if(this.clip == null)
         {
            return;
         }
         TweenLite.killTweensOf(this.clip);
         if(param1)
         {
            this.method_4532(0.5);
         }
      }
      
      public function method_6210(param1:Number) : void
      {
         TweenLite.to(this.clip,param1,{
            "ease":Linear.easeNone,
            "alpha":1
         });
      }
      
      public function method_4532(param1:Number) : void
      {
         TweenLite.to(this.clip,param1,{
            "ease":Linear.easeNone,
            "alpha":0
         });
      }
      
      public function disposeView(param1:Boolean = false) : void
      {
         this.var_397 = true;
         this.stopAnimation(false);
         class_215.removeDisplayObject(this);
         class_215.removeDisplayObject(this.var_500);
         if(this.var_500 is class_1104)
         {
            class_1104(this.var_500).stop();
         }
      }
      
      public function get clip() : DisplayObject
      {
         return this.var_500;
      }
      
      protected function get method_2650() : Boolean
      {
         return this.var_397;
      }
   }
}
