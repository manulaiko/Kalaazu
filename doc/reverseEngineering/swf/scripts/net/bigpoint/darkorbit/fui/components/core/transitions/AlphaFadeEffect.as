package net.bigpoint.darkorbit.fui.components.core.transitions
{
   import com.greensock.TweenLite;
   
   public class AlphaFadeEffect extends AbstractTransitionEffect
   {
       
      
      public function AlphaFadeEffect(param1:Number = 0.5, param2:Number = 0.5)
      {
         super();
         _fadeInTime = param1;
         _fadeOutTime = param2;
      }
      
      override public function init() : void
      {
         this.target.alpha = 0.1;
         this.target.y = 0;
      }
      
      override public function fadeIn() : void
      {
         TweenLite.killTweensOf(target);
         TweenLite.to(target,_fadeInTime,{
            "alpha":1,
            "onComplete":fadeInComplete
         });
      }
      
      override public function fadeOut() : void
      {
         TweenLite.killTweensOf(target);
         TweenLite.to(target,_fadeOutTime,{
            "alpha":0,
            "y":0,
            "onComplete":fadeOutComplete
         });
      }
      
      override public function dispose() : void
      {
         TweenLite.killTweensOf(target);
         super.dispose();
      }
   }
}
