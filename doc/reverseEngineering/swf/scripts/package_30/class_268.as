package package_30
{
   import com.greensock.TweenLite;
   import com.greensock.TweenMax;
   import com.greensock.easing.Quad;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.media.SoundChannel;
   import net.bigpoint.darkorbit.class_126;
   import package_14.class_52;
   import package_27.class_82;
   import package_9.class_50;
   import package_99.class_266;
   
   public class class_268 extends Sprite implements class_52
   {
       
      
      private var background:Bitmap;
      
      private var var_3987:Sprite;
      
      private var bar:Sprite;
      
      private var w:int;
      
      private var h:int;
      
      private var var_2362:SoundChannel;
      
      private var var_2956:Number;
      
      public var var_3100:int = 50;
      
      public var var_530:Number = 0.5;
      
      public var duration:Number = -1;
      
      public var name_92:Boolean = true;
      
      public var var_4169:int = 1;
      
      public var var_3719:int = 6;
      
      public var var_2439:int = 20;
      
      public var var_2046:int = 500;
      
      public var fadeOut:Boolean = true;
      
      private var _tpf:Number = 0;
      
      public function class_268(param1:int, param2:int)
      {
         super();
         this.w = param1;
         this.h = param2;
      }
      
      public function updateTimer(param1:Number) : void
      {
         this._tpf += param1;
         if(this._tpf > this.var_3100 - 1)
         {
            this.background.bitmapData.noise(1000 * Math.random(),0,255,7,true);
            this._tpf = 0;
         }
      }
      
      public function start() : void
      {
         this.var_2956 = alpha;
         this.background = new Bitmap(new BitmapData(this.w,this.h));
         this.addChild(this.background);
         this.var_3987 = new Sprite();
         this.var_3987.graphics.beginFill(16777215);
         this.var_3987.graphics.drawRect(0,0,this.w,this.h);
         this.addChild(this.var_3987);
         this.bar = new Sprite();
         this.bar.graphics.beginFill(16777215);
         this.bar.graphics.drawRect(0,0,this.w,Number(this.h) / 4);
         this.bar.alpha = 0.5;
         this.addChild(this.bar);
         this.bar.mask = this.var_3987;
         this.method_1857();
         if(this.fadeOut)
         {
            this.method_1983();
         }
         class_50.method_5621(this);
         if(this.name_92)
         {
            this.var_2362 = class_82.playSoundEffect(class_126.const_2053,true,true);
         }
         if(this.duration != -1)
         {
            TweenMax.delayedCall(this.duration,this.cleanup);
         }
      }
      
      private function method_887() : void
      {
         if(this.var_2362 != null)
         {
            class_82.method_401(this.var_2362);
         }
         TweenLite.to(this,0.25,{
            "alpha":Number(this.var_2956) - Number(this.var_530),
            "onComplete":this.method_6140
         });
      }
      
      private function method_6140() : void
      {
         var _loc1_:int = int(class_266.getRandomCount(this.var_2439,this.var_2046));
         TweenMax.killDelayedCallsTo(this.fadeIn);
         TweenMax.delayedCall(_loc1_ / 1000,this.fadeIn);
      }
      
      private function fadeIn() : void
      {
         TweenLite.to(this,0.25,{
            "alpha":this.var_2956,
            "onComplete":this.method_1983
         });
         if(this.name_92)
         {
            this.var_2362 = class_82.playSoundEffect(class_126.const_2053,true,true);
         }
      }
      
      private function method_1983() : void
      {
         var _loc1_:int = int(class_266.getRandomCount(this.var_4169,this.var_3719));
         TweenMax.killDelayedCallsTo(this.method_887);
         TweenMax.delayedCall(_loc1_,this.method_887);
      }
      
      private function method_1857() : void
      {
         this.bar.y = -Number(this.bar.height);
         TweenLite.to(this.bar,4,{
            "ease":Quad.easeOut,
            "y":this.height,
            "onComplete":this.method_1857
         });
      }
      
      public function cleanup() : void
      {
         class_50.removeObserver(this);
         if(parent != null)
         {
            parent.removeChild(this);
         }
         TweenMax.killTweensOf(this.bar);
         TweenMax.killDelayedCallsTo(this.method_887);
         TweenMax.killDelayedCallsTo(this.fadeIn);
         if(this.background)
         {
            this.background.bitmapData.dispose();
            this.background = null;
         }
         if(this.var_2362 != null)
         {
            class_82.method_401(this.var_2362);
         }
      }
      
      override public function get width() : Number
      {
         return this.w;
      }
      
      override public function get height() : Number
      {
         return this.h;
      }
   }
}
