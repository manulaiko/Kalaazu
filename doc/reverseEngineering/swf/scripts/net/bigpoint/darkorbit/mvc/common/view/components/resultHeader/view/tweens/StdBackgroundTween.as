package net.bigpoint.darkorbit.mvc.common.view.components.resultHeader.view.tweens
{
   import com.greensock.TweenMax;
   import mx.core.IUIComponent;
   
   public class StdBackgroundTween implements IUIComponentTween
   {
       
      
      private var _comp:IUIComponent;
      
      public function StdBackgroundTween()
      {
         super();
      }
      
      public function execute(param1:IUIComponent) : void
      {
         TweenMax.killTweensOf(param1,true);
         this._comp = param1;
         TweenMax.delayedCall(0.5,this.bgTween,[param1]);
      }
      
      private function bgTween(param1:IUIComponent) : void
      {
         param1.width = 1e-7;
         param1.height = 1e-7;
         param1.alpha = 0;
         TweenMax.to(param1,0.25,{
            "alpha":1,
            "width":512,
            "height":188,
            "onUpdate":this.centerBG,
            "onUpdateParams":[param1],
            "onComplete":this.tweenOut,
            "onCompleteParams":[param1]
         });
      }
      
      private function tweenOut(param1:IUIComponent) : void
      {
         TweenMax.to(param1,0.5,{
            "width":0,
            "delay":0.2,
            "height":0,
            "onUpdate":this.centerBG,
            "onUpdateParams":[param1]
         });
      }
      
      private function centerBG(param1:IUIComponent) : void
      {
         param1.x = Number(param1.parent.width) * 0.5 - Number(param1.width) * 0.5;
         param1.y = Number(param1.parent.height) * 0.5 - Number(param1.height) * 0.5;
      }
      
      public function destruct() : void
      {
         TweenMax.killTweensOf(this._comp,true);
      }
   }
}
