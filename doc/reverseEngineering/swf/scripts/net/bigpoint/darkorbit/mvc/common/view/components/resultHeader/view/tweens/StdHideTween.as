package net.bigpoint.darkorbit.mvc.common.view.components.resultHeader.view.tweens
{
   import com.greensock.TweenMax;
   import mx.core.IUIComponent;
   
   public class StdHideTween implements IUIComponentTween
   {
       
      
      public function StdHideTween()
      {
         super();
      }
      
      public function execute(param1:IUIComponent) : void
      {
         TweenMax.killTweensOf(param1,true);
         param1.alpha = 0;
      }
      
      public function destruct() : void
      {
      }
   }
}
