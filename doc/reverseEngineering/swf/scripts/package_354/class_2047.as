package package_354
{
   import com.greensock.TweenMax;
   import com.greensock.easing.Linear;
   import flash.display.MovieClip;
   import net.bigpoint.darkorbit.class_126;
   import net.bigpoint.darkorbit.map.view2D.class_1206;
   import package_27.class_82;
   import package_286.class_2019;
   import package_75.class_369;
   
   public class class_2047 extends class_2019
   {
      
      private static const const_457:Number = 0.04;
       
      
      public function class_2047(param1:class_1206, param2:class_369)
      {
         super(param1,param2);
      }
      
      override protected function method_30() : void
      {
         class_82.playSoundEffect(class_126.const_1621,false,false);
         this.clip.visible = true;
         this.clip.y -= 50;
         var _loc1_:Number = Number(MovieClip(this.clip).framesLoaded) * Number(const_457);
         TweenMax.to(this.clip,_loc1_,{
            "ease":Linear.easeNone,
            "frame":MovieClip(this.clip).framesLoaded,
            "onComplete":this.disposeView
         });
      }
      
      override public function disposeView(param1:Boolean = false) : void
      {
         TweenMax.killTweensOf(this.clip);
         super.disposeView(param1);
      }
   }
}
