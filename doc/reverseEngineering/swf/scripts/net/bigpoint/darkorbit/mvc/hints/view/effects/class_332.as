package net.bigpoint.darkorbit.mvc.hints.view.effects
{
   import com.greensock.TweenLite;
   import flash.display.DisplayObject;
   import package_121.class_331;
   
   public class class_332 implements class_331
   {
       
      
      private var var_2107:Number;
      
      public function class_332(param1:Number = 1)
      {
         super();
         this.var_2107 = param1;
      }
      
      public function show(param1:DisplayObject) : void
      {
         TweenLite.to(param1,1,{
            "autoAlpha":1,
            "onComplete":this.method_2,
            "onCompleteParams":[param1]
         });
      }
      
      private function method_2(param1:DisplayObject) : void
      {
         if(param1)
         {
            TweenLite.to(param1,0.5,{
               "delay":this.var_2107,
               "alpha":0.5
            });
         }
      }
      
      public function hide(param1:DisplayObject, param2:Function) : void
      {
         if(param1)
         {
            TweenLite.killTweensOf(param1);
            TweenLite.killDelayedCallsTo(param1);
            TweenLite.to(param1,0.5,{
               "autoAlpha":0,
               "onComplete":param2
            });
         }
      }
   }
}
