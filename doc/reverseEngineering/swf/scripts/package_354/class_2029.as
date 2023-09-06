package package_354
{
   import com.greensock.TweenMax;
   import flash.display.DisplayObjectContainer;
   import net.bigpoint.darkorbit.map.view2D.class_1206;
   import package_286.class_2019;
   import package_35.class_348;
   
   public class class_2029 extends class_2019
   {
       
      
      private var _tween:TweenMax;
      
      public function class_2029(param1:class_1206, param2:class_348)
      {
         super(param1,param2);
         this.startTween();
      }
      
      private function startTween() : void
      {
         this.method_4051();
      }
      
      private function method_4051() : void
      {
         var _loc1_:* = null;
         if(method_5878 != null)
         {
            if(this._tween != null)
            {
               this._tween.kill();
               this._tween = null;
            }
            _loc1_ = method_5878;
            if(_loc1_ != null)
            {
               this._tween = TweenMax.to(_loc1_,2,{
                  "alpha":0.1,
                  "onComplete":this.method_2598
               });
            }
         }
      }
      
      private function method_2598() : void
      {
         var _loc1_:* = null;
         if(method_5878 != null)
         {
            if(this._tween != null)
            {
               this._tween.kill();
               this._tween = null;
            }
            _loc1_ = method_5878;
            if(_loc1_ != null)
            {
               this._tween = TweenMax.to(_loc1_,2,{
                  "alpha":0.4,
                  "onComplete":this.method_4051
               });
            }
         }
      }
      
      override public function disposeView(param1:Boolean = false) : void
      {
         if(method_5878 != null)
         {
            if(this._tween != null)
            {
               this._tween.kill();
               this._tween = null;
            }
            TweenMax.to(method_5878,1,{"alpha":1});
         }
         super.disposeView(param1);
      }
   }
}
