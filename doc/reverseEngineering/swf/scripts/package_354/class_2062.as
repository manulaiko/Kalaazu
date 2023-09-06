package package_354
{
   import com.bigpoint.utils.class_73;
   import com.greensock.TweenLite;
   import flash.display.MovieClip;
   import flash.media.SoundChannel;
   import net.bigpoint.darkorbit.class_126;
   import net.bigpoint.darkorbit.map.view2D.class_1206;
   import package_27.class_82;
   import package_286.class_2019;
   import package_35.class_348;
   import package_76.class_215;
   import package_9.ResourceManager;
   
   public class class_2062 extends class_2019
   {
       
      
      private var var_1632:Number = 5;
      
      private var var_3303:Number = 0.1;
      
      private var var_527:Number = 0;
      
      private var var_2910:Number = 0.3;
      
      private var var_385:SoundChannel = null;
      
      public function class_2062(param1:class_1206, param2:class_348)
      {
         super(param1,param2);
      }
      
      override protected function get method_3013() : String
      {
         return super.method_3013;
      }
      
      override protected function method_30() : void
      {
         this.var_1714 = new MovieClip();
         this.addChild(var_1714);
         this.method_2332(var_1714,false);
         this.method_1057(0);
         this.method_6420();
         var _loc1_:class_73 = (effect as class_348).source.position;
         this.var_385 = class_82.playSoundEffect(class_126.const_2773,false,false,_loc1_.x,_loc1_.y);
      }
      
      private function method_1057(param1:int) : void
      {
         var _loc2_:* = null;
         _loc2_ = ResourceManager.getMovieClip("shockwaves","fireProtectionRing");
         _loc2_.scaleX = this.var_1632;
         _loc2_.scaleY = this.var_1632;
         _loc2_.alpha = this.var_527;
         this.var_1714.addChild(_loc2_);
         TweenLite.to(_loc2_,1.5,{
            "scaleX":this.var_3303,
            "scaleY":this.var_3303,
            "alpha":this.var_2910,
            "onComplete":class_215.removeDisplayObject,
            "onCompleteParams":[_loc2_]
         });
         TweenLite.delayedCall(1,this.method_1057,[param1 + 1]);
      }
      
      public function method_526() : void
      {
         if(this.var_385 != null)
         {
            class_82.method_401(this.var_385);
         }
      }
      
      override public function disposeView(param1:Boolean = false) : void
      {
         this.method_526();
         TweenLite.killTweensOf(this.method_1057);
         super.disposeView(param1);
      }
   }
}
